/datum/round_event_control/antagonist/solo/werewolf
	name = "Verevolfs"
	tags = list(
		TAG_COMBAT,
		TAG_HAUNTED,
		TAG_VILLIAN,
	)
	roundstart = TRUE
	antag_flag = ROLE_WEREWOLF
	shared_occurence_type = SHARED_HIGH_THREAT

	denominator = 80

	base_antags = 1
	maximum_antags = 2
	min_players = 25
	weight = 7

	earliest_start = 0 SECONDS

	typepath = /datum/round_event/antagonist/solo/werewolf
	antag_datum = /datum/antagonist/werewolf

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
		"Marshall",
		"Watchman",
		"Watchwoman",
	)

/datum/round_event/antagonist/solo/werewolf
