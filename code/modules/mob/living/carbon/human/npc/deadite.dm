/mob/living/carbon/human/species/npc/deadite
	aggressive = TRUE
	mode = NPC_AI_IDLE
	npc_jump_chance = 0
	rude = FALSE // don't taunt people as a deadite
	tree_climber = FALSE // or climb trees
	dodgetime = 8 
	flee_in_pain = FALSE
	ambushable = FALSE
	wander = TRUE
	tainted_chance = 80 //The probability that the equipment spawned will be tainted
	faction = list("undead", "station")
	var/outfit = /datum/outfit/job/roguetown/vagrant

/mob/living/carbon/human/species/npc/deadite/Initialize()
	. = ..()
	var/species = list(
		/datum/species/human/northern,
		/datum/species/dwarf/mountain,
		/datum/species/elf/dark,
		/datum/species/elf/wood,
		/datum/species/goblinp,
		/datum/species/human/halfelf,
		/datum/species/halforc,
		/datum/species/tieberian,
	)
	outfit = pickweight(list(/datum/outfit/job/roguetown/vagrant = 10,
	/datum/outfit/job/roguetown/npc/skeleton/dead/adventurer = 5,
	/datum/outfit/job/roguetown/npc/skeleton/dead/manatarms = 5,
	/datum/outfit/job/roguetown/npc/skeleton/dead/freitrupp = 5,
	/datum/outfit/job/roguetown/npc/skeleton/dead/noble = 5,
	/datum/outfit/job/roguetown/npc/skeleton/dead/peasant = 8,
	/datum/outfit/job/roguetown/npc/skeleton/dead/jester = 3,
	))
	set_species(pick(species))
	gender = pick(MALE, FEMALE)

	addtimer(CALLBACK(src, PROC_REF(after_creation)), 1 SECONDS)

/mob/living/carbon/human/species/npc/deadite/after_creation()
	. = ..()
	src.mind_initialize()
	mob_biotypes |= MOB_UNDEAD
	var/datum/zombie_antag = src.mind.add_antag_datum(/datum/antagonist/zombie, team = FALSE, admin_panel = TRUE)
	equipOutfit(outfit)
	//Make sure deadite NPCs don't show up in the antag listings
	GLOB.antagonists -= zombie_antag


	var/obj/item/bodypart/head/head = get_bodypart(BODY_ZONE_HEAD)
	var/hairf = pick(list(/datum/sprite_accessory/hair/head/himecut, 
						/datum/sprite_accessory/hair/head/countryponytailalt, 
						/datum/sprite_accessory/hair/head/stacy, 
						/datum/sprite_accessory/hair/head/kusanagi_alt,
						/datum/sprite_accessory/hair/head/largebun,
						/datum/sprite_accessory/hair/head/drillhair,
						/datum/sprite_accessory/hair/head/longemo,
						/datum/sprite_accessory/hair/head/ponytail3,))
	var/hairm = pick(list(/datum/sprite_accessory/hair/head/ponytailwitcher, 
						/datum/sprite_accessory/hair/head/dave, 
						/datum/sprite_accessory/hair/head/emo, 
						/datum/sprite_accessory/hair/head/spiky3,
						/datum/sprite_accessory/hair/head/parted,
						/datum/sprite_accessory/hair/head/shorthair3,
						/datum/sprite_accessory/hair/head/sabitsuki))
	var/beard = pick(list(/datum/sprite_accessory/hair/facial/fullbeard,
						/datum/sprite_accessory/hair/facial/shaved, 
						/datum/sprite_accessory/hair/facial/croppedfullbeard, 
						/datum/sprite_accessory/hair/facial/longbeard, 
						/datum/sprite_accessory/hair/facial/fiveoclock,
						/datum/sprite_accessory/hair/facial/threeoclock,
						/datum/sprite_accessory/hair/facial/manly))

	var/datum/bodypart_feature/hair/head/new_hair = new()
	var/datum/bodypart_feature/hair/facial/new_beard = new()

	if(gender == FEMALE)
		new_hair.set_accessory_type(hairf, null, src)
	else
		new_hair.set_accessory_type(hairm, null, src)
		new_beard.set_accessory_type(beard, null, src)

	new_hair.accessory_colors = pick("#000000", "#5f5a40", "#6e3615")
	new_hair.hair_color = new_hair.accessory_colors 
	hair_color = new_hair.accessory_colors 

	new_beard.accessory_colors = new_hair.accessory_colors
	new_beard.hair_color = new_hair.accessory_colors	

	head.add_bodypart_feature(new_hair)
	head.add_bodypart_feature(new_beard)

	dna.update_ui_block(DNA_HAIR_COLOR_BLOCK)
	dna.species.handle_body(src)

	update_hair()
	update_body()

	for(var/obj/item/W in contents)	//TAINTED CODES
		if(prob(tainted_chance))
			W.max_integrity = W.max_integrity/2
			W.obj_integrity = W.max_integrity/2
			W.tainted = TRUE
			W.color = "#554338"
			W.name = "Tainted [W.name] "

/mob/living/carbon/human/species/npc/deadite/npc_try_backstep()
	return FALSE // deadites cannot juke

