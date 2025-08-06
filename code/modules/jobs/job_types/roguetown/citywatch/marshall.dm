/datum/job/roguetown/marshal // A somewhat ham-fisted merge between marshall and the old town sheriff role. The latter was built like a modern day officer, but we medieval in this bitch!
	title = "Marshall"
	flag = MARSHALL
	department_flag = GARRISON
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_NO_CONSTRUCT
	allowed_ages = list(AGE_MIDDLEAGED, AGE_OLD)
	display_order = JDO_MARSHAL
	selection_color = JCOLOR_SOLDIER
	tutorial = "As the Marshall of Helmsguard, you owe your allegiance to the Grand Duke and their family, you are charged with the crucial duty of enforcing the Grand Duke's law upon the province however necessary. \
	Headquartered in the village of Riverstead, your authority encompasses the entire province. You have the authority to directly recommend a law for the duke to pass, or an outlaw to be declared. \
	The Men-At-Arms are your subordinates, but they answer to the Grand Duke first and foremost. And should there be a shortage of guardsmen at your disposal, \
	you are charged with the authority of levying the local populace to assist you in your duties. \
	In the absence of a Grand Duke, you must rely on the Tome of Justice for guidance, but take their texts as suggestions rather than commands."	

	whitelist_req = FALSE

	spells = list(
	/obj/effect/proc_holder/spell/invoked/order/movemovemove,
	/obj/effect/proc_holder/spell/invoked/order/takeaim,
	/obj/effect/proc_holder/spell/invoked/order/onfeet,
	/obj/effect/proc_holder/spell/invoked/order/hold,
	/obj/effect/proc_holder/spell/invoked/order/focustarget,
	/obj/effect/proc_holder/spell/self/convertrole/guard,
	) // /obj/effect/proc_holder/spell/self/convertrole/bog
	outfit = /datum/outfit/job/roguetown/marshal

	give_bank_account = 40
	noble_income = 20
	min_pq = 0
	max_pq = null
	round_contrib_points = 3
	cmode_music = 'sound/music/combat_guard.ogg'
	advclass_cat_rolls = list (CTAG_MARSHAL = 20)

/datum/outfit/job/roguetown/marshal
	job_bitflag = BITFLAG_ROYALTY | BITFLAG_GARRISON	//Same as Captain, you get decent combat stats so might as well be garrison.

/datum/outfit/job/roguetown/marshal/pre_equip(mob/living/carbon/human/H)
	..() 

	head = /obj/item/clothing/head/roguetown/helmet/sallet
	neck = /obj/item/clothing/neck/roguetown/chaincoif
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/heavy/marshall
	armor = /obj/item/clothing/suit/roguetown/armor/brigandine/sheriff
	cloak = /obj/item/clothing/cloak/stabard/surcoat/marshall
	pants = /obj/item/clothing/under/roguetown/tights/black
	shoes = /obj/item/clothing/shoes/roguetown/boots/nobleboot
	backr = /obj/item/rogueweapon/mace/cudgel/justice
	backl = /obj/item/storage/backpack/rogue/satchel
	belt = /obj/item/storage/belt/rogue/leather/plaquegold
	beltr = /obj/item/storage/belt/rogue/pouch/coins/rich
	beltl = /obj/item/storage/keyring/sheriff
	gloves = /obj/item/clothing/gloves/roguetown/angle
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	id = /obj/item/scomstone
	backpack_contents = list(/obj/item/rogueweapon/huntingknife/idagger/steel/special = 1,  /obj/item/storage/keyring/sheriff = 1, /obj/item/storage/belt/rogue/pouch/coins/rich = 1)
	if(H.mind)
		
		H.adjust_skillrank(/datum/skill/combat/polearms, 2, TRUE)
		H.adjust_skillrank(/datum/skill/combat/swords, 4, TRUE)
		H.adjust_skillrank(/datum/skill/combat/maces, 4, TRUE)
		H.adjust_skillrank(/datum/skill/combat/axes, 2, TRUE)
		H.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
		H.adjust_skillrank(/datum/skill/combat/firearms, 4, TRUE)
		H.adjust_skillrank(/datum/skill/combat/whipsflails, 1, TRUE)
		H.adjust_skillrank(/datum/skill/combat/slings, 1, TRUE)
		H.adjust_skillrank(/datum/skill/combat/shields, 2, TRUE)
		H.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
		H.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
		H.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
		H.adjust_skillrank(/datum/skill/misc/sneaking, 2, TRUE)
		H.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
		H.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
		H.adjust_skillrank(/datum/skill/misc/riding, 4, TRUE)
		H.adjust_skillrank(/datum/skill/misc/tracking, 4, TRUE)
		H.change_stat("strength", 2) //important leadership role, but SHOULDN'T be frontlining
		H.change_stat("perception", 2)
		H.change_stat("intelligence", 3)
		H.change_stat("constitution", 1)
		H.change_stat("endurance", 1)
		H.change_stat("speed", 1)
		H.change_stat("fortune", 1)
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_PERFECT_TRACKER, TRAIT_GENERIC)
	H.verbs |= /mob/proc/haltyell
	H.verbs |= list(/mob/living/carbon/human/proc/request_outlaw, /mob/living/carbon/human/proc/request_law, /mob/living/carbon/human/proc/request_law_removal, /mob/living/carbon/human/proc/request_purge)

