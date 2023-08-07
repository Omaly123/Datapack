execute as @s run function colonel:tick_classes

###needed to enable cooldowns:
scoreboard players set @a[tag=!enabled] fireball_cd 0
scoreboard players set @a[tag=!enabled] firebarrage_cd 0
scoreboard players set @a[tag=!enabled] magic_missile_cd 0
scoreboard players set @a[tag=!enabled] shield_cd 0
scoreboard players set @a[tag=!enabled] teleport_cd 0
scoreboard players set @a[tag=!enabled] teleport_charge 600
scoreboard players set @a[tag=!enabled] teleport_ritual 0
scoreboard players set @a[tag=!enabled] x 0
scoreboard players set @a[tag=!enabled] y 0
scoreboard players set @a[tag=!enabled] z 0
scoreboard players set @a[tag=!enabled] hail_of_arrows_cd 0
scoreboard players set @a[tag=!enabled] hail_of_arrows_ct 0
tag @a[tag=!enabled] add enabled

###killing unneeded armor stands and entities with set lifetime:
execute as @e[tag=ticklife] run scoreboard players set @s lifetime 0
execute as @e[tag=ticklife] run tag @s remove ticklife
execute as @e[scores={lifetime=1..}] run scoreboard players operation @s lifetime -= #1 num
execute as @e[scores={lifetime=0}] run kill @s

###PLatform
execute at @a[predicate=colonel:has_spellbook_buildplatform,scores={isMod=1}] run function colonel:build_platform

###Staff
###Detect players right clicking with carrot on a stick
execute as @a[scores={staff=1..},nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{colonel_staff:1b}}}] at @s run say Staff
###teleportation
execute as @a[nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{colonel_staff_of_teleportation:1b}}}] at @s run execute at @s run particle minecraft:dust 0.333 0.027 0.733 0.4 ^ ^0.8 ^20 0 0 0 0 1 force @s
execute as @a[scores={staff=1..,teleport_charge=200..},nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{colonel_staff_of_teleportation:1b}}}] at @s run playsound entity.enderman.teleport player @a[distance=..50] ~ ~ ~ 0.2
execute as @a[scores={staff=1..,teleport_charge=200..},nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{colonel_staff_of_teleportation:1b}}}] at @s run function colonel:teleporting_pixel
execute as @a[scores={staff=1..,teleport_charge=200..},nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{colonel_staff_of_teleportation:1b}}}] at @s run execute at @s run tp @s ^ ^0.8 ^20 
execute as @a[scores={staff=1..,teleport_charge=200..},nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{colonel_staff_of_teleportation:1b}}}] run scoreboard players remove @s teleport_charge 200
execute as @a[scores={staff=1..,teleport_charge=200..},nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{colonel_staff_of_teleportation:1b}}}] at @s run function colonel:teleporting_pixel
execute as @a[scores={staff=1..,teleport_charge=200..},nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{colonel_staff_of_teleportation:1b}}}] at @s run playsound entity.enderman.teleport player @a[distance=..50] ~ ~ ~ 0.2
execute as @a[nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{colonel_staff_of_teleportation:1b}}}] run bossbar set teleport_charge0 players @a[scores={teleport_charge=0..199}]
execute as @a[nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{colonel_staff_of_teleportation:1b}}}] run bossbar set teleport_charge1 players @a[scores={teleport_charge=200..399}]
execute as @a[nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{colonel_staff_of_teleportation:1b}}}] run bossbar set teleport_charge2 players @a[scores={teleport_charge=400..599}]
execute as @a[nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{colonel_staff_of_teleportation:1b}}}] run bossbar set teleport_charge3 players @a[predicate=colonel:has_spellbook_teleportation,scores={teleport_charge=600..}]
###levitate
###execute as @a[nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{colonel_staff_of_levitate:1b}}}] at @s run 
###reset Staff score
scoreboard players remove @a[scores={staff=1..}] staff 1


