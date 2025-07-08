/datum/job/roguetown/templar
	title = "Templar"
	flag = TEMPLAR
	department_flag = CHURCHMEN
	faction = "Station"
	tutorial = "Templars are warriors who have forsaken wealth and title in lieu of service to the church, \
	due to either zealotry or a past shame. They guard the church and its priest while keeping a watchful eye against heresy and nite-creechers. \
	Within troubled dreams, they wonder if the blood they shed makes them holy or stained. \
	They answer to the Chapter Master in the matter of war but ultimately serve the priest of the church."	 
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = TOLERATED_CLEARANCE
	allowed_patrons = /datum/patron/old_god
	outfit = /datum/outfit/job/roguetown/templar
	min_pq = 1
	max_pq = null
	total_positions = 3
	spawn_positions = 3
	round_contrib_points = 3
	display_order = JDO_TEMPLAR
	give_bank_account = TRUE
	cmode_music = 'sound/music/combat_holy.ogg'
	advclass_cat_rolls = list(CTAG_TEMPLAR = 20)

/datum/job/roguetown/templar/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	..()
	if(ishuman(L))
		var/mob/living/carbon/human/H = L
		H.advsetup = 1
		H.invisibility = INVISIBILITY_MAXIMUM
		H.become_blind("advsetup")
		if(istype(H.cloak, /obj/item/clothing/cloak/tabard/crusader))
			var/obj/item/clothing/S = H.cloak
			var/index = findtext(H.real_name, " ")
			if(index)
				index = copytext(H.real_name, 1,index)
			if(!index)
				index = H.real_name
			S.name = "crusader's tabard ([index])"
		var/prev_real_name = H.real_name
		for(var/X in peopleknowme)
			for(var/datum/mind/MF in get_minds(X))
				if(MF.known_people)
					MF.known_people -= prev_real_name
					H.mind.person_knows_me(MF)

/datum/outfit/job/roguetown/templar
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/light
	neck = /obj/item/clothing/neck/roguetown/chaincoif/iron
	wrists = /obj/item/clothing/wrists/roguetown/bracers
	gloves = /obj/item/clothing/gloves/roguetown/leather
	shoes = /obj/item/clothing/shoes/roguetown/boots/leather
	belt = /obj/item/storage/belt/rogue/leather/black
	backr = /obj/item/storage/backpack/rogue/satchel/black
	beltr = /obj/item/storage/keyring/churchie


/datum/outfit/job/roguetown/templar
	job_bitflag = BITFLAG_CHURCH
	has_loadout = TRUE
	allowed_patrons = /datum/patron/old_god
	id = /obj/item/clothing/ring/silver
	backl = /obj/item/storage/backpack/rogue/satchel
	backpack_contents = list(/obj/item/ritechalk)
	
/datum/outfit/job/roguetown/templar/pre_equip(mob/living/carbon/human/H)
	..()
	cloak = /obj/item/clothing/cloak/tabard/crusader
	if(H.mind)
		H.change_stat("strength", 3)
		H.change_stat("perception", 2)
		H.change_stat("constitution", 1)
		H.change_stat("endurance", 1)
		H.change_stat("speed", 1)
	H.verbs |= /mob/proc/haltyell
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_RITUALIST, TRAIT_GENERIC)

/datum/job/roguetown/templar/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	. = ..()
	if(ishuman(L))
		var/mob/living/carbon/human/H = L
		H.advsetup = 1
		H.invisibility = INVISIBILITY_MAXIMUM
		H.become_blind("advsetup")

/datum/advclass/templar/default
	name = "Templar Crusader"
	title = "Templar"
	tutorial = "You are a templar of the Church, trained in heavy weaponry and zealous warfare. You are the instrument of Psydon's wrath, clad in steel and faith.."
	outfit = /datum/outfit/job/roguetown/templar/default
	category_tags = list(CTAG_TEMPLAR)

/datum/outfit/job/roguetown/templar/default/pre_equip(mob/living/carbon/human/H)
	..()
	H.adjust_skillrank(/datum/skill/combat/polearms, 3, TRUE) 
	H.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/shields, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/maces, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/crossbows, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/firearms, 2, TRUE)	
	H.adjust_skillrank(/datum/skill/combat/bows, 3, TRUE)	
	H.adjust_skillrank(/datum/skill/combat/whipsflails, 3, TRUE)	
	H.adjust_skillrank(/datum/skill/misc/riding, 2, TRUE)	
	H.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/tracking, 1, TRUE)

	H.change_stat("strength", 3)
	H.change_stat("constitution", 2)
	H.change_stat("endurance", 3)
	H.dna.species.soundpack_m = new /datum/voicepack/male/knight()
	H.verbs |= /mob/proc/haltyell

	H.adjust_blindness(-3)
	var/weapons = list("Sword and Shield", "Bastard Sword", "Axe and Shield", "Hammer and Shield", "Spear")
	var/weapon_choice = input("Choose your weapon.", "TAKE UP ARMS") as anything in weapons
	H.set_blindness(0)
	switch(weapon_choice)
		if("Axe and Shield")
			r_hand = /obj/item/rogueweapon/stoneaxe/woodcut/steel
			backl = /obj/item/rogueweapon/shield/heater
		if("Bastard Sword")
			r_hand = /obj/item/rogueweapon/sword/long
		if("Sword and Shield")
			r_hand = /obj/item/rogueweapon/sword
			backl = /obj/item/rogueweapon/shield/heater
		if("Hammer and Shield")
			r_hand = /obj/item/rogueweapon/mace/warhammer
			backl = /obj/item/rogueweapon/shield/heater
		if("Spear")
			r_hand = /obj/item/rogueweapon/spear
			backl = /obj/item/gwstrap

	var/helmets = list(
		"Sallet Helmet" 	= /obj/item/clothing/head/roguetown/helmet/sallet,
		"Kettle Helmet"		= /obj/item/clothing/head/roguetown/helmet/kettle,
		"Wide Kettle Helmet" = /obj/item/clothing/head/roguetown/helmet/kettle/wide,
		"Skull Cap"		= /obj/item/clothing/head/roguetown/helmet/skullcap,
		"Nasal Helmet"		= /obj/item/clothing/head/roguetown/helmet,
		"None"
	)
	var/helmchoice = input("Choose your Helm.", "TAKE UP HELMS") as anything in helmets
	if(helmchoice != "None")
		head = helmets[helmchoice]

	var/armors = list(
		"Iron Haubergeon" = /obj/item/clothing/suit/roguetown/armor/chainmail/iron,	
		"Common Brigandine"	= /obj/item/clothing/suit/roguetown/armor/brigandine/light,
		"Hardened Leather Coat"	= /obj/item/clothing/suit/roguetown/armor/leather/heavy/coat,
		"Studded Leather Armor" = /obj/item/clothing/suit/roguetown/armor/leather/studded
	)
	var/armorchoice = input("Choose your armor.", "TAKE UP ARMOR") as anything in armors
	armor = armors[armorchoice]

