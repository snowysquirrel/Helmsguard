/datum/job/roguetown/nightmaiden
	title = "Rake"
	f_title = "Wench"
	flag = WENCH
	department_flag = RABBLE
	selection_color = JCOLOR_RABBLE

	faction = "Station"
	total_positions = 5
	spawn_positions = 5

	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED)

	tutorial = "As a Wench, you are a master of charm and allure, skilled in the art of companionship. Your role is to provide comfort, entertainment, and solace to those who seek your services. Whether through conversation, music, or more intimate means, you ensure your patrons leave with their spirits lifted and their burdens lightened. Your craft is as much about understanding the human heart as it is about physical skill."

	outfit = /datum/outfit/job/roguetown/nightmaiden
	advclass_cat_rolls = list(CTAG_NIGHTMAIDEN = 20)
	display_order = JDO_WENCH
	give_bank_account = TRUE
	can_random = FALSE
	min_pq = -10
	max_pq = null
	round_contrib_points = 2
	advjob_examine = TRUE

/datum/job/roguetown/nightmaiden/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	. = ..()
	if(ishuman(L))
		var/mob/living/carbon/human/H = L
		H.advsetup = 1
		H.invisibility = INVISIBILITY_MAXIMUM
		H.become_blind("advsetup") // Classes are for aesthetic clothing only, mechanically they're identical.

/datum/outfit/job/roguetown/nightmaiden
	name = "Bathhouse Attendant"
	// This is just a base outfit, the actual outfits are defined in the advclasses

/datum/advclass/nightmaiden
	name = "Wench"
	tutorial = "Your role is to provide comfort, entertainment, and solace to those who seek your services. Whether through conversation, music, or more intimate means, you ensure your patrons leave with their spirits lifted and their burdens lightened. Your craft is as much about understanding the human heart as it is about physical skill."
	outfit = /datum/outfit/job/roguetown/nightmaiden/attendant
	category_tags = list(CTAG_NIGHTMAIDEN)

/datum/outfit/job/roguetown/nightmaiden/attendant/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/roguetown/armingcap
	shoes = /obj/item/clothing/shoes/roguetown/sandals
	neck = /obj/item/storage/belt/rogue/pouch/coins/poor
	r_hand = /obj/item/soap/bath
	belt =	/obj/item/storage/belt/rogue/leather/cloth
	beltl = /obj/item/storage/keyring/sund/sund_bawdyroom
	if(H.gender == FEMALE)
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt
		armor = /obj/item/clothing/suit/roguetown/shirt/dress/gen/sexy/random
		pants = /obj/item/clothing/under/roguetown/skirt/brown
	else if(H.gender == MALE)
		shirt = /obj/item/clothing/suit/roguetown/shirt/tunic/random
	backpack_contents = list(
		/obj/item/soap/bath = 1
	)
	H.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/sneaking, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/stealing, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/swimming, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/music, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/riding, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/medicine, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/whipsflails, 1, TRUE)
	H.adjust_skillrank(/datum/skill/combat/knives, 1, TRUE)
	H.adjust_skillrank(/datum/skill/craft/cooking, 2, TRUE)
	H.adjust_skillrank(/datum/skill/craft/crafting, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/lockpicking, 1, TRUE)

	H.change_stat("constitution", 3)
	H.change_stat("strength", 1)
	H.change_stat("endurance", 2)
	ADD_TRAIT(H, TRAIT_NUTCRACKER, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_CICERONE, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_EMPATH, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_GOODLOVER, TRAIT_GENERIC)

/datum/advclass/nightmaiden/concubine
	name = "Concubine"
	title = "Concubine"
	f_title = "Concubine"
	tutorial = "Unlike your fellow bath attendants who maintain a professional facade, you have abandoned all pretense. You are a prized possession of the nobility, adorned in exotic silks and gold. Your role is to provide companionship, entertainment, and pleasure."
	outfit = /datum/outfit/job/roguetown/nightmaiden/concubine
	allowed_sexes = list(FEMALE)
	category_tags = list(CTAG_NIGHTMAIDEN)

