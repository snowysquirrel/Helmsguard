
///KEYS

/obj/item/roguekey/apoth
	name = "apothecary key"
	desc = "The key smells of herbs, feeling soothing to the touch."
	icon_state = "greenkey"
	lockid = "apothecary"

/obj/item/roguekey/cook
	name = "cook's key"
	desc = "This key belongs to the cook of the tavern."
	icon_state = "ekey"
	lockid = "cook"

/obj/item/roguekey/chap_master
	name = "chaptermaster's key"
	desc = "A key for the chaptermaster's quarters, bearing the psycross"
	icon_state = "greenkey"
	lockid = "chapter"


/obj/item/roguekey/smith
	name = "blacksmith's key"
	desc = "A key for the blacksmith's personal quarters, bearing the anvil."
	icon_state = "rustkey"
	lockid = "blacksmith"

///KEYRINGS
/obj/item/storage/keyring/cook
	keys = list(/obj/item/roguekey/tavern, /obj/item/roguekey/cook)

/obj/item/storage/keyring/tapser
	keys = list(/obj/item/roguekey/tavern)

/obj/item/storage/keyring/shophand
	keys = list(/obj/item/roguekey/shop)

/obj/item/storage/keyring/chaptermaster
	keys = list(/obj/item/roguekey/inquisition, /obj/item/roguekey/church, /obj/item/roguekey/chap_master)

/obj/item/storage/keyring/guild
	keys = list(/obj/item/roguekey/crafterguild, /obj/item/roguekey/smith)

/obj/item/storage/keyring/guild_apprentice
	keys = list(/obj/item/roguekey/crafterguild)

/obj/item/storage/keyring/apothecary
	keys = list(/obj/item/roguekey/apoth)

/obj/item/storage/keyring/archmage
	keys = list(/obj/item/roguekey/tower, /obj/item/roguekey/mage)

/obj/item/storage/keyring/tower
	keys = list(/obj/item/roguekey/tower)
