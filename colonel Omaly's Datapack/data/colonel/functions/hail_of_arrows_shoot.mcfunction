execute at @s run execute as @e[type=armor_stand,tag=hail_of_arrows_cast,distance=0.9..1.1, limit=1, sort=nearest] store result score @s x run data get entity @s Pos[0] 100
execute at @s run execute as @e[type=armor_stand,tag=hail_of_arrows_cast,distance=0.9..1.1, limit=1, sort=nearest] store result score @s y run data get entity @s Pos[1] 100
execute at @s run execute as @e[type=armor_stand,tag=hail_of_arrows_cast,distance=0.9..1.1, limit=1, sort=nearest] store result score @s z run data get entity @s Pos[2] 100
execute at @s run execute store result score @s x run data get entity @s Pos[0] 100
execute at @s run execute store result score @s y run data get entity @s Pos[1] 100
execute at @s run execute store result score @s z run data get entity @s Pos[2] 100
execute at @s run scoreboard players operation @s x -= @e[type=armor_stand,tag=hail_of_arrows_cast,distance=0.9..1.1, limit=1, sort=nearest] x
execute at @s run scoreboard players operation @s y -= @e[type=armor_stand,tag=hail_of_arrows_cast,distance=0.9..1.1, limit=1, sort=nearest] y
execute at @s run scoreboard players operation @s z -= @e[type=armor_stand,tag=hail_of_arrows_cast,distance=0.9..1.1, limit=1, sort=nearest] z

execute at @s run execute as @e[type=arrow,tag=hail_of_arrows, limit=24, sort=nearest] store result entity @s Motion[0] double 0.02 run scoreboard players get @e[type=armor_stand,tag=hail_of_arrows_cast2, limit=1, sort=nearest] x
execute at @s run execute as @e[type=arrow,tag=hail_of_arrows, limit=24, sort=nearest] store result entity @s Motion[1] double 0.02 run scoreboard players get @e[type=armor_stand,tag=hail_of_arrows_cast2, limit=1, sort=nearest] y
execute at @s run execute as @e[type=arrow,tag=hail_of_arrows, limit=24, sort=nearest] store result entity @s Motion[2] double 0.02 run scoreboard players get @e[type=armor_stand,tag=hail_of_arrows_cast2, limit=1, sort=nearest] z
###doesnt work for some reason:
execute at @s run execute as @e[type=arrow,tag=hail_of_arrows, limit=24, sort=nearest] run tag @s remove hail_of_arrows


###testing:
###tellraw @p {"score":{"name":"@s","objective":"x"}}
###tellraw @p {"score":{"name":"@e[type=armor_stand,tag=hail_of_arrows_cast,distance=1.9..2.1, limit=1, sort=nearest]","objective":"x"}}
###execute at @s run execute as @e[type=arrow,tag=hail_of_arrows, limit=1, sort=nearest] run say hi