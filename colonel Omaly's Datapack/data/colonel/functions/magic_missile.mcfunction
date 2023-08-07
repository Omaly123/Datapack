execute at @s run summon arrow ^ ^1 ^1 {Tags:["magic_missile"],Glowing:true, Color:2725887, SoundEvent:"entity.ender_eye.death"}
execute at @s run summon armor_stand ^ ^1 ^ {Tags:["magic_missile"], NoGravity:true, Invisible:true}
execute at @s run execute as @e[type=armor_stand,tag=magic_missile, limit=1, sort=nearest] run function colonel:propell_magic_missile
execute at @s run execute as @e[type=armor_stand,tag=magic_missile, limit=1, sort=nearest] run kill @s