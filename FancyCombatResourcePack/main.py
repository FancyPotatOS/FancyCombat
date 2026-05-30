

import os
from PIL import Image
import difflib


def replace_all(content, replacements: dict[str, str]):
    for key in replacements.keys():
        content = content.replace(key, replacements[key])
    
    return content


def replace_file(filename, replacements: dict[str, str]):
    contents = ""
    with open(filename, "r") as file:
        contents = "".join(file.readlines())
    
    target_file = replace_all(filename, replacements)
    with open(target_file, "w") as file:
        file.write(replace_all(contents, replacements))


def replace_files(path, replacements: dict[str, str]):
    for dir in [x for x in [f"{path}/{y}" for y in os.listdir(path)] if os.path.isdir(x)]:
        target_dir = replace_all(dir, replacements)

        if not os.path.exists(target_dir):
            os.mkdir(target_dir)
        
        replace_files(dir, replacements)
    
    for filename in [x for x in [f"{path}/{y}" for y in os.listdir(path)] if os.path.isfile(x)]:
        replace_file(filename, replacements)



raw_textures_folder = "C:/Users/caleb/AppData/Roaming/.minecraft/versions/1.21.11/assets/minecraft/textures/block"
raw_models_folder = "C:/Users/caleb/AppData/Roaming/.minecraft/versions/1.21.11/assets/minecraft/models/block"
raw_items_folder = "C:/Users/caleb/AppData/Roaming/.minecraft/versions/1.21.11/assets/minecraft/items"
item_names = [x.replace(".json", "") for x in os.listdir(raw_items_folder)]
model_names = [x.replace(".json", "") for x in os.listdir(raw_models_folder)]


texture_files = []
with open("block_textures.txt", "r") as file:
    texture_files = [x[:-1] for x in file.readlines()]

blocks = []
with open("full_blocks.txt", "r") as file:
    blocks = [x[:-1] for x in file.readlines()]

saved_textures = []
for texture_file in texture_files:
    img = Image.open(f"{raw_textures_folder}/{texture_file}.png").convert("RGBA")

    if img.size[0] != 16 or img.getextrema()[3][0] == 0:
        print("skipping", texture_file)
        if texture_file in blocks:
            blocks.remove(texture_file)
        continue

    # Might be animated, take the first square
    img = img.crop((0, 0, 16, 16))

    saved_textures.append((texture_file, img))

mask_head = Image.open("assets/morecombat/textures/entity/equipment/humanoid/camo/head_mask.png").convert("RGBA")
mask_chest = Image.open("assets/morecombat/textures/entity/equipment/humanoid/camo/chest_mask.png").convert("RGBA")
mask_feet = Image.open("assets/morecombat/textures/entity/equipment/humanoid/camo/feet_mask.png").convert("RGBA")
mask_leggings = Image.open("assets/morecombat/textures/entity/equipment/humanoid_leggings/camo/legs_mask.png").convert("RGBA")

# mask_head = mask_head.resize((mask_head.size[0] * 2, mask_head.size[1] * 2), Image.Resampling.NEAREST)
# mask_chest = mask_chest.resize((mask_chest.size[0] * 2, mask_chest.size[1] * 2), Image.Resampling.NEAREST)
# mask_feet = mask_feet.resize((mask_feet.size[0] * 2, mask_feet.size[1] * 2), Image.Resampling.NEAREST)
# mask_leggings = mask_leggings.resize((mask_leggings.size[0] * 2, mask_leggings.size[1] * 2), Image.Resampling.NEAREST)

priority_matches = ["_side", "_0", "_front", "north", "_east", "south", "_west", None, "_open", "_top", "_bottom", "_on"]
def get_priority(item):
    index = 0
    for priority in priority_matches:
        if priority and priority in item:
            return 7 - index
        index += 1
    return 0


used_items = []
for saved_texture in saved_textures:
    texture_name = saved_texture[0]
    block_texture = saved_texture[1]
    img_head = mask_head.copy()
    img_chest = mask_chest.copy()
    img_feet = mask_feet.copy()
    img_legs = mask_leggings.copy()

    match_check = texture_name
    for x in priority_matches:
        if not x:
            continue
        match_check = match_check.replace(x, "")
    closest_item = ""
    if texture_name in blocks:
        closest_item = texture_name
    else:
        closest_item = difflib.get_close_matches(match_check, blocks, n=1, cutoff=0.4)[0]

    match_item = [x for x in used_items if closest_item == x[0]]
    current_priority = 1000 if closest_item == texture_name else get_priority(texture_name)
    matched = []
    if match_item:
        matched = match_item[0]
        match_item = match_item[0]
        # This match has a higher priority
        if match_item[1] < current_priority:
            print(f"Match {texture_name} was higher than {match_item[2]} to {match_item[0]}")
            match_item[1] = current_priority
            match_item[2] = texture_name
        else:
            print(f"Match {texture_name} was lower than {match_item[2]} to {match_item[0]}")

            continue
    else:
        matched = [closest_item, current_priority, texture_name, None, None, None, None]
        used_items.append(matched)

    for x in range(0, img_head.width, block_texture.size[0]):
        for y in range(0, img_head.height, block_texture.size[1]):
            img_head.paste(block_texture, (x, y), mask=img_head.crop((x, y, x + 16, y + 16)))
            img_chest.paste(block_texture, (x, y), mask=img_chest.crop((x, y, x + 16, y + 16)))
            img_feet.paste(block_texture, (x, y), mask=img_feet.crop((x, y, x + 16, y + 16)))
            img_legs.paste(block_texture, (x, y), mask=img_legs.crop((x, y, x + 16, y + 16)))
    
    matched[3] = img_head
    matched[4] = img_chest
    matched[5] = img_legs
    matched[6] = img_feet

