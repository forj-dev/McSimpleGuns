
# if (this.selectedGun && this.gun.bullet>0 && this.gun.chargedTicks==-1) fire()

execute store result score @s simpleguns_bullet run data get entity @s SelectedItem.tag.SimpleGuns.bullet
execute store result score @s simpleguns_chargeTicks run data get entity @s SelectedItem.tag.SimpleGuns.chargeTicks

execute if score @s simpleguns_bullet matches 1.. if score @s simpleguns_chargeTicks matches -1 run function simpleguns:fire
