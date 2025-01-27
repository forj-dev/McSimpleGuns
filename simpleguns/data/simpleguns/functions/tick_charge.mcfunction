
# this.gun.chargeTicks--
# if(this.gun.chargeTicks<0){
#   this.gun.bullet+=this.gun.chargeBullet
#   this.gun.enable()
# }


#auxiliary entity for data modify
summon minecraft:armor_stand 0.0 0.0 0.0 {Tags:["simpleguns_carrier"],NoGravity:1b,Invulnerable:1b,Invisible:1b}

#copy gun item
item replace entity @e[type=minecraft:armor_stand,tag=simpleguns_carrier] weapon.mainhand from entity @s weapon.mainhand

#get bullet,charge bullet and charge ticks
execute store result score @s simpleguns_bullet run data get entity @e[type=minecraft:armor_stand,tag=simpleguns_carrier,limit=1] HandItems[0].tag.SimpleGuns.bullet
execute store result score @s simpleguns_chargeTicks run data get entity @e[type=minecraft:armor_stand,tag=simpleguns_carrier,limit=1] HandItems[0].tag.SimpleGuns.chargeTicks
execute store result score @s simpleguns_chargeBullet run data get entity @e[type=minecraft:armor_stand,tag=simpleguns_carrier,limit=1] HandItems[0].tag.SimpleGuns.chargeBullet

#step one tick
scoreboard players remove @s simpleguns_chargeTicks 1
execute store result entity @e[type=minecraft:armor_stand,tag=simpleguns_carrier,limit=1] HandItems[0].tag.SimpleGuns.chargeTicks int 1 run scoreboard players get @s simpleguns_chargeTicks

#if charged,then set bullet count
execute if score @s simpleguns_chargeTicks matches ..-1 run scoreboard players operation @s simpleguns_bullet += @s simpleguns_chargeBullet
execute if score @s simpleguns_chargeTicks matches ..-1 store result entity @e[type=minecraft:armor_stand,tag=simpleguns_carrier,limit=1] HandItems[0].tag.SimpleGuns.bullet int 1 run scoreboard players get @s simpleguns_bullet

#if charged,then enable gun
execute if score @s simpleguns_chargeTicks matches ..-1 run data modify entity @e[type=minecraft:armor_stand,tag=simpleguns_carrier,limit=1] HandItems[0].tag.Charged set value 1b

#give back gun item
item replace entity @s weapon.mainhand from entity @e[type=minecraft:armor_stand,tag=simpleguns_carrier,limit=1] weapon.mainhand

#clean up
kill @e[type=minecraft:armor_stand,tag=simpleguns_carrier]