target_equipment_path = "C:/Users/caleb/AppData/Roaming/.minecraft/resourcepacks/FancyCombatResourcePack - 1.21.11/assets/morecombat/equipment/camo/block/_SLOT_/_ITEM_.json"

target_texture_humanoid_path = "C:/Users/caleb/AppData/Roaming/.minecraft/resourcepacks/FancyCombatResourcePack - 1.21.11/assets/morecombat/textures/entity/equipment/humanoid/camo/block/_SLOT_"
target_texture_humanoid_leggings_path = "C:/Users/caleb/AppData/Roaming/.minecraft/resourcepacks/FancyCombatResourcePack - 1.21.11/assets/morecombat/textures/entity/equipment/humanoid_leggings/camo/block"

target_block_apply_function = "C:/Users/caleb/AppData/Roaming/.minecraft/saves/Creative - 1_21_11/datapacks/FancyCombat/data/morecombat/function/functionality/camo/_SLOT_"

index = 0
for slot in ["head", "chest", "legs", "feet"]:
    for used_item in used_items:
        item = used_item[0]
        img = used_item[3 + index]

        replacements = {
            "_ITEM_": item,
            "_SLOT_": slot,
            "_IFLEGGINGS_": "_leggings" if slot == "legs" else "",
            "_SLOTSLASHNOTLEGS_": "" if slot == "legs" else f"{slot}/"
        }

        # Equipment
        replace_file(target_equipment_path, replacements)
            
        replace_files(target_block_apply_function, replacements)
            
        # Item
        img.save(replace_all(f"{target_texture_humanoid_leggings_path if slot == "legs" else target_texture_humanoid_path}/{item}.png", replacements))
    index += 1

# Batching
MAX_BATCH_SIZE = 8
BATCH_BRANCH_SIZE = 8

binary_path = "C:/Users/caleb/AppData/Roaming/.minecraft/saves/Creative - 1_21_11/datapacks/FancyCombat/data/morecombat/function/functionality/camo/_SLOT_/binary/_NAME_.mcfunction"
tag_path = "C:/Users/caleb/AppData/Roaming/.minecraft/saves/Creative - 1_21_11/datapacks/FancyCombat/data/morecombat/tags/block/camo/branches/_NAME_.json"
pathing_raw = "execute if block ~ ~ ~ _TAG_ run function morecombat:functionality/camo/_SLOT_/block/_NEXTLEVEL_"
branching_raw = "execute if block ~ ~ ~ _TAG_ run function morecombat:functionality/camo/_SLOT_/binary/_NEXTLEVEL_"

for slot in ["head", "chest", "legs", "feet"]:
    batches = used_items
    temp_batches = []
    branch_index = 0
    while len(batches) != 1:
        next_batches = []
        min_range = 0
        # Un-batch them
        while True:
            # Get maximums
            max_range = min(min_range + MAX_BATCH_SIZE, len(batches))
            # None are taken out
            if max_range <= min_range:
                break
            
            # Get it batched up
            temp_batches = batches[min_range:max_range]
            
            branch_name = str(branch_index)
            next_batches.append(branch_name)
            branch_index += 1
            replacements = {
                "_NAME_": branch_name,
                "_SLOT_": slot,
                "_IFLEGGINGS_": "_leggings" if slot == "legs" else "",
            }

            # Gather the pathing data
            path_coll = []
            tag_coll = []
            for batch in temp_batches:
                # # Is the lowest level - blocks
                if type(temp_batches[0]) is list:
                    item = batch[0]
                    replacements["_TAG_"] = f"minecraft:{item}"
                    replacements["_NEXTLEVEL_"] = item
                    path_coll.append(replace_all(pathing_raw, replacements))
                    tag_coll.append(replace_all('        "_TAG_"', replacements))
                # # Mid-level - branch name
                else:
                    replacements["_TAG_"] = f"#morecombat:camo/branches/{batch}"
                    replacements["_NEXTLEVEL_"] = batch
                    path_coll.append(replace_all(branching_raw, replacements))
                    tag_coll.append(replace_all('        "_TAG_"', replacements))
                branch_name = str(branch_index)
                branch_index += 1
            
            replacements["_PATHING_"] = "\n".join(path_coll)
            replacements["_BRANCHES_"] = ",\n".join(tag_coll)
            replace_file(binary_path, replacements)
            replace_file(tag_path, replacements)

            # Move page over
            min_range = max_range

        batches = next_batches

