tellraw @a {"text": "colonel loaded!", "color": "#139900"}

execute run function colonel:load_classes

###to add all cooldown scores to all players, when reloading:
tag @a[tag=enabled] remove enabled

###for killing things that have a set livetime
scoreboard objectives add lifetime dummy

###for giving Mods speacial skills
scoreboard objectives add isMod dummy

###Staff
scoreboard objectives add staff minecraft.used:minecraft.carrot_on_a_stick
    
###numbers
scoreboard objectives add num dummy
scoreboard players set #1 num 1
scoreboard players set #0 num 0

###position score
scoreboard objectives add x dummy
scoreboard objectives add y dummy
scoreboard objectives add z dummy
scoreboard objectives add xtemp dummy
scoreboard objectives add ytemp dummy
scoreboard objectives add ztemp dummy


###Hail_Of_Arrows
scoreboard objectives add hail_of_arrows_cd dummy
scoreboard players set #hail_of_arrows_cooldown num 300
scoreboard objectives add hail_of_arrows_ct dummy
scoreboard players set #hail_of_arrows_casttime num 60


###Fireball
scoreboard objectives add fireball_cd dummy
scoreboard players set #fireball_cooldown num 60
bossbar add fireball_cd1 "cooldown"
bossbar add fireball_cd2 "cooldown"
bossbar add fireball_cd3 "cooldown"
bossbar set fireball_cd1 color red
bossbar set fireball_cd2 color red
bossbar set fireball_cd3 color red
bossbar set fireball_cd1 max 3
bossbar set fireball_cd2 max 3
bossbar set fireball_cd3 max 3
bossbar set fireball_cd1 value 3
bossbar set fireball_cd2 value 2
bossbar set fireball_cd3 value 1


###Shield ability scoreboard and bossbar for cooldown
scoreboard objectives add shield_cd dummy
scoreboard players set #shield_cooldown num 200
bossbar add shield_cd1 "cooldown"
bossbar add shield_cd2 "cooldown"
bossbar add shield_cd3 "cooldown"
bossbar add shield_cd4 "cooldown"
bossbar add shield_cd5 "cooldown"
bossbar set shield_cd1 color white
bossbar set shield_cd2 color white
bossbar set shield_cd3 color white
bossbar set shield_cd4 color white
bossbar set shield_cd5 color white
bossbar set shield_cd1 max 5
bossbar set shield_cd2 max 5
bossbar set shield_cd3 max 5
bossbar set shield_cd4 max 5
bossbar set shield_cd5 max 5
bossbar set shield_cd1 value 5
bossbar set shield_cd2 value 4
bossbar set shield_cd3 value 3
bossbar set shield_cd4 value 2
bossbar set shield_cd5 value 1


###Teleportation
scoreboard objectives add teleport_charge dummy
scoreboard objectives add teleport_cd dummy
scoreboard objectives add teleport_ritual dummy
scoreboard players set #teleport_cooldown num 100
bossbar add teleport_cd1 "cooldown"
bossbar add teleport_cd2 "cooldown"
bossbar add teleport_cd3 "cooldown"
bossbar add teleport_cd4 "cooldown"
bossbar add teleport_cd5 "cooldown"
bossbar set teleport_cd1 color purple
bossbar set teleport_cd2 color purple
bossbar set teleport_cd3 color purple
bossbar set teleport_cd4 color purple
bossbar set teleport_cd5 color purple
bossbar set teleport_cd1 max 5
bossbar set teleport_cd2 max 5
bossbar set teleport_cd3 max 5
bossbar set teleport_cd4 max 5
bossbar set teleport_cd5 max 5
bossbar set teleport_cd1 value 5
bossbar set teleport_cd2 value 4
bossbar set teleport_cd3 value 3
bossbar set teleport_cd4 value 2
bossbar set teleport_cd5 value 1

bossbar add teleport_charge0 "charges"
bossbar add teleport_charge1 "charges"
bossbar add teleport_charge2 "charges"
bossbar add teleport_charge3 "charges"
bossbar set teleport_charge0 color purple
bossbar set teleport_charge1 color purple
bossbar set teleport_charge2 color purple
bossbar set teleport_charge3 color purple
bossbar set teleport_charge0 max 3
bossbar set teleport_charge1 max 3
bossbar set teleport_charge2 max 3
bossbar set teleport_charge3 max 3
bossbar set teleport_charge0 value 0
bossbar set teleport_charge1 value 1
bossbar set teleport_charge2 value 2
bossbar set teleport_charge3 value 3


###Magic Missile
scoreboard objectives add magic_missile_cd dummy
scoreboard players set #magic_missile_cooldown num 60
bossbar add magic_missile_cd1 "cooldown"
bossbar add magic_missile_cd2 "cooldown"
bossbar add magic_missile_cd3 "cooldown"
bossbar set magic_missile_cd1 color blue
bossbar set magic_missile_cd2 color blue
bossbar set magic_missile_cd3 color blue
bossbar set magic_missile_cd1 max 3
bossbar set magic_missile_cd2 max 3
bossbar set magic_missile_cd3 max 3
bossbar set magic_missile_cd1 value 3
bossbar set magic_missile_cd2 value 2
bossbar set magic_missile_cd3 value 1