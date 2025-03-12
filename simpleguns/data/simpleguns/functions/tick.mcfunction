
#logic

execute as @a if data entity @s SelectedItem.tag.SimpleGuns unless entity @s[nbt={SelectedItem:{tag:{SimpleGuns:{chargeTicks:-1}}}}] run function simpleguns:tick_charge

execute as @a if data entity @s SelectedItem.tag.SimpleGuns unless entity @s[nbt={SelectedItem:{tag:{SimpleGuns:{cooldownTicks:0}}}}] run function simpleguns:tick_cooldown

execute as @a if entity @s[nbt={SelectedItem:{tag:{Charged:0b,SimpleGuns:{cooldownTicks:0}}}}] at @s run function simpleguns:try_fire
execute as @a if score @s simpleguns_carrot_trigger matches 1.. if entity @s[nbt={SelectedItem:{tag:{SimpleGuns:{cooldownTicks:0}}}}] at @s run function simpleguns:try_fire

execute as @a if entity @s[nbt={Inventory:[{Slot:-106b,tag:{SimpleGuns:{}}}]}] unless data entity @s SelectedItem.tag.SimpleGuns run function simpleguns:try_charge

scoreboard players reset @a simpleguns_carrot_trigger

#render

execute as @a if data entity @s SelectedItem.tag.SimpleGuns run function simpleguns:display_bullet