/*
/datum/advclass/marshal/kcommander
	name = "Knight Commander"
	tutorial = "You spent your daes as a dutiful knight in the service of the crown. Earning your accolades through military tactics and victories, you're reknown for your warfaring. Now retired from your days afield, you enforce the same iron law you once practiced at war in your home. You run the garrison, knights and the town's laws with a military strictness, and no-one can claim you are weaker on crime than any of those weak Marshals."
	outfit = /datum/outfit/job/roguetown/marshal/kcommander

	category_tags = list(CTAG_MARSHAL)

/datum/outfit/job/roguetown/marshal/kcommander/pre_equip(mob/living/carbon/human/H)
	armor = /obj/item/clothing/suit/roguetown/armor/brigandine/sheriff/coat
	backr = /obj/item/rogueweapon/sword/long/oathkeeper
	belt = /obj/item/storage/belt/rogue/leather
	beltr = /obj/item/storage/belt/rogue/pouch/coins/rich
	beltl = /obj/item/storage/keyring/sheriff
	if(H.mind)
		H.adjust_skillrank(/datum/skill/combat/swords, 4, TRUE)
*/
/mob/living/carbon/human/proc/request_law()
	set name = "Request Law"
	set category = "Voice of Command"
	if(stat)
		return
	var/inputty = input("Write a new law", "MARSHALL") as text|null
	if(inputty)
		if(hasomen(OMEN_NOLORD))
			make_law(inputty)
		else
			var/lord = find_lord()
			if(lord)
				INVOKE_ASYNC(GLOBAL_PROC, GLOBAL_PROC_REF(lord_law_requested), src, lord, inputty)
			else
				make_law(inputty)

/mob/living/carbon/human/proc/request_law_removal()
	set name = "Request Law Removal"
	set category = "Voice of Command"
	if(stat)
		return
	var/inputty = input("Remove a law", "MARSHALL") as text|null
	var/law_index = text2num(inputty) || 0
	if(law_index && GLOB.laws_of_the_land[law_index])
		if(hasomen(OMEN_NOLORD))
			remove_law(law_index)
		else
			var/lord = find_lord()
			if(lord)
				INVOKE_ASYNC(GLOBAL_PROC, GLOBAL_PROC_REF(lord_law_removal_requested), src, lord, law_index)
			else
				remove_law(law_index)

/mob/living/carbon/human/proc/request_purge()
	set name = "Request Purge"
	set category = "Voice of Command"
	if(stat)
		return
	if(hasomen(OMEN_NOLORD))
		purge_laws()
	else
		var/lord = find_lord()
		if(lord)
			INVOKE_ASYNC(GLOBAL_PROC, GLOBAL_PROC_REF(lord_purge_requested), src, lord)
		else
			purge_laws()

/mob/living/carbon/human/proc/request_outlaw()
	set name = "Request Outlaw"
	set category = "Voice of Command"
	if(stat)
		return
	var/inputty = input("Outlaw a person", "MARSHALL") as text|null
	if(inputty)
		if(hasomen(OMEN_NOLORD))
			make_outlaw(inputty)
		else
			var/lord = find_lord()
			if(lord)
				INVOKE_ASYNC(GLOBAL_PROC, GLOBAL_PROC_REF(lord_outlaw_requested), src, lord, inputty)
			else
				make_outlaw(inputty)

