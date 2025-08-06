/datum/round_event_control/antagonist/solo/lich
	name = "Lich"
	tags = list(
		TAG_COMBAT,
		TAG_HAUNTED,
		TAG_VILLIAN,
	)
	roundstart = TRUE
	antag_flag = ROLE_LICH
	shared_occurence_type = SHARED_HIGH_THREAT

	denominator = 80

	base_antags = 1
	maximum_antags = 2

	weight = 2	//i hate you
	max_occurrences = 1 // mashallah

	earliest_start = 0 SECONDS

	typepath = /datum/round_event/antagonist/solo/lich
	antag_datum = /datum/antagonist/lich

	restricted_roles = list(
		"Lord Elector",
		"Lady Elector",
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
		"Knight Captain",
		"Archivist",
		"Knight",
		"Court Magician",
		"Inquisitor",
		"Orthodoxist",
		"Warden",
		"Squire",
		"Veteran",
		"Apothecary",
		"Marshall",
		"Watchman",
		"Watchwoman",
	)

/datum/round_event/antagonist/solo/lich
