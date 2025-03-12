
forceload add 0 0 0 0

scoreboard objectives add simpleguns_bullet dummy
scoreboard objectives add simpleguns_cooldownTicks dummy
scoreboard objectives add simpleguns_chargeBullet dummy
scoreboard objectives add simpleguns_chargeTicks dummy
scoreboard objectives add simpleguns_gunpowder dummy
scoreboard objectives add simpleguns_maxBullet dummy
scoreboard objectives add simpleguns_recoil dummy
scoreboard objectives add simpleguns_rotation dummy

scoreboard objectives add simpleguns_static dummy

scoreboard objectives add simpleguns_carrot_trigger minecraft.used:minecraft.carrot_on_a_stick

scoreboard players set const-2 simpleguns_static -2
scoreboard players set randmod simpleguns_static 1000000009
scoreboard players set randadd simpleguns_static 1117
scoreboard players set randmul simpleguns_static 277
