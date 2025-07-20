///GOBLIN OUTPOST
/area/rogue/indoors/greenskin/
	icon = 'modular_helmsguard/icons/turf/dreadareas.dmi'
	droning_sound = 'sound/music/area/dreadwood.ogg'
	droning_sound_dusk = 'sound/music/area/dreadwood.ogg'
	droning_sound_night = 'sound/music/area/dreadwood_night.ogg'
	ambush_types = null
	ambush_mobs = null

/area/rogue/indoors/greenskin/gobcamp
	name = "goblin outpost interior"
	icon_state = "gobcamp"
	location_name = "deep inside of the Goblin Outpost"

/area/rogue/outdoors/woods/dread/gobcamp_outside
	name = "goblin outpost exterior"
	first_time_text = "Goblin Outpost"
	discover_sound = 'sound/misc/area_3.ogg'
	icon_state = "gobcamp_outside"
	droning_sound = 'sound/music/area/dreadwood.ogg'
	droning_sound_dusk = 'sound/music/area/dreadwood.ogg'
	droning_sound_night = 'sound/music/area/dreadwood_night.ogg'
	location_name = "Goblin Outpost"

/area/rogue/under/cave/goblin_outpost
	name = "goblin_outpost's cave"
	icon_state = "goblinbave"
	ambientsounds = AMB_GENCAVE
	ambientnight = AMB_GENCAVE
	spookysounds = SPOOKY_CAVE
	spookynight = SPOOKY_CAVE
	droning_sound = 'sound/music/area/caves.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	ambush_times = list("night","dawn","dusk","day")
	ambush_types = null
	ambush_mobs = null
	converted_type = /area/rogue/outdoors/caves

//GREENSKIN ENCAMPMENT
/area/rogue/indoors/greenskin/encampment
	name = "greenskin encampment"
	icon_state = "greenskin"
	location_name = "deep inside of the Greenskin Encampment"

/area/rogue/outdoors/woods/dread/encampment_outside
	name = "greenskin encampment exterior"
	first_time_text = "Greenskin Encampment"
	discover_sound = 'sound/misc/area_3.ogg'
	icon_state = "greenskin_outdoor"
	droning_sound = 'sound/music/area/dreadwood.ogg'
	droning_sound_dusk = 'sound/music/area/dreadwood.ogg'
	droning_sound_night = 'sound/music/area/dreadwood_night.ogg'
	location_name = "Greenskin Encampment"
