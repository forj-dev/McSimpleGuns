
# if (!this.gun.charging() && this.gun.bullet<this.gun.maxBullet && this.countGunpowder()>0) charge()
# this.select(this.gun)


#auxiliary entity for data modify
summon minecraft:armor_stand 0.0 0.0 0.0 {Tags:["simpleguns_carrier"],NoGravity:1b,Invulnerable:1b,Invisible:1b}

#copy gun item
item replace entity @e[type=minecraft:armor_stand,tag=simpleguns_carrier] weapon.mainhand from entity @s weapon.offhand

#get bullet,max bullet and gunpowder count
execute store result score @s simpleguns_bullet run data get entity @e[type=minecraft:armor_stand,tag=simpleguns_carrier,limit=1] HandItems[0].tag.SimpleGuns.bullet
execute store result score @s simpleguns_chargeTicks run data get entity @e[type=minecraft:armor_stand,tag=simpleguns_carrier,limit=1] HandItems[0].tag.SimpleGuns.chargeTicks
execute store result score @s simpleguns_maxBullet run data get entity @e[type=minecraft:armor_stand,tag=simpleguns_carrier,limit=1] HandItems[0].tag.SimpleGuns.maxBullet
execute store result score @s simpleguns_gunpowder run clear @s minecraft:gunpowder{SimpleGuns_Gunpowder:1b} 0

#if can charge,then charge
execute if score @s simpleguns_bullet < @s simpleguns_maxBullet if score @s simpleguns_chargeTicks matches -1 if score @s simpleguns_gunpowder matches 1.. run function simpleguns:charge

#empty main hand
item replace entity @s weapon.offhand from entity @s weapon.mainhand

#give back gun item
item replace entity @s weapon.mainhand from entity @e[type=minecraft:armor_stand,tag=simpleguns_carrier,limit=1] weapon.mainhand

#clean up
kill @e[type=minecraft:armor_stand,tag=simpleguns_carrier]
