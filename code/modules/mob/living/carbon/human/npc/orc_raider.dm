GLOBAL_LIST_INIT(orcraider_quotes, world.file2list("strings/rt/orcraiderlines.txt"))
GLOBAL_LIST_INIT(orcraider_aggro, world.file2list("strings/rt/orcraideraggrolines.txt"))

/mob/living/carbon/human/species/orc/npc
	name = "orc"
	skin_tone = SKIN_COLOR_GROONN
	hairstyle = "Bald"
	facial_hairstyle = "Shaved"
	faction = list("orc", "station")
	ambushable = FALSE
	dodgetime = 30
	flee_in_pain = TRUE
	gender = MALE
	bodyparts = list(/obj/item/bodypart/chest, /obj/item/bodypart/head, /obj/item/bodypart/l_arm,
					 /obj/item/bodypart/r_arm, /obj/item/bodypart/r_leg, /obj/item/bodypart/l_leg)
	faction = list("orcs")
	ambushable = FALSE
	
	base_intents = list(INTENT_HELP, INTENT_DISARM, INTENT_GRAB, /datum/intent/unarmed/claw)
	a_intent = INTENT_HELP
	possible_mmb_intents = list(INTENT_STEAL, INTENT_JUMP, INTENT_KICK, INTENT_BITE)
	possible_rmb_intents = list(/datum/rmb_intent/feint, /datum/rmb_intent/aimed, /datum/rmb_intent/strong, /datum/rmb_intent/weak, /datum/rmb_intent/swift, /datum/rmb_intent/riposte)
	possible_rmb_intents = list()
	aggressive = 1
	rude = TRUE
	mode = NPC_AI_IDLE
	wander = FALSE
	cmode_music = FALSE

/// ROT STUFF
	rot_type = /datum/component/rot/corpse
	rot_time = 5 MINUTES
	skeletonize_time = 8 MINUTES
	dust_time = 10 MINUTES  // From rot to dust in the span of 10 minutes.
	

/mob/living/carbon/human/species/orc/npc/ambush
	aggressive=1
	wander = TRUE

/mob/living/carbon/human/species/orc/npc/retaliate(mob/living/L)
	var/newtarg = target
	.=..()
	if(target)
		aggressive=1
		wander = TRUE
	if(target != newtarg)
		say(pick(GLOB.orcraider_aggro))
		linepoint(target)

/mob/living/carbon/human/species/orc/npc/should_target(mob/living/L)
	if(L.stat != CONSCIOUS)
		return FALSE
	. = ..()

/mob/living/carbon/human/species/orc/npc/handle_combat()
	if(mode == NPC_AI_HUNT)
		if(prob(2)) // do not make this big or else they NEVER SHUT UP
			emote(pick("laugh", "rage"))
	. = ..()

/mob/living/carbon/human/species/orc/npc/Initialize()
	. = ..()
	set_species(/datum/species/orc)
	addtimer(CALLBACK(src, PROC_REF(after_creation)), 1 SECONDS)

