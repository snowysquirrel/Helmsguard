
/area/rogue/outdoors/woods/dread
	name = "Dreadwood Forest"
	icon = 'modular_helmsguard/icons/turf/dreadareas.dmi'
	discover_sound = 'sound/misc/area_4.ogg'
	icon_state = "dreadwood"
	ambush_types = list(
				/turf/open/floor/rogue/dirt,
				/turf/open/floor/rogue/grass,
				/turf/open/water)
	ambush_mobs = list(
				/mob/living/carbon/human/species/skeleton/npc/ambush = 20,
				/mob/living/simple_animal/hostile/retaliate/rogue/wolf = 60,
				/mob/living/simple_animal/hostile/retaliate/rogue/troll/bog = 20,
				/mob/living/simple_animal/hostile/retaliate/rogue/spider = 40,
				/mob/living/carbon/human/species/skeleton/npc/bogguard = 20,
				/mob/living/carbon/human/species/goblin/npc/ambush/cave = 30)
	droning_sound = 'sound/music/area/dreadwood.ogg'
	droning_sound_dusk = 'sound/music/area/dreadwood.ogg'
	droning_sound_night = 'sound/music/area/dreadwood_night.ogg'
	ambientsounds = AMB_BOGDAY
	ambientnight = AMB_BOGNIGHT
	spookysounds = SPOOKY_FROG
	spookynight = SPOOKY_GEN
	location_name = "Dreadwood Forest"
	first_time_text = "Dreadwood Forest"
	ambush_times = list("night","dawn","dusk","day")
	converted_type = /area/rogue/indoors/shelter/woods/dread

/area/rogue/indoors/shelter/woods/dread
	icon = 'modular_helmsguard/icons/turf/dreadareas.dmi'
	icon_state = "dreadwood"
	droning_sound = 'sound/music/area/dreadwood.ogg'
	droning_sound_dusk = 'sound/music/area/dreadwood.ogg'
	droning_sound_night = 'sound/music/area/dreadwood_night.ogg'
	location_name = "Somewhere in Dreadwood"


/// CHURCH


/area/rogue/outdoors/church
	name = "Old Church Outdoor"
	icon = 'modular_helmsguard/icons/turf/dreadareas.dmi'
	discover_sound = 'sound/misc/area_4.ogg'
	icon_state = "dreadchurch_outdoor"
	ambush_types = null
	ambush_mobs = null
	droning_sound = 'sound/music/area/dreadwood.ogg'
	droning_sound_dusk = 'sound/music/area/dreadwood.ogg'
	droning_sound_night = 'sound/music/area/dreadwood_night.ogg'
	ambientsounds = AMB_BOGDAY
	ambientnight = AMB_BOGNIGHT
	spookysounds = SPOOKY_FROG
	spookynight = SPOOKY_GEN
	location_name = "Old Church"
	first_time_text = "THE OLD CHURCH"
	ambush_times = list("night","dawn","dusk","day")
	converted_type = /area/rogue/indoors/shelter/woods/dread

/area/rogue/indoors/church_dread
	name = "Old Church"
	first_time_text = "Old Church"
	icon = 'modular_helmsguard/icons/turf/dreadareas.dmi'	
	icon_state = "dreadchurch"
	droning_sound = 'sound/music/area/dreadwood.ogg'
	droning_sound_dusk = 'sound/music/area/dreadwood.ogg'
	droning_sound_night = 'sound/music/area/dreadwood_night.ogg'
	location_name = "Dreadwood Church"

/area/rogue/under/cave/church_dread_crypt
	name = "Old Church Basement"
	icon = 'modular_helmsguard/icons/turf/dreadareas.dmi'
	icon_state = "dreadchurch_basement"
	discover_sound = 'sound/misc/area_2.ogg'
	droning_sound = 'sound/music/area/catacombs.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	converted_type = /area/rogue/outdoors/dungeon1
	ceiling_protected = TRUE




// TOLL

/area/rogue/indoors/toll_dread
	name = "Toll House"
	first_time_text = "Toll House"
	icon = 'modular_helmsguard/icons/turf/dreadareas.dmi'
	icon_state = "tollhouse"
	droning_sound = null
	droning_sound_dusk = null
	droning_sound_night = null
	location_name = "Dreadwood Toll House"

/*
/area/rogue/outdoors/dread/merc_spawn
	name = "mercenary spawn"
	icon_state = "mercenary_spawn"
	droning_sound = 'sound/music/area/dreadwood.ogg'
	droning_sound_dusk = 'sound/music/area/dreadwood.ogg'
	droning_sound_night = 'sound/music/area/dreadwood_night.ogg'
	location_name = "Mercenary Camp"
*/
