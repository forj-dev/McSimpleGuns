
# this.gun.chargeBullet = max(this.gun.maxBullet-this.gun.bullet,this.gunpowder)
# this.gun.chargeTicks = this.gun.maxChargeTicks
# this.gun.disable()
# this.removeGunpowder(this.gun.maxBullet-this.gun.bullet)


#calculate charge count
scoreboard players operation @s simpleguns_maxBullet -= @s simpleguns_bullet
execute if score @s simpleguns_gunpowder < @s simpleguns_maxBullet run scoreboard players operation @s simpleguns_maxBullet = @s simpleguns_gunpowder

#set charge count
execute store result entity @e[type=minecraft:armor_stand,tag=simpleguns_carrier,limit=1] HandItems[0].tag.SimpleGuns.chargeBullet int 1 run scoreboard players get @s simpleguns_maxBullet

#set charge ticks
data modify entity @e[type=minecraft:armor_stand,tag=simpleguns_carrier,limit=1] HandItems[0].tag.SimpleGuns.chargeTicks set from entity @e[type=minecraft:armor_stand,tag=simpleguns_carrier,limit=1] HandItems[0].tag.SimpleGuns.maxChargeTicks

#disable gun
data modify entity @e[type=minecraft:armor_stand,tag=simpleguns_carrier,limit=1] HandItems[0].tag.Charged set value 0b

#remove gunpowder(argument: @s simpleguns_maxBullet -> removeCount)
execute if entity @s[gamemode=!creative] run function simpleguns:remove_gunpowder
