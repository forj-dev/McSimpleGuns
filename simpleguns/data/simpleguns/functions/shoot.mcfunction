
# shoot a bullet with the damage of the gun item and apply recoil

#spawn temp entity
# ADJUST THE SPEED OF BULLET HERE
execute positioned 0.0 0.0 0.0 rotated as @s run summon minecraft:armor_stand ^ ^ ^10 {Tags:["simpleguns_shoot"],NoGravity:1b,Invulnerable:1b,Invisible:1b}

#spawn bullet
execute at @s anchored eyes run summon minecraft:arrow ^ ^ ^0.5 {Tags:["simpleguns_shooted","simpleguns_bullet"]}

#set motion
data modify entity @e[type=minecraft:arrow,tag=simpleguns_shooted,limit=1] Motion set from entity @e[type=minecraft:armor_stand,tag=simpleguns_shoot,limit=1] Pos

#set damage
data modify entity @e[type=minecraft:arrow,tag=simpleguns_shooted,limit=1] damage set from entity @s SelectedItem.tag.SimpleGuns.damage

#set attacker
data modify entity @e[type=minecraft:arrow,tag=simpleguns_shooted,limit=1] Owner set from entity @s UUID

#apply recoil
execute store result score @s simpleguns_rotation run data get entity @s Rotation[1] 1000
scoreboard players operation @s simpleguns_rotation -= @s simpleguns_recoil
data modify entity @e[type=minecraft:armor_stand,tag=simpleguns_shoot,limit=1] Rotation[0] set from entity @s Rotation[0]
execute store result entity @e[type=minecraft:armor_stand,tag=simpleguns_shoot,limit=1] Rotation[1] float 0.001 run scoreboard players get @s simpleguns_rotation
execute at @s rotated as @e[type=minecraft:armor_stand,tag=simpleguns_shoot,limit=1] run tp @s ~ ~ ~ ~ ~

#clean up
tag @e[type=minecraft:arrow,tag=simpleguns_shooted] remove simpleguns_shooted
kill @e[type=minecraft:armor_stand,tag=simpleguns_shoot]