###Fireball
execute at @a[predicate=colonel:has_spellbook_fireball, predicate=colonel:is_sneaking, scores={fireball_cd=0}] run summon fireball ^ ^1 ^1 {ExplosionPower:3}
execute as @a[predicate=colonel:has_spellbook_fireball, predicate=colonel:is_sneaking, scores={fireball_cd=0}] run say fireball!
execute as @a[scores={fireball_cd=0..}] run bossbar set fireball_cd1 players @a[scores={fireball_cd=41..}]
execute as @a[scores={fireball_cd=0..}] run bossbar set fireball_cd2 players @a[scores={fireball_cd=21..40}]
execute as @a[scores={fireball_cd=0..}] run bossbar set fireball_cd3 players @a[scores={fireball_cd=1..20}]
execute as @a[scores={fireball_cd=1..}] run scoreboard players operation @s fireball_cd -= #1 num
execute as @a[predicate=colonel:has_spellbook_fireball, predicate=colonel:is_sneaking, scores={fireball_cd=0}] run scoreboard players operation @s fireball_cd = #fireball_cooldown num


###firebarrage
execute as @a[predicate=colonel:has_spellbook_firebarrage, predicate=colonel:is_sneaking] run effect give @s slowness 6 100
execute as @a[predicate=colonel:has_spellbook_firebarrage, predicate=colonel:is_sneaking] run data merge entity @s {Fire:100}
###big circle
execute as @e[tag=firebarrage] run function colonel:rotate
execute as @e[tag=firebarrage] run function colonel:higher
execute at @a[predicate=colonel:has_spellbook_firebarrage, predicate=colonel:is_sneaking] run summon armor_stand ~ ~ ~ {Tags:["firebarrage"],Invisible:1b,NoGravity:1b}
execute at @e[tag=firebarrage] run function colonel:firebarrage_ring
execute as @e[tag=firebarrage,y_rotation=111..] run kill @s 
###small circle
execute as @e[tag=firebarrage1] run function colonel:rotate
execute as @e[tag=firebarrage1] run function colonel:lower
execute at @a[predicate=colonel:has_spellbook_firebarrage, predicate=colonel:is_sneaking] run summon armor_stand ~ ~2 ~ {Tags:["firebarrage1"],Invisible:1b,NoGravity:1b}
execute at @e[tag=firebarrage1] run function colonel:firebarrage_ring1
execute as @e[tag=firebarrage1,y_rotation=111..] run kill @s 
execute at @e[tag=firebarrage,y_rotation=110] run function colonel:firebarrage_balls
execute as @a[predicate=colonel:has_spellbook_firebarrage, predicate=colonel:is_sneaking] run say BURN!
execute at @a[predicate=colonel:has_spellbook_firebarrage, predicate=colonel:is_sneaking] run setblock ~ ~-1 ~ blackstone
execute as @a[predicate=colonel:has_spellbook_firebarrage, predicate=colonel:is_sneaking] run clear @s written_book{title:Firebarrage}


###Frostwalker
execute at @a[predicate=colonel:has_spellbook_frostwalker] if block ~ ~-1 ~ water run setblock ~ ~-1 ~ ice 


###Slowfalling
execute as @a[predicate=colonel:has_spellbook_slowfall] run effect give @s slow_falling 1 1


###Speed
execute as @a[predicate=colonel:has_spellbook_speed, predicate=!colonel:holds_weapon] run effect give @s speed 1 1


###Healing 
execute at @a[predicate=colonel:has_spellbook_healing] run effect give @a[distance=..7, predicate=!colonel:has_regeneration] regeneration 5 2
execute as @a[predicate=colonel:has_spellbook_healing, predicate=!colonel:has_hunger] run effect give @s hunger 10 30
execute at @a[predicate=colonel:has_spellbook_healing, predicate=colonel:is_sneaking] run effect give @e[distance=..7, predicate=!colonel:has_regeneration, type=!player] regeneration 5 2
execute as @e[predicate=colonel:is_ridden_by_healer, predicate=!colonel:has_regeneration] run effect give @s regeneration 5 2
execute at @a[predicate=colonel:has_spellbook_healing] run function colonel:healing_ring
###for testing:
###execute as @a[predicate=colonel:has_spellbook_healing] run say healing
###execute as @e[predicate=colonel:is_ridden_by_healer] run say healer_on_board

