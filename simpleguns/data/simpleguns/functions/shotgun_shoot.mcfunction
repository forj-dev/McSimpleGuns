
# shoot some bullets with the damage of the gun item and apply recoil

#temp entity
# ADJUST THE SPEED OF BULLET HERE
execute positioned 0.0 0.0 0.0 rotated as @s run summon minecraft:armor_stand ^ ^ ^5 {Tags:["simpleguns_shoot"],NoGravity:1b,Invulnerable:1b,Invisible:1b}

#load config
execute store result score shotgun_loop_count simpleguns_static run data get entity @s SelectedItem.tag.SimpleGuns.shots
execute store result score MotionRange simpleguns_static run data get entity @s SelectedItem.tag.SimpleGuns.motionRange 1000
scoreboard players operation MotionOffset simpleguns_static = MotionRange simpleguns_static
scoreboard players operation MotionOffset simpleguns_static /= const-2 simpleguns_static

#shoot arrows
function simpleguns:shotgun_shoot_loop

#apply recoil
execute store result score @s simpleguns_rotation run data get entity @s Rotation[1] 1000
scoreboard players operation @s simpleguns_rotation -= @s simpleguns_recoil
data modify entity @e[type=minecraft:armor_stand,tag=simpleguns_shoot,limit=1] Rotation[0] set from entity @s Rotation[0]
execute store result entity @e[type=minecraft:armor_stand,tag=simpleguns_shoot,limit=1] Rotation[1] float 0.001 run scoreboard players get @s simpleguns_rotation
execute at @s rotated as @e[type=minecraft:armor_stand,tag=simpleguns_shoot,limit=1] run tp @s ~ ~ ~ ~ ~

#clean up
kill @e[type=minecraft:armor_stand,tag=simpleguns_shoot]
