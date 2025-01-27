
#the loop in shotgun_shoot.mcfunction

#spawn bullet
execute at @s anchored eyes run summon minecraft:arrow ^ ^ ^0.5 {Tags:["simpleguns_shooted","simpleguns_bullet"]}

#load motion to scoreboard
execute store result score motionX simpleguns_static run data get entity @e[type=minecraft:armor_stand,tag=simpleguns_shoot,limit=1] Pos[0] 1000
execute store result score motionY simpleguns_static run data get entity @e[type=minecraft:armor_stand,tag=simpleguns_shoot,limit=1] Pos[1] 1000
execute store result score motionZ simpleguns_static run data get entity @e[type=minecraft:armor_stand,tag=simpleguns_shoot,limit=1] Pos[2] 1000

#apply random offset
scoreboard players operation random simpleguns_static *= randmul simpleguns_static
scoreboard players operation random simpleguns_static += randadd simpleguns_static
scoreboard players operation random simpleguns_static %= randmod simpleguns_static
scoreboard players operation temp simpleguns_static = random simpleguns_static
scoreboard players operation temp simpleguns_static %= MotionRange simpleguns_static
scoreboard players operation temp simpleguns_static += MotionOffset simpleguns_static
scoreboard players operation motionX simpleguns_static += temp simpleguns_static

scoreboard players operation random simpleguns_static *= randmul simpleguns_static
scoreboard players operation random simpleguns_static += randadd simpleguns_static
scoreboard players operation random simpleguns_static %= randmod simpleguns_static
scoreboard players operation temp simpleguns_static = random simpleguns_static
scoreboard players operation temp simpleguns_static %= MotionRange simpleguns_static
scoreboard players operation temp simpleguns_static += MotionOffset simpleguns_static
scoreboard players operation motionY simpleguns_static += temp simpleguns_static

scoreboard players operation random simpleguns_static *= randmul simpleguns_static
scoreboard players operation random simpleguns_static += randadd simpleguns_static
scoreboard players operation random simpleguns_static %= randmod simpleguns_static
scoreboard players operation temp simpleguns_static = random simpleguns_static
scoreboard players operation temp simpleguns_static %= MotionRange simpleguns_static
scoreboard players operation temp simpleguns_static += MotionOffset simpleguns_static
scoreboard players operation motionZ simpleguns_static += temp simpleguns_static

#set motion
execute store result entity @e[type=minecraft:arrow,tag=simpleguns_shooted,limit=1] Motion[0] double 0.001 run scoreboard players get motionX simpleguns_static
execute store result entity @e[type=minecraft:arrow,tag=simpleguns_shooted,limit=1] Motion[1] double 0.001 run scoreboard players get motionY simpleguns_static
execute store result entity @e[type=minecraft:arrow,tag=simpleguns_shooted,limit=1] Motion[2] double 0.001 run scoreboard players get motionZ simpleguns_static

#set damage
data modify entity @e[type=minecraft:arrow,tag=simpleguns_shooted,limit=1] damage set from entity @s SelectedItem.tag.SimpleGuns.damage

#set attacker
data modify entity @e[type=minecraft:arrow,tag=simpleguns_shooted,limit=1] Owner set from entity @s UUID

#clean up
tag @e[type=minecraft:arrow,tag=simpleguns_shooted] remove simpleguns_shooted

#loop
scoreboard players remove shotgun_loop_count simpleguns_static 1
execute if score shotgun_loop_count simpleguns_static matches 1.. run function simpleguns:shotgun_shoot_loop