###Strength
execute as @a[predicate=colonel:has_spellbook_strength] run effect give @s strength 1 1


###Hail_Of_Arrows
execute as @a[predicate=colonel:has_spellbook_hail_of_arrows, predicate=colonel:is_sneaking] run function colonel:hail_of_arrows_ritual
execute as @a[predicate=colonel:has_spellbook_hail_of_arrows, predicate=!colonel:is_sneaking] run scoreboard players set @s hail_of_arrows_ct 0
###execute as @a[predicate=colonel:has_spellbook_hail_of_arrows, predicate=!colonel:is_sneaking] run execute at @s run execute as @e[type=armor_stand,tag=hail_of_arrows_ritual,distance=..2, limit=1, sort=nearest] run kill @s
###execute as @a[predicate=colonel:has_spellbook_hail_of_arrows, predicate=colonel:is_sneaking] run say hi


###Levitation
execute as @a[predicate=colonel:has_spellbook_levitation, predicate=!colonel:holds_weapon, predicate=!colonel:heavy_armor, predicate=colonel:in_levitation_hight] run effect give @s levitation 1 1


###Notch
execute as @a[predicate=colonel:has_spellbook_notch, predicate=colonel:is_sneaking] run effect give @s absorption 20 2
execute as @a[predicate=colonel:has_spellbook_notch, predicate=colonel:is_sneaking] run clear @s written_book{title:Notch}


###Regeneration
execute as @a[predicate=colonel:has_spellbook_regeneration, predicate=!colonel:has_regeneration_three] run effect give @s regeneration 5 3
execute as @a[predicate=colonel:has_spellbook_regeneration, predicate=!colonel:has_hunger] run effect give @s hunger 10 30
execute as @a[predicate=colonel:has_spellbook_regeneration, predicate=!colonel:has_regeneration_four, predicate=colonel:is_sneaking] run effect give @s regeneration 5 4


