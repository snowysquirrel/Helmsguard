/datum/round_event_control/antagonist/solo/rebel
	name = "Rebels"
	tags = list(
		TAG_COMBAT,
		TAG_VILLIAN,
	)
	roundstart = TRUE
	antag_flag = ROLE_PREBEL
	shared_occurence_type = SHARED_HIGH_THREAT

	base_antags = 1
	maximum_antags = 3

	max_occurrences = 1

	earliest_start = 0 SECONDS

	typepath = /datum/round_event/antagonist/solo/rebel
	antag_datum = /datum/antagonist/prebel/head

	weight = 2

	restricted_roles = list(
		"Grand Duke",
		"Grand Duchess",
		"Lord Consort",
		"Lady Consort",
		"Dungeoneer",
		"Sergeant",
		"Master-at-arms",
		"Gatemaster",
		"Man-at-arms",
		"Woman-at-arms",
		"Marshal",
		"Merchant",
		"Priest",
		"Acolyte",
		"Vestal",
		"Inquisitor",
		"Chapter Master",
		"Knight Templar",
		"Dame Templar",
		"Templar Sergeant",
		"Templar Maident",
		"Knight Hospitaler",
		"Dame Hospitaler",
		"Hospitaler Sergeant",
		"Hospitaler Maiden",
		"Councillor",
		"Lord Heir",
		"Lady Heir",
		"Hand",
		"Steward",
		"Stewardess",
		"Court Physician",
		"Town Elder",
		"Captain",
		"Archivist",
		"Knight",
		"Court Magician",
		"Inquisitor",
		"Orthodoxist",
		"Warden",
		"Squire",
		"Veteran",
		"Apothecary",
		"Bailiff",
		"Watchman",
		"Watchwoman",
	)

/datum/round_event/antagonist/solo/rebel
