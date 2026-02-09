from PIL import Image
import os, random
from collections import deque

# ----------------------------
# Cluster extraction (8-connected)
# ----------------------------
def extract_clusters(img_rgba, alpha_threshold=0):
    """
    Returns a list of clusters.
    Each cluster is a dict:
      {
        "bbox": (minx, miny, maxx_plus1, maxy_plus1),
        "tile": PIL.Image (RGBA)  # cropped to bbox, with pixels outside cluster transparent
        "pos": (minx, miny)
      }
    """
    w, h = img_rgba.size
    px = img_rgba.load()

    visited = [[False]*h for _ in range(w)]
    clusters = []

    # 8-connected neighbor offsets
    nbrs = [(-1,-1),(0,-1),(1,-1),
            (-1, 0),      (1, 0),
            (-1, 1),(0, 1),(1, 1)]

    def is_on(x, y):
        r, g, b, a = px[x, y]
        return a > alpha_threshold

    for y in range(h):
        for x in range(w):
            if visited[x][y] or not is_on(x, y):
                continue

            # BFS flood-fill
            q = deque([(x, y)])
            visited[x][y] = True
            points = []

            minx = maxx = x
            miny = maxy = y

            while q:
                cx, cy = q.popleft()
                points.append((cx, cy))

                if cx < minx: minx = cx
                if cy < miny: miny = cy
                if cx > maxx: maxx = cx
                if cy > maxy: maxy = cy

                for dx, dy in nbrs:
                    nx, ny = cx + dx, cy + dy
                    if 0 <= nx < w and 0 <= ny < h and not visited[nx][ny] and is_on(nx, ny):
                        visited[nx][ny] = True
                        q.append((nx, ny))

            # Build a cropped tile image that contains ONLY this cluster
            bbox = (minx, miny, maxx + 1, maxy + 1)
            bw, bh = bbox[2] - bbox[0], bbox[3] - bbox[1]
            tile = Image.new("RGBA", (bw, bh), (0, 0, 0, 0))
            tile_px = tile.load()

            for px_x, px_y in points:
                r, g, b, a = px[px_x, px_y]
                tile_px[px_x - minx, px_y - miny] = (r, g, b, a)

            clusters.append({"bbox": bbox, "tile": tile, "pos": (minx, miny)})

    return clusters

# ----------------------------
# Build animated strip (16x640 = 40 frames)
# ----------------------------
def main():
    random.seed()  # or set a fixed int for reproducible results

    base_path = os.path.join("gen", "base.png")
    base = Image.open(base_path).convert("RGBA")

    if base.size != (16, 16):
        raise ValueError(f"base.png must be 16x16, got {base.size}")

    # Load overlays gen/0.png .. gen/12.png and extract clusters from each
    cluster_pool = []
    for i in range(13):
        p = os.path.join("gen", f"{i}.png")
        if not os.path.exists(p):
            continue
        overlay = Image.open(p).convert("RGBA")
        if overlay.size != (16, 16):
            raise ValueError(f"{i}.png must be 16x16, got {overlay.size}")

        clusters = extract_clusters(overlay, alpha_threshold=0)
        # Keep clusters "where they were": we store tile + original top-left position
        cluster_pool.extend(clusters)

    if not cluster_pool:
        raise RuntimeError("No clusters found in gen/0.png .. gen/12.png (non-transparent pixels).")

    frames = 40
    strip = Image.new("RGBA", (16, 16 * frames), (0, 0, 0, 0))

    for f in range(frames):
        frame = base.copy()

        # choose 2-4 clusters randomly (clamped to pool size)
        k = random.randint(2, 4)
        k = min(k, len(cluster_pool))
        chosen = random.sample(cluster_pool, k)

        # Paste each chosen cluster at its original coordinate
        for c in chosen:
            x, y = c["pos"]
            tile = c["tile"]
            # Use the tile's alpha as mask so only cluster pixels apply
            frame.paste(tile, (x, y), tile)

        strip.paste(frame, (0, 16 * f))

    cpy = strip.copy()
    for i in range(frames):
        cropped = strip.crop((0, i * 16, 16, (i + 1) * 16))
        cpy.paste(cropped, (0, ((i + 1) * 16) % 640, 16, ((i + 1) * 16) % 640 + 16), cropped)

    cpy.show()

if __name__ == "__main__":
    main()