/mob/living/carbon/human/species/orc/npc/after_creation()
	..()
	src.mind_initialize()
	job = "Orc Marauder"
	ADD_TRAIT(src, TRAIT_NOMOOD, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOHUNGER, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_INFINITE_ENERGY, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	regenerate_icons()

	var/obj/item/organ/eyes/organ_eyes = getorgan(/obj/item/organ/eyes)
//	var/obj/item/organ/ears/organ_ears = getorgan(/obj/item/organ/ears)
	dna.species.handle_body(src)

	if(organ_eyes)
		organ_eyes.eye_color = "#ff0000"
		organ_eyes.accessory_colors = "#FFBF00#FFBF00"
	
//	if(organ_ears)
//		organ_ears.accessory_colors = SKIN_COLOR_GROONN
	
	skin_tone = SKIN_COLOR_GROONN

	if(gender == FEMALE)
		real_name = pick(world.file2list("strings/rt/names/other/halforcf.txt"))
	else
		real_name = pick(world.file2list("strings/rt/names/other/halforcm.txt"))
	var/obj/item/bodypart/head/head = get_bodypart(BODY_ZONE_HEAD)
	head.sellprice = 35 // 50% More than goblin
	update_hair()
	update_body()
 
/mob/living/carbon/human/species/orc/npc/savage/after_creation()
	..()
	equipOutfit(new /datum/outfit/job/roguetown/orc/savage)


/datum/outfit/job/roguetown/orc/savage/pre_equip(mob/living/carbon/human/H) //gives some default skills and equipment for player controlled orcs
	..()
	if(prob(50))
		wrists = pickweight(list(/obj/item/clothing/wrists/roguetown/bracers/leather = 3,
		/obj/item/clothing/wrists/roguetown/wrappings = 3,
		/obj/item/clothing/wrists/roguetown/bracers/copper = 2,
		/obj/item/clothing/wrists/roguetown/bracers/iron = 1,
		))
	if(prob(80))
		armor = pickweight(list(/obj/item/clothing/suit/roguetown/armor/leather/hide = 3,
		/obj/item/clothing/suit/roguetown/armor/chainmail/iron = 2,
		/obj/item/clothing/suit/roguetown/armor/leather/studded = 2,
		/obj/item/clothing/suit/roguetown/armor/leather/heavy = 2,
		/obj/item/clothing/suit/roguetown/armor/plate/half/copper = 1,
		/obj/item/clothing/suit/roguetown/armor/plate/half/iron = 1,
		))
	if(prob(60))
		head = pickweight(list(/obj/item/clothing/head/roguetown/helmet/leather = 3,
			/obj/item/clothing/head/roguetown/armingcap = 3,
			/obj/item/clothing/head/roguetown/helmet/leather/volfhelm = 3,
			/obj/item/clothing/head/roguetown/helmet/leather/advanced = 2,
			/obj/item/clothing/head/roguetown/helmet/skullcap = 1,
			/obj/item/clothing/head/roguetown/helmet/sallet/iron = 2,
		))
	if(prob(70))
		shoes = pickweight(list(/obj/item/clothing/shoes/roguetown/gladiator = 3,
		/obj/item/clothing/shoes/roguetown/boots/furlinedboots = 2,
		/obj/item/clothing/shoes/roguetown/boots/armor/iron = 1,
		))
	if(prob(70))
		neck = pickweight(list(/obj/item/clothing/neck/roguetown/coif = 3,
		/obj/item/clothing/neck/roguetown/gorget/copper = 2,
		/obj/item/clothing/neck/roguetown/bevor/iron = 1,
		/obj/item/clothing/neck/roguetown/chaincoif/iron = 1,))
	if(prob(60))
		gloves = pickweight(list(/obj/item/clothing/gloves/roguetown/leather = 3,
		/obj/item/clothing/gloves/roguetown/chain/iron = 2,
		/obj/item/clothing/gloves/roguetown/angle = 2,))
	if(prob(20))
		mask = pickweight(list(/obj/item/clothing/mask/rogue/skullmask =3,
		/obj/item/clothing/mask/rogue/ragmask = 3,
		))
	if(prob(40))
		shirt = pickweight(list(/obj/item/clothing/suit/roguetown/shirt/undershirt/vagrant = 3,
		/obj/item/clothing/suit/roguetown/shirt/tribalrag = 3,
		))
	pants = pickweight(list(/obj/item/clothing/under/roguetown/loincloth/brown = 5,
		/obj/item/clothing/under/roguetown/tights/random = 4,
		/obj/item/clothing/under/roguetown/trou/leather = 3,
		/obj/item/clothing/under/roguetown/chainlegs/iron = 2,
		/obj/item/clothing/under/roguetown/platelegs/iron = 1,))
	if(prob(50))
		r_hand = pickweight(list(
				/obj/item/rogueweapon/stoneaxe/boneaxe = 4,
				/obj/item/rogueweapon/stoneaxe/woodcut = 3,
				/obj/item/rogueweapon/stoneaxe/handaxe/copper = 3,
				/obj/item/rogueweapon/stoneaxe/handaxe = 3,
				/obj/item/rogueweapon/mace/spiked = 3,
				/obj/item/rogueweapon/flail/peasantwarflail = 3,
				/obj/item/rogueweapon/sword/iron = 3,
				/obj/item/rogueweapon/sword/iron/short = 3,
				/obj/item/rogueweapon/sword/iron/messer = 3,
				/obj/item/rogueweapon/mace/cudgel = 4,
				/obj/item/rogueweapon/mace/cudgel/copper = 4,
				/obj/item/rogueweapon/mace/warhammer = 2,
				/obj/item/rogueweapon/sword = 1,
				/obj/item/rogueweapon/sword/short = 1,
				/obj/item/rogueweapon/stoneaxe/battle = 1
			))
		if(prob(50))
			l_hand =  /obj/item/rogueweapon/shield/wood
	else
		r_hand = pickweight(list(
				/obj/item/rogueweapon/woodstaff = 4,
				/obj/item/rogueweapon/spear/bonespear = 4,
				/obj/item/rogueweapon/spear = 4,
				/obj/item/rogueweapon/halberd/bardiche = 2
			))
	H.STASTR = rand(12,16)
	H.STASPD = rand(4,6)
	H.STACON = rand(10, 15)
	H.STAEND = rand(10, 15)
	H.STAINT = rand(3,8)

	//light labor skills for armor repairs and such, equipment is so-so, with good stats
	H.adjust_skillrank(/datum/skill/craft/carpentry, 1, TRUE)
	H.adjust_skillrank(/datum/skill/craft/masonry, 1, TRUE)
	H.adjust_skillrank(/datum/skill/craft/crafting, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/sewing, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/sewing, 1, TRUE)

	H.adjust_skillrank(/datum/skill/combat/polearms, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/maces, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/axes, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/athletics, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/shields, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)

	H.set_patron(/datum/patron/inhumen/graggar)
	ADD_TRAIT(H, TRAIT_CRITICAL_RESISTANCE, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_LEECHIMMUNE, INNATE_TRAIT)
	ADD_TRAIT(src, TRAIT_INFINITE_ENERGY, TRAIT_GENERIC)

	H.possible_rmb_intents = list(/datum/rmb_intent/feint,\
	/datum/rmb_intent/aimed,\
	/datum/rmb_intent/strong,\
	/datum/rmb_intent/swift,\
	/datum/rmb_intent/riposte,\
	/datum/rmb_intent/weak)
	H.swap_rmb_intent(num=1)

/mob/living/carbon/human/species/orc/npc/brute/after_creation()
	..()
	src.mind_initialize()
	job = "Orc Brute"
	equipOutfit(new /datum/outfit/job/roguetown/orc/brute)

/datum/outfit/job/roguetown/orc/brute/pre_equip(mob/living/carbon/human/H) //gives some default skills and equipment for player controlled orcs
	wrists = pickweight(list(
		/obj/item/clothing/wrists/roguetown/bracers/iron = 3,
		/obj/item/clothing/wrists/roguetown/bracers = 1
	))
	armor = pickweight(list(
		/obj/item/clothing/suit/roguetown/armor/plate/scale = 3,
		/obj/item/clothing/suit/roguetown/armor/chainmail/hauberk/iron = 3,
		/obj/item/clothing/suit/roguetown/armor/plate/full/iron = 2,
	))
	if(prob(90))
		head = pickweight(list(
			/obj/item/clothing/head/roguetown/helmet/skullcap = 3,
			/obj/item/clothing/head/roguetown/helmet/sallet/iron = 3,
			/obj/item/clothing/head/roguetown/helmet/bascinet = 2,
			/obj/item/clothing/head/roguetown/helmet/heavy = 2,
			/obj/item/clothing/head/roguetown/helmet/heavy/graggar = 2,
		))
	shoes = pickweight(list(
		/obj/item/clothing/shoes/roguetown/boots/armor/iron = 3,
		/obj/item/clothing/shoes/roguetown/boots/armor = 2,
		/obj/item/clothing/shoes/roguetown/boots/armor/graggar = 2,
		))
	if(prob(70))
		neck = pickweight(list(
		/obj/item/clothing/neck/roguetown/chaincoif/iron = 3,
		/obj/item/clothing/neck/roguetown/bevor/iron = 2,
		/obj/item/clothing/neck/roguetown/gorget = 1,
		/obj/item/clothing/neck/roguetown/chaincoif = 1,
	gloves = pickweight(list(
		/obj/item/clothing/gloves/roguetown/chain/iron = 3,
		/obj/item/clothing/gloves/roguetown/chain = 2,
		/obj/item/clothing/gloves/roguetown/plate = 2,
		/obj/item/clothing/gloves/roguetown/plate/graggar = 2
	))
		))
	if(prob(30))
		mask = pickweight(list(/obj/item/clothing/mask/rogue/skullmask =3,
		/obj/item/clothing/mask/rogue/ragmask = 3,
		/obj/item/clothing/mask/rogue/facemask = 2,
		))
	if(prob(40))
		shirt = pickweight(list(/obj/item/clothing/suit/roguetown/shirt/undershirt/vagrant = 3,
		/obj/item/clothing/suit/roguetown/armor/gambeson = 2,
		/obj/item/clothing/suit/roguetown/armor/gambeson/heavy = 2,
		/obj/item/clothing/suit/roguetown/armor/chainmail/iron = 2,
		/obj/item/clothing/suit/roguetown/armor/chainmail = 1,
		))
	pants = pickweight(list(
		/obj/item/clothing/under/roguetown/chainlegs/iron = 4,
		/obj/item/clothing/under/roguetown/platelegs/iron = 4,
		/obj/item/clothing/under/roguetown/splintlegs = 3,
		/obj/item/clothing/under/roguetown/chainlegs = 3,
		/obj/item/clothing/under/roguetown/chainlegs/skirt = 2,
		/obj/item/clothing/under/roguetown/chainlegs/kilt = 2,
		))
	if(prob(50))
		r_hand = pickweight(list(
		/obj/item/rogueweapon/stoneaxe/woodcut = 4,
		/obj/item/rogueweapon/sword/iron = 4,
		/obj/item/rogueweapon/sword/iron/messer = 4,
		/obj/item/rogueweapon/mace/warhammer = 3,
		/obj/item/rogueweapon/sword = 3,
		/obj/item/rogueweapon/stoneaxe/battle = 3,
		/obj/item/rogueweapon/flail = 3,
		/obj/item/rogueweapon/mace = 2,
		))
		l_hand = pickweight(list(/obj/item/rogueweapon/shield/wood = 4,
		/obj/item/rogueweapon/shield/tower = 3,
		/obj/item/rogueweapon/shield/iron = 2,
		))
	else
		r_hand =  pickweight(list(
			/obj/item/rogueweapon/spear = 4,
			/obj/item/rogueweapon/halberd/bardiche = 3,
			/obj/item/rogueweapon/sword/long = 3,
			/obj/item/rogueweapon/greataxe/steel/doublehead = 2,
			/obj/item/rogueweapon/greataxe/steel = 2,
		))
	H.STASTR = rand(14,18)
	H.STASPD = rand(4,7)
	H.STACON = rand(13, 18)
	H.STAEND = rand(13, 18)
	H.STAINT = rand(3,10)

	//light labor skills for armor repairs and such, equipment is so-so, with good stats
	H.adjust_skillrank(/datum/skill/craft/carpentry, 1, TRUE)
	H.adjust_skillrank(/datum/skill/craft/masonry, 1, TRUE)
	H.adjust_skillrank(/datum/skill/craft/crafting, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/sewing, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/sewing, 1, TRUE)
	H.adjust_skillrank(/datum/skill/combat/polearms, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/maces, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/axes, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/wrestling, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 4, TRUE)
	H.adjust_skillrank(/datum/skill/misc/athletics, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/swords, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/shields, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)

	H.set_patron(/datum/patron/inhumen/graggar)
	ADD_TRAIT(H, TRAIT_CRITICAL_RESISTANCE, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_LEECHIMMUNE, INNATE_TRAIT)
	ADD_TRAIT(src, TRAIT_INFINITE_ENERGY, TRAIT_GENERIC)

	H.possible_rmb_intents = list(/datum/rmb_intent/feint,\
	/datum/rmb_intent/aimed,\
	/datum/rmb_intent/strong,\
	/datum/rmb_intent/swift,\
	/datum/rmb_intent/riposte,\
	/datum/rmb_intent/weak)
	H.swap_rmb_intent(num=1)


/mob/living/carbon/human/species/orc/npc/shooter
	attack_mode = "ranged"

///mob/living/carbon/human/species/orc/npc/shooter/after_creation()
//	..()
//	equipOutfit(new /datum/outfit/job/roguetown/orc/shooter)


///datum/outfit/job/roguetown/orc/shooter/pre_equip(mob/living/carbon/human/H)
//	r_hand = /obj/item/gun/ballistic/revolver/grenadelauncher/bow/recurve
