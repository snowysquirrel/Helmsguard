/datum/job/roguetown/masteratarms
	title = "Master-at-Arms"
	flag = MASTERATARMS
	department_flag = GARRISON
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list(\
	/datum/species/human/northern,\
	/datum/species/human/halfelf,\
	/datum/species/elf/wood,\
	/datum/species/dwarf/mountain,\
	/datum/species/demihuman,\
	/datum/species/halforc,\
	)
	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED, AGE_OLD)
	tutorial = "You are the most experienced of the Crown's Soldiery, leading the men-at-arms in maintaining order and attending to threats and crimes below the court's attention. \
				See to those under your command and fill in the gaps knights leave in their wake. Obey the orders of your Marshal and the Crown."
	display_order = JDO_MASTERATARMS
	whitelist_req = TRUE
	round_contrib_points = 6
	selection_color = JCOLOR_SOLDIER
	advclass_cat_rolls = list(CTAG_MASTERATARMS = 20)	

	outfit = /datum/outfit/job/roguetown/masteratarms

	give_bank_account = 50
	min_pq = 6
	max_pq = null
	cmode_music = 'sound/music/combat_bog.ogg'
    

/datum/outfit/job/roguetown/masteratarms
	pants = /obj/item/clothing/under/roguetown/chainlegs
	cloak = /obj/item/clothing/cloak/half/masteratarms
	neck = /obj/item/clothing/neck/roguetown/gorget
	shoes = /obj/item/clothing/shoes/roguetown/boots
	belt = /obj/item/storage/belt/rogue/leather/black
	beltr = /obj/item/rogueweapon/mace/cudgel
	wrists = /obj/item/clothing/wrists/roguetown/bracers
	gloves = /obj/item/clothing/gloves/roguetown/leather
	backr = /obj/item/storage/backpack/rogue/satchel/black
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson
	id = /obj/item/scomstone/garrison

/datum/outfit/job/roguetown/masteratarms/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.mind)
		H.change_stat("strength", 4) // seems kinda lame but remember guardsman bonus!!
		H.change_stat("endurance", 2)
		H.change_stat("intelligence", 1)
		H.change_stat("constitution", 2)
		H.change_stat("perception", 2)
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)

/datum/job/roguetown/masteratarms/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	..()
	if(ishuman(L))
		var/mob/living/carbon/human/H = L
		H.advsetup = 1
		H.invisibility = INVISIBILITY_MAXIMUM
		H.become_blind("advsetup")
		if(istype(H.cloak, /obj/item/clothing/cloak/stabard/surcoat/guard))
			var/obj/item/clothing/S = H.cloak
			var/index = findtext(H.real_name, " ")
			if(index)
				index = copytext(H.real_name, 1,index)
			if(!index)
				index = H.real_name
			S.name = "Master-At-Arms jupon ([index])"
	
// POLEARMS


/datum/advclass/masteratarms/polearms
	name = "Polearm Trained"
	tutorial = "You are well trained in fighting using polearms, and also short blades should your foe get too close. You are also trained with novice \
	horseriding skills in order to serve as a light cavalry in time of need."
	outfit = /datum/outfit/job/roguetown/masteratarms/polearms

	category_tags = list(CTAG_MASTERATARMS)

/datum/outfit/job/roguetown/masteratarms/polearms/pre_equip(mob/living/carbon/human/H)
	..()
	H.adjust_skillrank(/datum/skill/combat/polearms, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/axes, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/whipsflails, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/maces, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/shields, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/crossbows, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/firearms, 3, TRUE)	
	H.adjust_skillrank(/datum/skill/combat/bows, 3, TRUE)	
	H.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/sneaking, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/athletics, 5, TRUE)	// We are basically identical to a regular MAA, except having better athletics to help us manage our order usage better
	H.adjust_skillrank(/datum/skill/misc/riding, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/tracking, 2, TRUE)	//Decent tracking akin to Skirmisher.
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
	H.change_stat("strength", 4) // seems kinda lame but remember guardsman bonus!!
	H.change_stat("endurance", 2)
	H.change_stat("intelligence", 1)
	H.change_stat("constitution", 2)
	H.change_stat("perception", 2)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/order/movemovemove)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/order/takeaim)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/order/onfeet)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/order/hold)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/order/focustarget)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/self/convertrole/guard) 
	H.verbs |= list(/mob/living/carbon/human/proc/request_outlaw, /mob/proc/haltyell, /mob/living/carbon/human/mind/proc/setorders)

	//Makes up for worse shirt protection with kinda better armor protection
	r_hand = /obj/item/rogueweapon/spear/billhook
	backl = /obj/item/gwstrap
	H.adjust_blindness(-3)

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
		"Haubergeon" = /obj/item/clothing/suit/roguetown/armor/chainmail,	
		"Steel Curaiss"	= /obj/item/clothing/suit/roguetown/armor/plate/half,
		"Lamellar Armor"	= /obj/item/clothing/suit/roguetown/armor/plate/scale,
		"Hauberk" = /obj/item/clothing/suit/roguetown/armor/chainmail/hauberk
	)
	var/armorchoice = input("Choose your armor.", "TAKE UP ARMOR") as anything in armors
	armor = armors[armorchoice]

	backpack_contents = list(/obj/item/rogueweapon/huntingknife/idagger/steel/special = 1, /obj/item/war_horn/human = 1, /obj/item/rope/chain = 1, /obj/item/storage/keyring/sund/sund_gate)