###Shield 
execute as @a[predicate=colonel:has_spellbook_shield, predicate=colonel:is_sneaking, scores={shield_cd=0}] run scoreboard players operation @s shield_cd = #shield_cooldown num
execute at @a[predicate=colonel:has_spellbook_shield, scores={shield_cd=120..}] run kill @e[distance=..7, type=#arrows]
execute at @a[predicate=colonel:has_spellbook_shield, scores={shield_cd=120..}] run kill @e[distance=..7, type=#impact_projectiles]
execute at @a[predicate=colonel:has_spellbook_shield, scores={shield_cd=120..}] run kill @e[distance=..7, type=fireball]
execute at @a[predicate=colonel:has_spellbook_shield, scores={shield_cd=120..}] run function colonel:shield1
execute at @a[predicate=colonel:has_spellbook_shield, scores={shield_cd=120..}] run function colonel:shield2
execute as @a[scores={shield_cd=1..}] run bossbar set shield_cd1 players @a[predicate=colonel:has_spellbook_shield,scores={shield_cd=161..}]
execute as @a[scores={shield_cd=1..}] run bossbar set shield_cd2 players @a[predicate=colonel:has_spellbook_shield,scores={shield_cd=121..160}]
execute as @a[scores={shield_cd=1..}] run bossbar set shield_cd3 players @a[predicate=colonel:has_spellbook_shield,scores={shield_cd=81..120}]
execute as @a[scores={shield_cd=1..}] run bossbar set shield_cd4 players @a[predicate=colonel:has_spellbook_shield,scores={shield_cd=41..80}]
execute as @a[scores={shield_cd=0..}] run bossbar set shield_cd5 players @a[predicate=colonel:has_spellbook_shield,scores={shield_cd=1..40}]
execute as @a[scores={shield_cd=1..}] run scoreboard players operation @s shield_cd -= #1 num
execute as @a[predicate=colonel:has_spellbook_shield, predicate=colonel:is_sneaking, scores={shield_cd=0}] run scoreboard players operation @s shield_cd = #shield_cooldown num
###for testing:
###execute as @a[predicate=colonel:has_spellbook_shield] run say i_have_shield_book 

###Teleportation
execute as @a[predicate=colonel:has_spellbook_teleportation] run tag @s add has_teleport_running
execute as @a[predicate=colonel:has_spellbook_teleportation, predicate=colonel:is_sneaking] run scoreboard players operation @s teleport_ritual = #1 num
execute as @a[scores={teleport_charge=..599}] run scoreboard players operation @s teleport_charge += #1 num
##pixel effects:
execute at @a[predicate=colonel:has_spellbook_teleportation, predicate=colonel:is_sneaking] run function colonel:teleporting_pixel
execute at @a[predicate=colonel:has_spellbook_teleportation, predicate=colonel:is_sneaking] run summon armor_stand ^ ^ ^20 {Invisible:1b, Tags:[teleport_point, ticklife], NoGravity:true}
execute at @e[type=armor_stand, tag=teleport_point] run function colonel:teleport_point_pixel

execute as @a[predicate=colonel:has_spellbook_teleportation, predicate=!colonel:is_sneaking, scores={teleport_charge=200..,teleport_ritual=1}] run execute at @s run tp @s ^ ^0.8 ^20 
execute as @a[predicate=colonel:has_spellbook_teleportation, predicate=!colonel:is_sneaking, scores={teleport_charge=200..,teleport_ritual=1}] run scoreboard players remove @s teleport_charge 200
execute as @a[predicate=colonel:has_spellbook_teleportation, scores={teleport_ritual=1..}, predicate=!colonel:is_sneaking] run scoreboard players set @s teleport_ritual 0
execute as @a[predicate=!colonel:has_spellbook_teleportation, scores={teleport_ritual=1..}] run scoreboard players set @s teleport_ritual 0

###execute as @a[predicate=!colonel:has_spellbook_teleportation, scores={teleport_charge=1..}] run scoreboard players set @s teleport_charge 0
execute as @a[tag=has_teleport_running] run bossbar set teleport_charge0 players @a[scores={teleport_charge=0..199}]
execute as @a[tag=has_teleport_running] run bossbar set teleport_charge1 players @a[scores={teleport_charge=200..399}]
execute as @a[tag=has_teleport_running] run bossbar set teleport_charge2 players @a[scores={teleport_charge=400..599}]
execute as @a[tag=has_teleport_running] run bossbar set teleport_charge3 players @a[predicate=colonel:has_spellbook_teleportation,scores={teleport_charge=600..}]
execute as @a[predicate=!colonel:has_spellbook_teleportation, scores={teleport_charge=600}] run tag @s remove has_teleport_running


###Xray
execute as @a[predicate=colonel:has_spellbook_xray,predicate=!colonel:has_haste] run function colonel:xray


###Magic_Missile
execute as @a[predicate=colonel:has_spellbook_magic_missile,predicate=colonel:is_sneaking, scores={magic_missile_cd=0}] run function colonel:magic_missile
execute as @a[scores={magic_missile_cd=0..}] run bossbar set magic_missile_cd1 players @a[scores={magic_missile_cd=41..}]
execute as @a[scores={magic_missile_cd=0..}] run bossbar set magic_missile_cd2 players @a[scores={magic_missile_cd=21..40}]
execute as @a[scores={magic_missile_cd=0..}] run bossbar set magic_missile_cd3 players @a[scores={magic_missile_cd=1..20}]
execute as @a[scores={magic_missile_cd=1..}] run scoreboard players operation @s magic_missile_cd -= #1 num
execute as @a[predicate=colonel:has_spellbook_magic_missile, predicate=colonel:is_sneaking, scores={magic_missile_cd=0}] run scoreboard players operation @s magic_missile_cd = #magic_missile_cooldown num


###Homing
###execute as @a[predicate=colonel:has_spellbook_homing_missile,predicate=colonel:is_sneaking, scores={homing_missile_cd=2}] run execute at @s run  
execute as @e[tag=homing] run execute at @s run function colonel:homing 
###for testing:
###execute as @e[tag=homing] run say hi