/datum/advclass/hospitaler/default
	name = "Hospitaler"
	title = "Hospitaler"
	tutorial = "You are a Hospitaler of the Church, a warrior who has taken up the mantle of healing and protection. \
	You are a defender of the faith, a healer of the wounded, and a protector of the innocent. \
	You are a beacon of hope in a world filled with darkness, and you strive to bring light to those in need. \
	You are trained to fight defensively, and to use your skills to protect and heal those around you. "

	outfit = /datum/outfit/job/roguetown/hospitaler/default

	category_tags = list(CTAG_TEMPLAR)

/datum/outfit/job/roguetown/hospitaler/default/pre_equip(mob/living/carbon/human/H)
	..()
	cloak = /obj/item/clothing/cloak/tabard/hospitaler
	H.adjust_skillrank(/datum/skill/combat/polearms, 3, TRUE) 
	H.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/shields, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/maces, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/crossbows, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/firearms, 2, TRUE)	
	H.adjust_skillrank(/datum/skill/combat/bows, 3, TRUE)	
	H.adjust_skillrank(/datum/skill/combat/whipsflails, 3, TRUE)	
	H.adjust_skillrank(/datum/skill/misc/riding, 2, TRUE)	
	H.adjust_skillrank(/datum/skill/misc/medicine, 3, TRUE)	// HOSPITALER MEDICAL SKILL
	H.adjust_skillrank(/datum/skill/craft/alchemy, 2, TRUE)	// HOSPITALER MEDICAL SKILL
	H.adjust_skillrank(/datum/skill/misc/sewing, 2, TRUE)		// HOSPITALER MEDICAL SKILL
	H.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/tracking, 1, TRUE)

	H.change_stat("strength", 2)
	H.change_stat("constitution", 3)
	H.change_stat("endurance", 3)

	H.dna.species.soundpack_m = new /datum/voicepack/male/knight()
	H.verbs |= /mob/proc/haltyell

	H.adjust_blindness(-3)
	var/weapons = list("Sword and Shield", "Bastard Sword", "Axe and Shield", "Hammer and Shield", "Spear")
	var/weapon_choice = input("Choose your weapon.", "TAKE UP ARMS") as anything in weapons
	H.set_blindness(0)
	switch(weapon_choice)
		if("Axe and Shield")
			r_hand = /obj/item/rogueweapon/stoneaxe/woodcut/steel
			backl = /obj/item/rogueweapon/shield/heater
		if("Bastard Sword")
			r_hand = /obj/item/rogueweapon/sword/long
		if("Sword and Shield")
			r_hand = /obj/item/rogueweapon/sword
			backl = /obj/item/rogueweapon/shield/heater
		if("Hammer and Shield")
			r_hand = /obj/item/rogueweapon/mace/warhammer
			backl = /obj/item/rogueweapon/shield/heater
		if("Spear")
			r_hand = /obj/item/rogueweapon/spear
			backl = /obj/item/gwstrap

	var/helmets = list(
		"Sallet Helmet" 	= /obj/item/clothing/head/roguetown/helmet/sallet,
		"Kettle Helmet"		= /obj/item/clothing/head/roguetown/helmet/kettle,
		"Wide Kettle Helmet" = /obj/item/clothing/head/roguetown/helmet/kettle/wide,
		"Skull Cap"		= /obj/item/clothing/head/roguetown/helmet/skullcap,
		"Nasal Helmet"		= /obj/item/clothing/head/roguetown/helmet,
		"None"
	)
	var/helmchoice = input("Choose your Helm.", "TAKE UP HELMS") as anything in helmets
	if(helmchoice != "None")
		head = helmets[helmchoice]

	var/armors = list(
		"Iron Haubergeon" = /obj/item/clothing/suit/roguetown/armor/chainmail/iron,	
		"Common Brigandine"	= /obj/item/clothing/suit/roguetown/armor/brigandine/light,
		"Hardened Leather Coat"	= /obj/item/clothing/suit/roguetown/armor/leather/heavy/coat,
		"Studded Leather Armor" = /obj/item/clothing/suit/roguetown/armor/leather/studded
	)
	var/armorchoice = input("Choose your armor.", "TAKE UP ARMOR") as anything in armors
	armor = armors[armorchoice]