/mob/living/carbon/human/species/npc/deadite/npc_should_resist(ignore_grab = TRUE)
	if(!check_mouth_grabbed())
		ignore_grab ||= TRUE
	return ..(ignore_grab = ignore_grab)

/mob/living/carbon/human/species/npc/deadite/handle_combat()
	if(mode == NPC_AI_HUNT)
		if(prob(30)) // do not make this big or else they NEVER SHUT UP
			emote(pick("scream", "rage"))
	. = ..()



/mob/living/carbon/human/proc/deadite_get_aimheight(victim)
	if(!(mobility_flags & MOBILITY_STAND))
		return rand(1, 2) // Bite their ankles!
	return pick(rand(11, 13), rand(14, 17), rand(5, 8)) // Chest, neck, and mouth; face and ears; arms and hands.

/mob/living/carbon/human/species/npc/deadite/npc_choose_attack_zone(mob/living/victim)
	aimheight_change(deadite_get_aimheight(victim))

/mob/living/carbon/human/species/npc/deadite/do_best_melee_attack(mob/living/victim)
	if(do_deadite_attack(victim))
		return TRUE
	return ..() // use grabs and such

/mob/living/carbon/human/species/npc/deadite/handle_ai()
	. = ..()
	try_do_deadite_idle() // sort of a misnomer, just handles zombie noises

// This proc exists because non-converted deadites don't have minds and can't have the antag datum
// So we need two separate entry points for this logic
/mob/living/carbon/human/proc/do_deadite_attack(mob/living/victim)
	// first, we try to bite
	if(try_do_deadite_bite(victim))
		return TRUE // spent our turn
	return FALSE

/mob/living/carbon/human/proc/try_do_deadite_bite(mob/living/victim)
	if(!src || stat >= DEAD)
		return FALSE
	
	var/obj/item/grabbing/bite/bite = get_item_by_slot(SLOT_MOUTH)
	if(istype(bite))
		// 50% chance to continue biting if already started
		if(prob(50))
			bite.bitelimb(src)
			return TRUE
		return FALSE // try something else like grappling

	if(!victim) // if we aren't passed a target, find one at random from nearby. this is currently unused
		for(var/mob/living/carbon/human in view(1, src))
			if(human == src) //prevent self biting
				continue
			if((human.mob_biotypes & MOB_UNDEAD) || ("undead" in human.faction) || HAS_TRAIT(human, TRAIT_ZOMBIE_IMMUNE))
				continue
			victim = human

	if(!victim) // still no one to bite
		return FALSE

	if(!get_location_accessible(src, BODY_ZONE_PRECISE_MOUTH, grabs = TRUE)) // can't bite, mouth is covered!
		return FALSE

	victim.onbite(src)
	// onbite doesn't directly apply the attack delay so we do it here
	changeNext_move(/datum/intent/bite::clickcd)
	return TRUE // use up our turn regardless of if the bite succeeded or not

/mob/living/carbon/human/proc/try_do_deadite_idle()

	if(mob_timers["deadite_idle"])
		if(world.time < mob_timers["deadite_idle"] + rand(5 SECONDS, 10 SECONDS))
			return
	mob_timers["deadite_idle"] = world.time
	emote("idle")
/// Use this to attempt to add the zombie antag datum to a human
/mob/living/carbon/human/proc/zombie_check()
	if(!mind)
		return
	var/already_zombie = mind.has_antag_datum(/datum/antagonist/zombie)
	if(already_zombie)
		return already_zombie
	if(mind.has_antag_datum(/datum/antagonist/vampirelord))
		return
	if(mind.has_antag_datum(/datum/antagonist/werewolf))
		return
	if(mind.has_antag_datum(/datum/antagonist/skeleton))
		return
	if(HAS_TRAIT(src, TRAIT_ZOMBIE_IMMUNE))
		return
	return mind.add_antag_datum(/datum/antagonist/zombie)
/**
 * This occurs when one zombie infects a living human, going into instadeath from here is kind of shit and confusing
 * We instead just transform at the end
 */
/mob/living/carbon/human/proc/zombie_infect_attempt()
	var/datum/antagonist/zombie/zombie_antag = zombie_check()
	if(!zombie_antag)
		return
	if(stat >= DEAD) //do shit the natural way i guess
		return
	to_chat(src, span_danger("I feel horrible... REALLY horrible..."))
	mob_timers["puke"] = world.time
	vomit(1, blood = TRUE, stun = FALSE)
	addtimer(CALLBACK(src, PROC_REF(wake_zombie)), 1 MINUTES)
	return zombie_antag

/mob/living/carbon/human/proc/wake_zombie()
	var/datum/antagonist/zombie/zombie_antag = mind?.has_antag_datum(/datum/antagonist/zombie)
	if(!zombie_antag || zombie_antag.has_turned)
		return FALSE
	flash_fullscreen("redflash3")
	to_chat(src, span_danger("It hurts... Is this really the end for me?"))
	emote("scream") // heres your warning to others bro
	Knockdown(1)
	zombie_antag.wake_zombie(TRUE)
	return TRUE
