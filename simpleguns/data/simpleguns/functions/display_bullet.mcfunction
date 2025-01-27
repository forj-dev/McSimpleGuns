
# if (this.gun.charging) this.msg("<< Charging >>","blue")
# else if (this.gun.bullet==0) this.msg("<< No Bullet >>","red")
# else this.msg(f"<< Bullet: {this.gun.bullet}/{this.gun.maxBullet} >>","gold")


#update scores
execute store result score @s simpleguns_bullet run data get entity @s SelectedItem.tag.SimpleGuns.bullet
execute store result score @s simpleguns_chargeTicks run data get entity @s SelectedItem.tag.SimpleGuns.chargeTicks

#display
execute if score @s simpleguns_bullet matches 1.. if score @s simpleguns_chargeTicks matches -1 run title @s actionbar [{"text":"<< Bullet: ","color":"gold"},{"nbt":"SelectedItem.tag.SimpleGuns.bullet","entity":"@s"},{"text":"/"},{"nbt":"SelectedItem.tag.SimpleGuns.maxBullet","entity":"@s"},{"text":" >>"}]
execute unless score @s simpleguns_bullet matches 1.. if score @s simpleguns_chargeTicks matches -1 run title @s actionbar {"text":"<< No Bullet >>","color":"red"}
execute if score @s simpleguns_chargeTicks matches 0.. run title @s actionbar {"text":"<< Charging >>","color":"blue"}
