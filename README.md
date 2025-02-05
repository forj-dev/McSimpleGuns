# McSimpleGuns
Vanilla Minecraft datapack. Add customizable guns to the game

## Supported Versions
1.16.2 - 1.19.3

## How to use it

Put the datapack in the datapacks folder and use /reload to load it.

## Create guns

### Normal guns

/give @s minecraft:crossbow{SimpleGuns:{maxBullet:\<MaxCanChargeBullet>,bullet:\<CurrentChargedBullet>,damage:\<DamageOfTheBullet>d,maxChargeTicks:\<TimeOfCharging(gt)>,chargeTicks:-1,cooldown:\<TimePerShoot>,cooldownTicks:0,recoil:\<Recoil(degrees)>,silencer:\<Silencer(1b for enable, 0b for disable)>,flameArrester:\<FlameArrester(1b for enable, 0b for disable)>},Unbreakable:1b,Enchantments:[{"id":"minecraft:unbreaking",lvl:1}],Charged:1b,HideFlags:255,display:{<PutAnythingHere=]>}}

### Shotguns

/give @s minecraft:crossbow{SimpleGuns:{maxBullet:\<MaxCanChargeBullet>,bullet:\<CurrentChargedBullet>,damage:\<DamageOfTheBullet>d,maxChargeTicks:\<TimeOfCharging(gt)>,chargeTicks:-1,cooldown:\<TimePerShoot>,cooldownTicks:0,recoil:\<Recoil(degrees)>,silencer:\<Silencer(1b for enable, 0b for disable)>,flameArrester:\<FlameArrester(1b for enable, 0b for disable)>,shots:\<ShotsEveryFire>,motionRange:\<RangeOfRandomOfShotsVelocityOffset>},Unbreakable:1b,Enchantments:[{"id":"minecraft:unbreaking",lvl:1}],Charged:1b,HideFlags:255,display:{<PutAnythingHere=]>}}

### Replace the <> in the command above and you can get a custom gun

### The 'damage' above is not the real damage! real damage=damage*speed(default 10)
You can modify the speed in simpleguns/data/simpleguns/functions/shoot.mcfunction
