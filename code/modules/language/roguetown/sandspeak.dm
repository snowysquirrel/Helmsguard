/datum/language/celestial
	name = "Assarian"
	desc = "An ancient language spoken by the nomadic tribes of the desert, its words are as fluid as the sands and as sharp as the sun's rays."
	speech_verb = "says"
	ask_verb = "asks"
	exclaim_verb = "yells"
	key = "a"
	flags = LANGUAGE_HIDE_ICON_IF_UNDERSTOOD | LANGUAGE_HIDE_ICON_IF_NOT_UNDERSTOOD
	space_chance = 60
	default_priority = 80
	icon_state = "asse"
	spans = list(SPAN_SAND)
	syllables = list(
		"ak", "al", "am", "an", "ar", "bi", "da", "de", "di", "ek", "el",
		"en", "er", "il", "in", "ir", "ka", "la", "le", "li", "ma", "nd",
		"ol", "on", "ra", "ve", "ya", "ada", "ama", "ara", "ard", "ari", "asi",
		"bil", "bir", "cin", "edi", "eni", "ere", "eri", "ici", "ile", "ili", "ind",
		"lan", "lar", "ldu", "ler", "mak", "man", "nda", "nde", "nla", "ola", "old",
		"onu", "rin", "var", "ver", "yor")
