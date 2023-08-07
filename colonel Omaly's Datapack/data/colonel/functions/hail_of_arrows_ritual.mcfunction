scoreboard players add @s hail_of_arrows_ct 1
execute at @s run summon armor_stand ^ ^2 ^ {Tags:["hail_of_arrows_ritual", "ticklife"], Invisible:true}
execute at @s run function colonel:hail_of_arrow_ring
###execute at @s run execute at @e[type=armor_stand,tag=hail_of_arrows_ritual,distance=..2, limit=1, sort=nearest] run say hi
execute at @s run execute as @e[type=armor_stand,tag=hail_of_arrows_ritual,distance=..2, limit=1, sort=nearest] run kill @s
execute at @s[scores={hail_of_arrows_ct=60}] run function colonel:hail_of_arrows_cast