// SWORDSMAN

/datum/advclass/masteratarms/swordsman
	name = "Sword Trained"
	tutorial = "You are trained in fighting using swords and shields. You are also trained with novice \
	horseriding skills in order to serve as a light cavalry in time of need."
	outfit = /datum/outfit/job/roguetown/masteratarms/swordsman

	category_tags = list(CTAG_MASTERATARMS)

/datum/outfit/job/roguetown/masteratarms/swordsman/pre_equip(mob/living/carbon/human/H)
	..()
	H.adjust_skillrank(/datum/skill/combat/polearms, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/swords, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/axes, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/whipsflails, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/maces, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/shields, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/crossbows, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/firearms, 3, TRUE)	
	H.adjust_skillrank(/datum/skill/combat/bows, 3, TRUE)	
	H.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/sneaking, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/athletics, 5, TRUE)	// We are basically identical to a regular MAA, except having better athletics to help us manage our order usage better
	H.adjust_skillrank(/datum/skill/misc/riding, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/tracking, 2, TRUE)	//Decent tracking akin to Skirmisher.
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
	H.change_stat("strength", 4) // seems kinda lame but remember guardsman bonus!!
	H.change_stat("endurance", 2)
	H.change_stat("intelligence", 1)
	H.change_stat("constitution", 2)
	H.change_stat("perception", 2)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/order/movemovemove)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/order/takeaim)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/order/onfeet)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/order/hold)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/order/focustarget)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/self/convertrole/guard) 
	H.verbs |= list(/mob/living/carbon/human/proc/request_outlaw, /mob/proc/haltyell, /mob/living/carbon/human/mind/proc/setorders)

	r_hand = /obj/item/rogueweapon/sword/long
	backl = /obj/item/rogueweapon/shield/heater
	H.adjust_blindness(-3)

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
		"Haubergeon" = /obj/item/clothing/suit/roguetown/armor/chainmail,	
		"Steel Curaiss"	= /obj/item/clothing/suit/roguetown/armor/plate/half,
		"Lamellar Armor"	= /obj/item/clothing/suit/roguetown/armor/plate/scale,
		"Hauberk" = /obj/item/clothing/suit/roguetown/armor/chainmail/hauberk
	)
	var/armorchoice = input("Choose your armor.", "TAKE UP ARMOR") as anything in armors
	armor = armors[armorchoice]

	backpack_contents = list(/obj/item/rogueweapon/huntingknife/idagger/steel/special = 1, /obj/item/rope/chain = 1, /obj/item/storage/keyring/sund/sund_gate)
	
// AXEMAN

/datum/advclass/masteratarms/axeman
	name = "Axe Trained"
	tutorial = "You are trained in fighting using axes and shields. You are also trained with novice \
	horseriding skills in order to serve as a light cavalry in time of need."
	outfit = /datum/outfit/job/roguetown/masteratarms/axeman

	category_tags = list(CTAG_MASTERATARMS)

