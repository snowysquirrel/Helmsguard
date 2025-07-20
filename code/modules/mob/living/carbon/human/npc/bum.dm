GLOBAL_LIST_INIT(bum_quotes, world.file2list("strings/rt/bumlines.txt"))
GLOBAL_LIST_INIT(bum_aggro, world.file2list("strings/rt/bumaggrolines.txt"))

/mob/living/carbon/human/species/human/northern/bum
	aggressive=0
	rude = TRUE
	mode = NPC_AI_IDLE
	faction = list("bums", "station")
	ambushable = FALSE
	dodgetime = 30
	flee_in_pain = TRUE
	possible_rmb_intents = list()

	wander = FALSE

/mob/living/carbon/human/species/human/northern/bum/ambush
	aggressive=1

	wander = TRUE

/mob/living/carbon/human/species/human/northern/bum/retaliate(mob/living/L)
	var/newtarg = target
	.=..()
	if(target)
		aggressive=1
		wander = TRUE
		if(target != newtarg)
			say(pick(GLOB.bum_aggro))
			linepoint(target)

/mob/living/carbon/human/species/human/northern/bum/should_target(mob/living/L)
	if(L.stat != CONSCIOUS)
		return FALSE
	. = ..()

/mob/living/carbon/human/species/human/northern/bum/Initialize()
	. = ..()
	set_species(/datum/species/human/northern)
	addtimer(CALLBACK(src, PROC_REF(after_creation)), 1 SECONDS)

/mob/living/carbon/human/species/human/northern/bum/after_creation()
	..()
	job = "Beggar"
	ADD_TRAIT(src, TRAIT_NOMOOD, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOHUNGER, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_INFINITE_ENERGY, TRAIT_GENERIC)
	equipOutfit(new /datum/outfit/job/roguetown/vagrant)

/mob/living/carbon/human/species/human/northern/bum/npc_idle()
	if(m_intent == MOVE_INTENT_SNEAK)
		return
	if(world.time < next_idle)
		return
	next_idle = world.time + rand(30, 70)
	if((mobility_flags & MOBILITY_MOVE) && isturf(loc) && wander)
		if(prob(20))
			var/turf/T = get_step(loc,pick(GLOB.cardinals))
			if(!istype(T, /turf/open/transparent/openspace))
				Move(T)
		else
			face_atom(get_step(src,pick(GLOB.cardinals)))
	if(!wander && prob(10))
		face_atom(get_step(src,pick(GLOB.cardinals)))
	if(prob(3))
		say(pick(GLOB.bum_quotes))
	if(prob(3))
		emote(pick("laugh","burp","yawn","grumble","mumble","blink_r","clap"))



/datum/outfit/job/roguetown/vagrant/pre_equip(mob/living/carbon/human/H)
	..()
	// wise beggar!!!
	// guaranteed full beggar gear + random stats
	if(is_wise)
		head = /obj/item/clothing/head/roguetown/wizhat/gen/wise //wise hat
		beltr = /obj/item/reagent_containers/powder/moondust
		beltl = /obj/item/clothing/mask/cigarette/rollie/cannabis
		cloak = /obj/item/clothing/cloak/raincloak/brown
		gloves = /obj/item/clothing/gloves/roguetown/fingerless
		armor = /obj/item/clothing/suit/roguetown/shirt/rags
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/vagrant
		pants = /obj/item/clothing/under/roguetown/tights/vagrant
		shoes = /obj/item/clothing/shoes/roguetown/shalal // wise boots
		r_hand = /obj/item/rogueweapon/woodstaff/wise // dog beating staff
		l_hand = /obj/item/rogueweapon/huntingknife/idagger/steel/special // dog butchering knife
		H.adjust_skillrank(/datum/skill/misc/sneaking, rand(2,5), TRUE)
		H.adjust_skillrank(/datum/skill/misc/stealing, 5, TRUE)
		H.adjust_skillrank(/datum/skill/misc/climbing, rand(2,5), TRUE)
		H.adjust_skillrank(/datum/skill/misc/reading, 4, TRUE) //very good reading he is wise
		H.adjust_skillrank(/datum/skill/combat/polearms, rand(2,5), TRUE) // dog beating staff
		H.STASTR = rand(1, 20)
		H.STAINT = rand(5, 20)
		H.STALUC = rand(1, 20)
		H.change_stat("constitution", -rand(0, 2))
		H.change_stat("endurance", -rand(0, 2))
		H.real_name = "[H.real_name] the Wise"
		H.name = "[H.name] the Wise"
		H.facial_hairstyle = "Knowledge"
		H.update_hair()
		H.age = AGE_OLD
		return
	if(prob(20))
		head = /obj/item/clothing/head/roguetown/knitcap
	else
		head = null
	if(prob(5))
		beltr = /obj/item/reagent_containers/powder/moondust
	else
		beltr = null
	if(prob(10))
		beltl = /obj/item/clothing/mask/cigarette/rollie/cannabis
	else
		beltl = null
	if(prob(10))
		cloak = /obj/item/clothing/cloak/raincloak/brown
	else
		cloak = null
	if(prob(10))
		gloves = /obj/item/clothing/gloves/roguetown/fingerless
	else
		gloves = null
	if(H.gender == FEMALE)
		armor = /obj/item/clothing/suit/roguetown/shirt/rags
	else if(H.gender == MALE)
		armor = null
		pants = /obj/item/clothing/under/roguetown/tights/vagrant
		if(prob(50))
			pants = /obj/item/clothing/under/roguetown/tights/vagrant/l
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/vagrant
		if(prob(50))
			shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/vagrant/l
	if(H.mind)
		H.adjust_skillrank(/datum/skill/misc/sneaking, rand(1,5), TRUE)
		H.adjust_skillrank(/datum/skill/misc/stealing, 3, TRUE)
		H.adjust_skillrank(/datum/skill/misc/climbing, rand(1,5), TRUE)
		H.adjust_skillrank(/datum/skill/misc/lockpicking, pick (1,2,3,4,5), TRUE) // thug lyfe
		H.STALUC = rand(1, 20)
	if(prob(5))
		r_hand = /obj/item/rogueweapon/mace/woodclub
	else
		r_hand = null
	if(prob(5))
		l_hand = /obj/item/rogueweapon/mace/woodclub
	else
		l_hand = null
	H.change_stat("strength", -1)
	H.change_stat("intelligence", -4)
	H.change_stat("constitution", -3)
	H.change_stat("endurance", -3)
	H.grant_language(/datum/language/thievescant)
	ADD_TRAIT(H, TRAIT_NOSTINK, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_NASTY_EATER, TRAIT_GENERIC)

/datum/outfit/job/roguetown/vagrant
	name = "Beggar"
	/// Whether or not we get wise gear and stats
	var/is_wise = FALSE

/datum/outfit/job/roguetown/vagrant/wise
	name = "Wise Beggar"
	is_wise = TRUE
