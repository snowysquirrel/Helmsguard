/obj/structure/fluff/signage/template
	name = "sign"
	desc = ""
	icon = 'icons/roguetown/misc/signs.dmi'
	icon_state = "signwrote"
	density = TRUE
	anchored = TRUE
	layer = ABOVE_MOB_LAYER
	plane = GAME_PLANE_UPPER
	blade_dulling = DULLING_BASHCHOP
	max_integrity = 500
	destroy_sound = 'sound/combat/hits/onwood/destroyfurniture.ogg'
	attacked_sound = list('sound/combat/hits/onwood/woodimpact (1).ogg','sound/combat/hits/onwood/woodimpact (2).ogg')

	var/written = "It doesn't seem to have anything written on it."

/obj/structure/fluff/signage/template/examine(mob/user)
	. = ..()
	if(!user.is_literate())
		. += "I have no idea what it says."
	else
		. += "[written]"
