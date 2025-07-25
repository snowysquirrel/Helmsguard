
///SPAWNER///
// I wont be adding the void dragon or the leyline lycan in here for the time being until needed

/obj/effect/mobspawner/elemental_spawner_all // all of the elementals we have except t4
	name = "elemental spawner"
	anchored = TRUE
	density = FALSE
	min_mobs = 2
	max_mobs = 3
	mob_types = list(
	/mob/living/simple_animal/hostile/retaliate/rogue/elemental/crawler = 8, // t1
	/mob/living/simple_animal/hostile/retaliate/rogue/elemental/warden = 6, // t2
	/mob/living/simple_animal/hostile/retaliate/rogue/elemental/behemoth = 3 // t3

	)
	text_faction = "A group of elementals"
	objfaction = list("elementals")

/obj/effect/mobspawner/elemental_spawner_simple // only up to t2 elementals
	name = "simple elemental spawner"
	anchored = TRUE
	density = FALSE
	min_mobs = 2
	max_mobs = 4
	mob_types = list(
	/mob/living/simple_animal/hostile/retaliate/rogue/elemental/crawler = 6,
	/mob/living/simple_animal/hostile/retaliate/rogue/elemental/warden = 2
	)
	text_faction = "A cobble of elementals" // rock pun
	objfaction = list("elementals")

/obj/effect/mobspawner/elemental_spawner_hard // only t3 elementals
	name = "hard elemental spawner"
	anchored = TRUE
	density = FALSE
	min_mobs = 1
	max_mobs = 2
	mob_types = list(
	/mob/living/simple_animal/hostile/retaliate/rogue/elemental/behemoth = 5
	)
	text_faction = "A boulder of elementals" // rock pun x2
	objfaction = list("elementals")

/obj/effect/mobspawner/elemental_spawner_boss // t4 elemental (the big boy, kinda lackluster)
	name = "boss elemental spawner"
	anchored = TRUE
	density = FALSE
	min_mobs = 1
	max_mobs = 1
	mob_types = list(
	/mob/living/simple_animal/hostile/retaliate/rogue/elemental/colossus = 5
	)
	text_faction = "A shifting mound of stone"
	objfaction = list("elementals")

/obj/effect/mobspawner/fae_spawner_all // all of the fae we have except t4
	name = "fae spawner"
	anchored = TRUE
	density = FALSE
	min_mobs = 2
	max_mobs = 3
	mob_types = list(
	/mob/living/simple_animal/hostile/retaliate/rogue/fae/sprite = 8, // t1
	/mob/living/simple_animal/hostile/retaliate/rogue/fae/glimmerwing = 6, // t2
	/mob/living/simple_animal/hostile/retaliate/rogue/fae/dryad = 1 // t3

	)
	text_faction = "A group of wildfae"
	objfaction = list("fae")

/obj/effect/mobspawner/fae_spawner_simple // only up to t2 fae
	name = "simple fae spawner"
	anchored = TRUE
	density = FALSE
	min_mobs = 2
	max_mobs = 4
	mob_types = list(
	/mob/living/simple_animal/hostile/retaliate/rogue/fae/sprite = 6,
	/mob/living/simple_animal/hostile/retaliate/rogue/fae/glimmerwing = 2
	)
	text_faction = "A glitter of wildfae" // fairy pun
	objfaction = list("fae")

/obj/effect/mobspawner/fae_spawner_hard // only t3 fae, and 1 max since dryad is nuts
	name = "hard fae spawner"
	anchored = TRUE
	density = FALSE
	min_mobs = 1
	max_mobs = 1
	mob_types = list(
	/mob/living/simple_animal/hostile/retaliate/rogue/fae/dryad = 5
	)
	text_faction = "A springy wildfae" // fairy pun x2
	objfaction = list("fae")

/obj/effect/mobspawner/fae_spawner_boss // t4 fae (casts a boatload of ice magic)
	name = "boss fae spawner"
	anchored = TRUE
	density = FALSE
	min_mobs = 1
	max_mobs = 1
	mob_types = list(
	/mob/living/simple_animal/hostile/retaliate/rogue/fae/sylph = 5
	)
	text_faction = "A freezing abberation"
	objfaction = list("fae")

/obj/effect/mobspawner/infernal_spawner_all // all of the infernals we have except t4
	name = "infernal spawner"
	anchored = TRUE
	density = FALSE
	min_mobs = 2
	max_mobs = 3
	mob_types = list(
	/mob/living/simple_animal/hostile/retaliate/rogue/infernal/imp = 8, // t1
	/mob/living/simple_animal/hostile/retaliate/rogue/infernal/hellhound = 6, // t2
	/mob/living/simple_animal/hostile/retaliate/rogue/infernal/watcher = 2 // t3

	)
	text_faction = "A group of infernals"
	objfaction = list("infernals")

/obj/effect/mobspawner/infernal_spawner_simple // only up to t2 infernals
	name = "simple infernal spawner"
	anchored = TRUE
	density = FALSE
	min_mobs = 2
	max_mobs = 4
	mob_types = list(
	/mob/living/simple_animal/hostile/retaliate/rogue/infernal/imp = 6,
	/mob/living/simple_animal/hostile/retaliate/rogue/infernal/hellhound = 2
	)
	text_faction = "An ember of infernals" // fire pun
	objfaction = list("infernals")

/obj/effect/mobspawner/infernal_spawner_hard // only t3 infernals
	name = "hard infernal spawner"
	anchored = TRUE
	density = FALSE
	min_mobs = 1
	max_mobs = 2
	mob_types = list(
	/mob/living/simple_animal/hostile/retaliate/rogue/infernal/watcher = 5
	)
	text_faction = "A fire of infernals" // fire pun x2
	objfaction = list("infernals")

/obj/effect/mobspawner/infernal_spawner_boss // t4 infernal (summons ads, an actual proper boss fight)
	name = "boss infernal spawner"
	anchored = TRUE
	density = FALSE
	min_mobs = 1
	max_mobs = 1
	mob_types = list(
	/mob/living/simple_animal/hostile/retaliate/rogue/infernal/fiend = 5
	)
	text_faction = "A blazing daemon"
	objfaction = list("infernals")