/datum/outfit/job/roguetown/masteratarms/axeman/pre_equip(mob/living/carbon/human/H)
	..()
	H.adjust_skillrank(/datum/skill/combat/polearms, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/axes, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/whipsflails, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/maces, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/shields, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/crossbows, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/firearms, 3, TRUE)	
	H.adjust_skillrank(/datum/skill/combat/bows, 3, TRUE)	
	H.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/sneaking, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/athletics, 5, TRUE)	// We are basically identical to a regular MAA, except having better athletics to help us manage our order usage better
	H.adjust_skillrank(/datum/skill/misc/riding, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/tracking, 2, TRUE)	//Decent tracking akin to Skirmisher.
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
	H.change_stat("strength", 4) // seems kinda lame but remember guardsman bonus!!
	H.change_stat("endurance", 2)
	H.change_stat("intelligence", 1)
	H.change_stat("constitution", 2)
	H.change_stat("perception", 2)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/order/movemovemove)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/order/takeaim)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/order/onfeet)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/order/hold)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/order/focustarget)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/self/convertrole/guard) 
	H.verbs |= list(/mob/living/carbon/human/proc/request_outlaw, /mob/proc/haltyell, /mob/living/carbon/human/mind/proc/setorders)

	r_hand = /obj/item/rogueweapon/stoneaxe/battle
	backl = /obj/item/rogueweapon/shield/heater
	H.adjust_blindness(-3)

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
		"Haubergeon" = /obj/item/clothing/suit/roguetown/armor/chainmail,	
		"Steel Curaiss"	= /obj/item/clothing/suit/roguetown/armor/plate/half,
		"Lamellar Armor"	= /obj/item/clothing/suit/roguetown/armor/plate/scale,
		"Hauberk" = /obj/item/clothing/suit/roguetown/armor/chainmail/hauberk
	)
	var/armorchoice = input("Choose your armor.", "TAKE UP ARMOR") as anything in armors
	armor = armors[armorchoice]
	backpack_contents = list(/obj/item/rogueweapon/huntingknife/idagger/steel/special = 1, /obj/item/rope/chain = 1, /obj/item/storage/keyring/sund/sund_gate)

// MACEMAN

/datum/advclass/masteratarms/maceman
	name = "Mace Trained"
	tutorial = "You are trained in fighting using maces and shields. You are also trained with novice \
	horseriding skills in order to serve as a light cavalry in time of need."
	outfit = /datum/outfit/job/roguetown/masteratarms/maceman

	category_tags = list(CTAG_MASTERATARMS)

/datum/outfit/job/roguetown/masteratarms/maceman/pre_equip(mob/living/carbon/human/H)
	..()
	H.adjust_skillrank(/datum/skill/combat/polearms, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/axes, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/whipsflails, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/maces, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/shields, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/crossbows, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/bows, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/firearms, 3, TRUE)	
	H.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/sneaking, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/athletics, 5, TRUE)	// We are basically identical to a regular MAA, except having better athletics to help us manage our order usage better
	H.adjust_skillrank(/datum/skill/misc/riding, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/tracking, 2, TRUE)	//Decent tracking akin to Skirmisher.
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
	H.change_stat("strength", 4) // seems kinda lame but remember guardsman bonus!!
	H.change_stat("endurance", 2)
	H.change_stat("intelligence", 1)
	H.change_stat("constitution", 2)
	H.change_stat("perception", 2)
	H.change_stat("strength", 2)
	H.change_stat("intelligence", 1)
	H.change_stat("constitution", 1)
	H.change_stat("perception", 1)		//Gets bow-skills, so give a SMALL tad of perception to aid in bow draw.
	H.change_stat("endurance", 1)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/order/movemovemove)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/order/takeaim)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/order/onfeet)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/order/hold)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/order/focustarget)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/self/convertrole/guard) 
	H.verbs |= list(/mob/living/carbon/human/proc/request_outlaw, /mob/proc/haltyell, /mob/living/carbon/human/mind/proc/setorders)

	r_hand = /obj/item/rogueweapon/mace
	backl = /obj/item/rogueweapon/shield/heater
	H.adjust_blindness(-3)


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
		"Haubergeon" = /obj/item/clothing/suit/roguetown/armor/chainmail,	
		"Steel Curaiss"	= /obj/item/clothing/suit/roguetown/armor/plate/half,
		"Lamellar Armor"	= /obj/item/clothing/suit/roguetown/armor/plate/scale,
		"Hauberk" = /obj/item/clothing/suit/roguetown/armor/chainmail/hauberk
	)
	var/armorchoice = input("Choose your armor.", "TAKE UP ARMOR") as anything in armors
	armor = armors[armorchoice]


	backpack_contents = list(/obj/item/rogueweapon/huntingknife/idagger/steel/special = 1, /obj/item/rope/chain = 1, /obj/item/storage/keyring/sund/sund_gate)