/proc/find_lord(required_stat = CONSCIOUS)
	var/mob/living/lord
	for(var/mob/living/carbon/human/H in GLOB.human_list)
		if(!H.mind || H.job != "Grand Duke" || (H.stat > required_stat))
			continue
		lord = H
		break
	return lord

/proc/lord_law_requested(mob/living/marshall, mob/living/carbon/human/lord, requested_law)
	var/choice = alert(lord, "The marshall requests a new law!\n[requested_law]", "MARSHALL LAW REQUEST", "Yes", "No")
	if(choice != "Yes" || QDELETED(lord) || lord.stat > CONSCIOUS)
		if(marshall)
			to_chat(span_warning("The lord has denied the request for a new law!"))
		return
	make_law(requested_law)

/proc/lord_law_removal_requested(mob/living/marshall, mob/living/carbon/human/lord, requested_law)
	if(!requested_law || !GLOB.laws_of_the_land[requested_law])
		return
	var/choice = alert(lord, "The marshall requests the removal of a law!\n[GLOB.laws_of_the_land[requested_law]]", "MARSHALL LAW REQUEST", "Yes", "No")
	if(choice != "Yes" || QDELETED(lord) || lord.stat > CONSCIOUS)
		if(marshall)
			to_chat(span_warning("The lord has denied the request for a law removal!"))
		return
	remove_law(requested_law)

/proc/lord_purge_requested(mob/living/marshall, mob/living/carbon/human/lord)
	var/choice = alert(lord, "The marshall requests a purge of all laws!", "MARSHALL PURGE REQUEST", "Yes", "No")
	if(choice != "Yes" || QDELETED(lord) || lord.stat > CONSCIOUS)
		if(marshall)
			to_chat(span_warning("The lord has denied the request for a purge of all laws!"))
		return
	purge_laws()

/proc/lord_outlaw_requested(mob/living/marshall, mob/living/carbon/human/lord, requested_outlaw)
	var/choice = alert(lord, "The marshall requests to outlaw someone!\n[requested_outlaw]", "MARSHALL OUTLAW REQUEST", "Yes", "No")
	if(choice != "Yes" || QDELETED(lord) || lord.stat > CONSCIOUS)
		if(marshall)
			to_chat(span_warning("The lord has denied the request for declaring an outlaw!"))
		return
	make_outlaw(requested_outlaw)

/mob/proc/haltyell()
	set name = "HALT!"
	set category = "Noises"
	emote("haltyell")




/obj/effect/proc_holder/spell/invoked/order
	name = ""
	range = 1
	associated_skill = /datum/skill/misc/athletics
	devotion_cost = 0
	chargedrain = 1
	chargetime = 15
	releasedrain = 80 // This is quite costy. Shouldn't be able to really spam them right off the cuff, combined with having to type out an order. Should prevent VERY occupied officers from ALSO ordering
	recharge_time = 2 MINUTES
	miracle = FALSE
	sound = 'sound/magic/inspire_02.ogg'


/obj/effect/proc_holder/spell/invoked/order/movemovemove
	name = "Move! Move! Move!"
	overlay_state = "movemovemove"

/obj/effect/proc_holder/spell/invoked/order/movemovemove/cast(list/targets, mob/living/user)
	. = ..()
	if(isliving(targets[1]))
		var/mob/living/target = targets[1]
		var/msg = user.mind.movemovemovetext
		if(!msg)
			to_chat(user, span_alert("I must say something to give an order!"))
			return
		if(user.job == "Marshall")
			if(!target.job == "Man-at-Arms")
				to_chat(user, span_alert("I cannot order one not of my ranks!"))
				return
		if(user.job == "Knight Captain")
			if(!(target.job in list("Knight", "Man-at-Arms")))
				to_chat(user, span_alert("I cannot order one not of my ranks!"))
				return		
		if(target == user)
			to_chat(user, span_alert("I cannot order myself!"))
			return
		user.say("[msg]")
		target.apply_status_effect(/datum/status_effect/buff/order/movemovemove)
		return TRUE
	revert_cast()
	return FALSE

/datum/status_effect/buff/order/movemovemove/nextmove_modifier()
	return 0.85

/datum/status_effect/buff/order/movemovemove
	id = "movemovemove"
	alert_type = /atom/movable/screen/alert/status_effect/buff/order/movemovemove
	effectedstats = list("speed" = 5)
	duration = 1 MINUTES

/atom/movable/screen/alert/status_effect/buff/order/movemovemove
	name = "Move! Move! Move!"
	desc = "My officer has ordered me to move quickly!"
	icon_state = "buff"

