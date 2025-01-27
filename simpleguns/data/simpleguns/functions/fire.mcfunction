
# this.gun.shoot()
# this.gun.playEffect()
# this.gun.bullet--
# this.gun.cooldownTicks=this.gun.cooldown
# if (this.gun.bullet>0 && this.gun.cooldown==0) this.gun.enable()
# else this.gun.disable()


#remove a bullet
execute store result score @s simpleguns_bullet run data get entity @s SelectedItem.tag.SimpleGuns.bullet
scoreboard players remove @s simpleguns_bullet 1

#load recoil value
execute store result score @s simpleguns_recoil run data get entity @s SelectedItem.tag.SimpleGuns.recoil 1000

#shoot
execute if data entity @s SelectedItem.tag.SimpleGuns.shots run function simpleguns:shotgun_shoot
execute unless data entity @s SelectedItem.tag.SimpleGuns.shots run function simpleguns:shoot

#particles
execute if entity @s[nbt={SelectedItem:{tag:{SimpleGuns:{silencer:0b}}}}] at @s anchored eyes run particle minecraft:crit ^ ^ ^1 0.01 0.01 0.01 0.01 1 normal
execute if entity @s[nbt={SelectedItem:{tag:{SimpleGuns:{silencer:0b}}}}] at @s anchored eyes run particle minecraft:enchanted_hit ^ ^ ^0.5 0.01 0.01 0.01 0.01 1 normal

#sound effect
playsound minecraft:item.flintandsteel.use player @s ~ ~ ~ 0.5 0.7
playsound minecraft:block.wooden_door.open player @s ~ ~ ~ 0.5 2
execute if entity @s[nbt={SelectedItem:{tag:{SimpleGuns:{flameArrester:0b}}}}] at @s run playsound minecraft:entity.generic.explode player @a[distance=..100] ~ ~ ~ 1 1.3
execute if entity @s[nbt={SelectedItem:{tag:{SimpleGuns:{flameArrester:0b}}}}] at @s run playsound minecraft:entity.firework_rocket.blast_far player @a[distance=..100] ~ ~ ~ 2 1
execute if entity @s[nbt={SelectedItem:{tag:{SimpleGuns:{flameArrester:0b}}}}] at @s run playsound minecraft:entity.firework_rocket.large_blast_far player @a[distance=..100] ~ ~ ~ 2 1.4

#update gun item

#auxiliary entity for data modify
summon minecraft:armor_stand 0.0 0.0 0.0 {Tags:["simpleguns_carrier"],NoGravity:1b,Invulnerable:1b,Invisible:1b}

#copy gun item
item replace entity @e[type=minecraft:armor_stand,tag=simpleguns_carrier] weapon.mainhand from entity @s weapon.mainhand

#set bullet count
execute store result entity @e[type=minecraft:armor_stand,tag=simpleguns_carrier,limit=1] HandItems[0].tag.SimpleGuns.bullet int 1 run scoreboard players get @s simpleguns_bullet

#set cooldown
data modify entity @e[type=minecraft:armor_stand,tag=simpleguns_carrier,limit=1] HandItems[0].tag.SimpleGuns.cooldownTicks set from entity @e[type=minecraft:armor_stand,tag=simpleguns_carrier,limit=1] HandItems[0].tag.SimpleGuns.cooldown

#enable/disable gun
execute if score @s simpleguns_bullet matches 1.. if entity @e[type=minecraft:armor_stand,tag=simpleguns_carrier,limit=1,nbt={HandItems:[{tag:{SimpleGuns:{cooldownTicks:0}}},{}]}] run data modify entity @e[type=minecraft:armor_stand,tag=simpleguns_carrier,limit=1] HandItems[0].tag.Charged set value 1b
execute unless score @s simpleguns_bullet matches 1.. run data modify entity @e[type=minecraft:armor_stand,tag=simpleguns_carrier,limit=1] HandItems[0].tag.Charged set value 0b
execute unless entity @e[type=minecraft:armor_stand,tag=simpleguns_carrier,limit=1,nbt={HandItems:[{tag:{SimpleGuns:{cooldownTicks:0}}},{}]}] run data modify entity @e[type=minecraft:armor_stand,tag=simpleguns_carrier,limit=1] HandItems[0].tag.Charged set value 0b

#give back gun item
item replace entity @s weapon.mainhand from entity @e[type=minecraft:armor_stand,tag=simpleguns_carrier,limit=1] weapon.mainhand

#clean up
kill @e[type=minecraft:armor_stand,tag=simpleguns_carrier]
