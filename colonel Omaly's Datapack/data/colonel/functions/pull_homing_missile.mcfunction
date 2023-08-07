execute at @s run execute as @e[tag=homing, limit=1, sort=nearest] store result score @s x run data get entity @s Pos[0] 100
execute at @s run execute as @e[tag=homing, limit=1, sort=nearest] store result score @s y run data get entity @s Pos[1] 100
execute at @s run execute as @e[tag=homing, limit=1, sort=nearest] store result score @s z run data get entity @s Pos[2] 100
execute store result score @s x run data get entity @s Pos[0] 100
execute store result score @s y run data get entity @s Pos[1] 100
execute store result score @s z run data get entity @s Pos[2] 100
execute at @s run scoreboard players operation @e[tag=homing, limit=1, sort=nearest] x >< @s x
execute at @s run scoreboard players operation @e[tag=homing, limit=1, sort=nearest] y >< @s y
execute at @s run scoreboard players operation @e[tag=homing, limit=1, sort=nearest] z >< @s z
execute at @s run scoreboard players operation @e[tag=homing, limit=1, sort=nearest] x -= @s x
execute at @s run scoreboard players operation @e[tag=homing, limit=1, sort=nearest] y -= @s y
execute at @s run scoreboard players operation @e[tag=homing, limit=1, sort=nearest] z -= @s z
execute at @s run execute as @e[tag=homing, limit=1, sort=nearest] store result entity @s Motion[0] double 0.0012 run scoreboard players get @s x
execute at @s run execute as @e[tag=homing, limit=1, sort=nearest] store result entity @s Motion[1] double 0.0012 run scoreboard players get @s y
execute at @s run execute as @e[tag=homing, limit=1, sort=nearest] store result entity @s Motion[2] double 0.0012 run scoreboard players get @s z
execute at @s run execute as @e[tag=homing, limit=1, sort=nearest] run tag @s remove homing


###for testing:
###execute as @s run say hi