/datum/status_effect/buff/order/movemovemove/on_apply()
	. = ..()
	to_chat(owner, span_blue("My officer orders me to move!"))

/obj/effect/proc_holder/spell/invoked/order/takeaim
	name = "Take aim!"
	overlay_state = "takeaim"

/datum/status_effect/buff/order/takeaim
	id = "takeaim"
	alert_type = /atom/movable/screen/alert/status_effect/buff/order/takeaim
	effectedstats = list("perception" = 5)
	duration = 1 MINUTES

/atom/movable/screen/alert/status_effect/buff/order/takeaim
	name = "Take aim!"
	desc = "My officer has ordered me to take aim!"
	icon_state = "buff"

/datum/status_effect/buff/order/takeaim/on_apply()
	. = ..()
	to_chat(owner, span_blue("My officer orders me to take aim!"))

/obj/effect/proc_holder/spell/invoked/order/takeaim/cast(list/targets, mob/living/user)
	. = ..()
	if(isliving(targets[1]))
		var/mob/living/target = targets[1]
		var/msg = user.mind.takeaimtext
		if(!msg)
			to_chat(user, span_alert("I must say something to give an order!"))
			return
		if(user.job == "Marshall")
			if(!target.job == "Man-at-Arms")
				to_chat(user, span_alert("I cannot order one not of my ranks!"))
				return
		if(user.job == "Knight Captain")
			if(!(target.job in list("Knight")))
				to_chat(user, span_alert("I cannot order one not of my ranks!"))
				return		
		if(target == user)
			to_chat(user, span_alert("I cannot order myself!"))
			return
		user.say("[msg]")
		target.apply_status_effect(/datum/status_effect/buff/order/takeaim)
		return TRUE
	revert_cast()
	return FALSE



/obj/effect/proc_holder/spell/invoked/order/onfeet
	name = "On your feet!"
	overlay_state = "onfeet"

/obj/effect/proc_holder/spell/invoked/order/onfeet/cast(list/targets, mob/living/user)
	. = ..()
	if(isliving(targets[1]))
		var/mob/living/target = targets[1]
		var/msg = user.mind.onfeettext
		if(!msg)
			to_chat(user, span_alert("I must say something to give an order!"))
			return
		if(user.job == "Marshall")
			if(!target.job == "Man-at-Arms")
				to_chat(user, span_alert("I cannot order one not of my ranks!"))
				return
		if(user.job == "Knight Captain")
			if(!(target.job in list("Knight")))
				to_chat(user, span_alert("I cannot order one not of my ranks!"))
				return		
		if(target == user)
			to_chat(user, span_alert("I cannot order myself!"))
			return
		user.say("[msg]")
		target.apply_status_effect(/datum/status_effect/buff/order/onfeet)
		if(!(target.mobility_flags & MOBILITY_STAND))
			target.SetUnconscious(0)
			target.SetSleeping(0)
			target.SetParalyzed(0)
			target.SetImmobilized(0)
			target.SetStun(0)
			target.SetKnockdown(0)
			target.set_resting(FALSE)
		return TRUE
	revert_cast()
	return FALSE

/datum/status_effect/buff/order/onfeet
	id = "onfeet"
	alert_type = /atom/movable/screen/alert/status_effect/buff/order/onfeet
	duration = 30 SECONDS

/atom/movable/screen/alert/status_effect/buff/order/onfeet
	name = "On your feet!"
	desc = "My officer has ordered me to my feet!"
	icon_state = "buff"

/datum/status_effect/buff/order/onfeet/on_apply()
	. = ..()
	to_chat(owner, span_blue("My officer orders me to my feet!"))
	ADD_TRAIT(owner, TRAIT_NOPAIN, TRAIT_GENERIC)

/datum/status_effect/buff/order/onfeet/on_remove()
	REMOVE_TRAIT(owner, TRAIT_NOPAIN, TRAIT_GENERIC)
	. = ..()


/obj/effect/proc_holder/spell/invoked/order/hold
	name = "Hold!"
	overlay_state = "hold"


