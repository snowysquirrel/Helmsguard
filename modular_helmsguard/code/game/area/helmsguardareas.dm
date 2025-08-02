
// OUTDOORS

/area/rogue/outdoors/bridge
	name = "bridge"
	first_time_text = "THE HOWLING BRIDGE"
	discover_sound = 'sound/misc/area_3.ogg'
	icon = 'modular_helmsguard/icons/turf/helmsguard_areas.dmi'
	icon_state = "helmsbridge"
	ambientsounds = AMB_MOUNTAIN
	ambientnight = AMB_MOUNTAIN
	droning_sound = 'sound/music/area/townstreets.ogg'
	droning_sound_dusk = 'sound/music/area/septimus.ogg'
	droning_sound_night = 'sound/music/area/sleeping.ogg'


/area/rogue/outdoors/church_outside
	name = "church outside"
	first_time_text = "SAINT KATHERINE'S MONASTERY"
	discover_sound = 'sound/misc/area_church.ogg'
	icon = 'modular_helmsguard/icons/turf/helmsguard_areas.dmi'
	icon_state = "church_outside"
	ambientsounds = AMB_MOUNTAIN
	ambientnight = AMB_MOUNTAIN
	spookysounds = SPOOKY_GEN
	spookynight = SPOOKY_GEN
	droning_sound = 'sound/music/area/towngenold.ogg'
	droning_sound_dusk = 'sound/music/area/septimus.ogg'
	droning_sound_night = 'sound/music/area/sleeping.ogg'
	soundenv = 17
	converted_type = /area/rogue/indoors/shelter/town/roofs

/area/rogue/outdoors/magician_outside
	name = "wizard tower outside"
	first_time_text = "THE MAGE TOWER"
	discover_sound = 'sound/misc/area_2.ogg'
	icon = 'modular_helmsguard/icons/turf/helmsguard_areas.dmi'
	icon_state = "magician_outside"
	ambientsounds = AMB_MOUNTAIN
	ambientnight = AMB_MOUNTAIN
	droning_sound = 'sound/music/area/towngenold.ogg'
	droning_sound_dusk = 'sound/music/area/septimus.ogg'
	droning_sound_night = 'sound/music/area/sleeping.ogg'


/area/rogue/outdoors/town/riverstead
	name = "outdoors_riverstead"
	icon_state = "town"
	soundenv = 16
	droning_sound = 'sound/music/area/townstreets.ogg'
	droning_sound_dusk = 'sound/music/area/septimus.ogg'
	droning_sound_night = 'sound/music/area/sleeping.ogg'
	converted_type = /area/rogue/indoors/shelter/town
	town_area = TRUE
	first_time_text = "VILLAGE OF RIVERSTEAD"
	discover_sound = 'sound/misc/area_4.ogg'

/area/rogue/outdoors/town/riverstead/roof
	ambientsounds = AMB_MOUNTAIN
	ambientnight = AMB_MOUNTAIN

/area/rogue/outdoors/woods/river
	name = "river"
	icon = 'modular_helmsguard/icons/turf/helmsguard_areas.dmi'
	icon_state = "river"
	ambientsounds = AMB_RIVERDAY
	ambientnight = AMB_RIVERNIGHT
	spookysounds = SPOOKY_FROG
	spookynight = SPOOKY_FOREST

/area/rogue/outdoors/woods/pond
	name = "pond"
	icon = 'modular_helmsguard/icons/turf/helmsguard_areas.dmi'
	icon_state = "pond"
	ambientsounds = AMB_BEACH
	ambientnight = AMB_BEACH
	spookysounds = null
	spookynight = null

/area/rogue/outdoors/hotspring_outside
	name = "springoutside"
	first_time_text = "the mountain spring"
	icon = 'modular_helmsguard/icons/turf/helmsguard_areas.dmi'
	icon_state = "spring_outside"
	ambientsounds = AMB_BEACH
	ambientnight = AMB_BEACH
	spookysounds = null
	spookynight = null
	discover_sound = 'sound/misc/area_4.ogg'

/area/rogue/outdoors/cemetery
	name = "cemetery"
	icon = 'modular_helmsguard/icons/turf/helmsguard_areas.dmi'
	icon_state = "cemetery"
	ambientsounds = AMB_BOGDAY
	ambientnight = AMB_BOGNIGHT
	spookysounds = SPOOKY_FROG
	spookynight = SPOOKY_GEN
	droning_sound = 'sound/music/area/bog.ogg'
	droning_sound_dusk = null
	droning_sound_night = null

// UNDER
/area/rogue/under/cavewet/oldcrypt
	name = "oldcrypt"
	first_time_text = "THE OLD CRYPT"
	discover_sound = 'sound/misc/area_2.ogg'
	icon = 'modular_helmsguard/icons/turf/helmsguard_areas.dmi'
	icon_state = "oldcrypt"

/area/rogue/indoors/hotspring_inside
	name = "springinside"
	icon = 'modular_helmsguard/icons/turf/helmsguard_areas.dmi'
	icon_state = "spring_inside"
	ambientsounds = AMB_BEACH
	ambientnight = AMB_BEACH
	spookysounds = null
	spookynight = null


// ADVENTURER SPAWN

/area/rogue/under/cave/adventurer_cave
	name = "inhumen"
	icon_state = "cave"
	first_time_text = "THE BORDER OF HELMSGUARD"
	discover_sound = 'sound/misc/area_3.ogg'
	droning_sound = 'sound/music/unholy.ogg'
	droning_sound_dusk = 'sound/music/unholy.ogg'
	droning_sound_night = 'sound/music/unholy.ogg'
	converted_type = /area/rogue/outdoors/dungeon1