/datum/outfit/job/roguetown/nightmaiden/concubine/pre_equip(mob/living/carbon/human/H)
	..()
	mask = /obj/item/clothing/mask/rogue/exoticsilkmask
	neck = /obj/item/clothing/neck/roguetown/collar
	belt = /obj/item/storage/belt/rogue/leather/exoticsilkbelt
	beltl = /obj/item/roguekey/nightmaiden
	shoes = /obj/item/clothing/shoes/roguetown/anklets
	backl = /obj/item/storage/backpack/rogue/satchel
	shirt = /obj/item/clothing/suit/roguetown/shirt/exoticsilkbra
	pants = /obj/item/clothing/under/roguetown/tights/stockings/silk
	backpack_contents = list(
		/obj/item/rope = 1,
		/obj/item/candle/eora = 1,
		/obj/item/rogueweapon/whip = 1,
		/obj/item/clothing/mask/rogue/blindfold = 1,
		/obj/item/storage/keyring/sund/sund_bawdyroom = 1
	)
	
	if(H.mind)
		H.adjust_skillrank(/datum/skill/misc/sneaking, 3, TRUE)
		H.adjust_skillrank(/datum/skill/misc/stealing, 2, TRUE)
		H.adjust_skillrank(/datum/skill/misc/swimming, 3, TRUE)
		H.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
		H.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
		H.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
		H.adjust_skillrank(/datum/skill/misc/music, 4, TRUE)
		H.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)
		H.adjust_skillrank(/datum/skill/misc/riding, 3, TRUE)
		H.adjust_skillrank(/datum/skill/misc/medicine, 1, TRUE)
		H.adjust_skillrank(/datum/skill/combat/whipsflails, 2, TRUE)
		H.adjust_skillrank(/datum/skill/misc/sewing, 3, TRUE)
		H.change_stat("constitution", 1)
		H.change_stat("endurance", 1)
		H.change_stat("speed", 1)
		H.change_stat("strength", 1)
	ADD_TRAIT(H, TRAIT_GOODLOVER, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_EMPATH, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_BEAUTIFUL, TRAIT_GENERIC)

	var/weapons = list("Harp","Lute","Accordion","Guitar","Hurdy-Gurdy","Viola","Vocal Talisman","Flute")
	var/weapon_choice = input("Choose your instrument.", "TAKE UP ARMS") as anything in weapons
	H.set_blindness(0)
	switch(weapon_choice)
		if("Harp")
			backr = /obj/item/rogue/instrument/harp
		if("Lute")
			backr = /obj/item/rogue/instrument/lute
		if("Accordion")
			backr = /obj/item/rogue/instrument/accord
		if("Guitar")
			backr = /obj/item/rogue/instrument/guitar
		if("Hurdy-Gurdy")
			backr = /obj/item/rogue/instrument/hurdygurdy
		if("Viola")
			backr = /obj/item/rogue/instrument/viola
		if("Vocal Talisman")
			backr = /obj/item/rogue/instrument/vocals
		if("Flute")
			backr = /obj/item/rogue/instrument/flute

/datum/advclass/nightmaiden/courtesan
	name = "Courtesan"
	tutorial = "Overcoming mind games, deceit and competition, you came into your own as one of the bathhouse's most prized moneymakers and socialites. Dressed in lavish gifts left behind by your patrons, not just anyone can have you. Under the matron, you do most of the social heavylifting and provide entertainment of all forms - behind a heavy price tag. "
	outfit = /datum/outfit/job/roguetown/nightmaiden/courtesan
	category_tags = list(CTAG_NIGHTMAIDEN)

/datum/outfit/job/roguetown/nightmaiden/courtesan/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/lockpick/goldpin
	if(prob(5))
		head = /obj/item/lockpick/goldpin/silver
	armor = /obj/item/clothing/suit/roguetown/shirt/dress/silkydress/random
	shirt = /obj/item/clothing/suit/roguetown/armor/corset
	belt = /obj/item/storage/belt/rogue/leather/cloth/lady
	beltl = /obj/item/roguekey/nightmaiden
	beltr = /obj/item/storage/belt/rogue/pouch/coins/poor
	id = /obj/item/clothing/ring/gold
	if(prob(50))
		id = /obj/item/clothing/ring/emerald
	if(prob(30))
		id = /obj/item/clothing/ring/topaz
	if(prob(15))
		id = /obj/item/clothing/ring/silver
	if(prob(5))
		id = /obj/item/clothing/ring/diamond
	shoes = /obj/item/clothing/shoes/roguetown/anklets
	backl = /obj/item/storage/backpack/rogue/satchel
	backpack_contents = list(
		/obj/item/reagent_containers/powder/moondust = 2,
		/obj/item/reagent_containers/glass/bottle/rogue/wine = 1,
		/obj/item/toy/cards/deck = 1,
	)

	H.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/sneaking, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/lockpicking, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/swimming, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/music, 4, TRUE)
	H.adjust_skillrank(/datum/skill/misc/reading, 4, TRUE)
	H.adjust_skillrank(/datum/skill/misc/sewing, 2, TRUE)
	H.adjust_skillrank(/datum/skill/craft/crafting, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/riding, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/medicine, 1, TRUE)
	H.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
	H.change_stat("speed", 3)
	H.change_stat("endurance", 2)
	H.change_stat("perception", 1)
	ADD_TRAIT(H, TRAIT_KEENEARS, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_GOODLOVER, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_EMPATH, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_BEAUTIFUL, TRAIT_GENERIC)

	var/weapons = list("Harp","Lute","Accordion","Guitar","Hurdy-Gurdy","Viola","Vocal Talisman","Flute")
	var/weapon_choice = input("Choose your instrument.", "TAKE UP ARMS") as anything in weapons
	H.set_blindness(0)
	switch(weapon_choice)
		if("Harp")
			backr = /obj/item/rogue/instrument/harp
		if("Lute")
			backr = /obj/item/rogue/instrument/lute
		if("Accordion")
			backr = /obj/item/rogue/instrument/accord
		if("Guitar")
			backr = /obj/item/rogue/instrument/guitar
		if("Hurdy-Gurdy")
			backr = /obj/item/rogue/instrument/hurdygurdy
		if("Viola")
			backr = /obj/item/rogue/instrument/viola
		if("Vocal Talisman")
			backr = /obj/item/rogue/instrument/vocals
		if("Flute")
			backr = /obj/item/rogue/instrument/flute