/obj/effect/proc_holder/spell/invoked/order/hold/cast(list/targets, mob/living/user)
	. = ..()
	if(isliving(targets[1]))
		var/mob/living/target = targets[1]
		var/msg = user.mind.holdtext
		if(!msg)
			to_chat(user, span_alert("I must say something to give an order!"))
			return
		if(user.job == "Marshall")
			if(!target.job == "Man-at-Arms")
				to_chat(user, span_alert("I cannot order one not of my ranks!"))
				return
		if(user.job == "Knight Captain")
			if(!(target.job in list("Knight")))
				to_chat(user, span_alert("I cannot order one not of my ranks!"))
				return		
		if(target == user)
			to_chat(user, span_alert("I cannot order myself!"))
			return
		user.say("[msg]")
		target.apply_status_effect(/datum/status_effect/buff/order/hold)
		return TRUE
	revert_cast()
	return FALSE


/datum/status_effect/buff/order/hold
	id = "hold"
	alert_type = /atom/movable/screen/alert/status_effect/buff/order/takeaim
	effectedstats = list("endurance" = 2, "constitution" = 2)
	duration = 1 MINUTES

/atom/movable/screen/alert/status_effect/buff/order/hold
	name = "Hold!"
	desc = "My officer has ordered me to hold!"
	icon_state = "buff"

/datum/status_effect/buff/order/hold/on_apply()
	. = ..()
	to_chat(owner, span_blue("My officer orders me to hold!"))

#define TARGET_FILTER "target_marked"

/obj/effect/proc_holder/spell/invoked/order/focustarget
	name = "Focus target!"
	overlay_state = "focustarget"


/obj/effect/proc_holder/spell/invoked/order/focustarget/cast(list/targets, mob/living/user)
	. = ..()
	if(isliving(targets[1]))
		var/mob/living/target = targets[1]
		var/msg = user.mind.focustargettext
		if(!msg)
			to_chat(user, span_alert("I must say something to give an order!"))
			return
		if(target == user)
			to_chat(user, span_alert("I cannot order myself to be killed!"))
			return
		if(HAS_TRAIT(target, TRAIT_CRITICAL_WEAKNESS))
			to_chat(user, span_alert("They are already vulnerable!"))
			return	
		user.say("[msg]")
		target.apply_status_effect(/datum/status_effect/debuff/order/focustarget)
		return TRUE
	revert_cast()
	return FALSE

/datum/status_effect/debuff/order/focustarget
	id = "focustarget"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/order/focustarget
	effectedstats = list("fortune" = -2)
	duration = 1 MINUTES
	var/outline_colour = "#69050a"

/atom/movable/screen/alert/status_effect/debuff/order/focustarget
	name = "Targetted"
	desc = "A officer has marked me for death!"
	icon_state = "targetted"

/datum/status_effect/debuff/order/focustarget/on_apply()
	. = ..()
	var/filter = owner.get_filter(TARGET_FILTER)
	to_chat(owner, span_alert("I have been marked for death by a officer!"))
	ADD_TRAIT(owner, TRAIT_CRITICAL_WEAKNESS, TRAIT_GENERIC)
	if (!filter)
		owner.add_filter(TARGET_FILTER, 2, list("type" = "outline", "color" = outline_colour, "alpha" = 200, "size" = 1))
	return TRUE

/datum/status_effect/debuff/order/focustarget/on_remove()
	. = ..()
	REMOVE_TRAIT(owner, TRAIT_CRITICAL_WEAKNESS, TRAIT_GENERIC)
	owner.remove_filter(TARGET_FILTER)


/obj/effect/proc_holder/spell/invoked/order/focustarget
	name = "Focus target!"
	overlay_state = "focustarget"


#undef TARGET_FILTER


/mob/living/carbon/human/mind/proc/setorders()
	set name = "Rehearse Orders"
	set category = "Voice of Command"
	mind.movemovemovetext = input("Send a message.", "Move! Move! Move!") as text|null
	if(!mind.movemovemovetext)
		to_chat(src, "I must rehearse something for this order...")
		return
	mind.holdtext = input("Send a message.", "Hold!") as text|null
	if(!mind.holdtext)
		to_chat(src, "I must rehearse something for this order...")
		return
	mind.takeaimtext = input("Send a message.", "Take aim!") as text|null
	if(!mind.takeaimtext)
		to_chat(src, "I must rehearse something for this order...")
		return
	mind.onfeettext = input("Send a message.", "On your feet!") as text|null
	if(!mind.onfeettext)
		to_chat(src, "I must rehearse something for this order...")
		return
	mind.focustargettext = input("Send a message.", "Focus Target!") as text|null
	if(!mind.focustargettext)
		to_chat(src, "I must rehearse something for this order...")
		return
