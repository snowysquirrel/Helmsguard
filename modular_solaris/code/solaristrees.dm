
/obj/structure/flora/roguetree/sapling
	name = "young tree"
	desc = "A young, growing tree. Past its time as a sapling, but not yet worth climbing."
	icon = 'modular_solaris/icons/trees.dmi'
	icon_state = "solt1"
	stump_type = /obj/structure/flora/roguetree/stump/sapling
	pixel_x = -32

/obj/structure/flora/roguetree/sapling/Initialize()
	. = ..()
	icon_state = "solt[rand(1,4)]"

/obj/structure/flora/roguetree/stump/sapling
	name = "tree stump"
	desc = "Youth cut away before it could reach its prime."
	icon = 'modular_solaris/icons/trees.dmi'
	icon_state = "solstump1"
	stump_type = null
	pixel_x = -32

/obj/structure/flora/roguetree/stump/sapling/Initialize()
	. = ..()
	icon_state = "solstump[rand(1,2)]"
