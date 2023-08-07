summon armor_stand ^ ^2 ^ {Tags:["hail_of_arrows_cast", "ticklife"],Invisible:true}
summon armor_stand ^ ^2 ^1 {Tags:["hail_of_arrows_cast2", "ticklife"],Invisible:true}


summon arrow ^ ^2 ^3.2 {Tags:["hail_of_arrows"]}
summon arrow ^-3 ^2 ^3.2 {Tags:["hail_of_arrows"]}
summon arrow ^-2 ^2 ^3.2 {Tags:["hail_of_arrows"]}
summon arrow ^-1 ^2 ^3.2 {Tags:["hail_of_arrows"]}
summon arrow ^1 ^2 ^3.2 {Tags:["hail_of_arrows"]}
summon arrow ^2 ^2 ^3.2 {Tags:["hail_of_arrows"]}
summon arrow ^3 ^2 ^3.2 {Tags:["hail_of_arrows"]}

summon arrow ^-2 ^3 ^3.2 {Tags:["hail_of_arrows"]}
summon arrow ^-1 ^3 ^3.2 {Tags:["hail_of_arrows"]}
summon arrow ^ ^3 ^3.2 {Tags:["hail_of_arrows"]}
summon arrow ^1 ^3 ^3.2 {Tags:["hail_of_arrows"]}
summon arrow ^2 ^3 ^3.2 {Tags:["hail_of_arrows"]}
summon arrow ^-1 ^4 ^3.2 {Tags:["hail_of_arrows"]}
summon arrow ^ ^4 ^3.2 {Tags:["hail_of_arrows"]}
summon arrow ^1 ^4 ^3.2 {Tags:["hail_of_arrows"]}

summon arrow ^-2 ^1 ^3.2 {Tags:["hail_of_arrows"]}
summon arrow ^-1 ^1 ^3.2 {Tags:["hail_of_arrows"]}
summon arrow ^ ^1 ^3.2 {Tags:["hail_of_arrows"]}
summon arrow ^1 ^1 ^3.2 {Tags:["hail_of_arrows"]}
summon arrow ^2 ^1 ^3.2 {Tags:["hail_of_arrows"]}
summon arrow ^-1 ^0 ^3.2 {Tags:["hail_of_arrows"]}
summon arrow ^ ^0 ^3.2 {Tags:["hail_of_arrows"]}
summon arrow ^1 ^0 ^3.2 {Tags:["hail_of_arrows"]}

execute at @s run execute as @e[type=armor_stand,tag=hail_of_arrows_cast2,distance=2..3, limit=1, sort=nearest] run function colonel:hail_of_arrows_shoot


###execute at @s run execute as @e[type=armor_stand,tag=hail_of_arrows_cast2,distance=2..3, limit=1, sort=nearest] run say hail_of_arrows_shoot
