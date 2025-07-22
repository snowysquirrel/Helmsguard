/datum/crafting_recipe/roguetown/engineering
	abstract_type = /datum/crafting_recipe/roguetown/engineering

/datum/crafting_recipe/roguetown/engineering/coolingtable
	name = "Cooling Table"
	result = /obj/structure/table/cooling
	reqs = list(/obj/item/grown/log/tree/small = 1,
				/obj/item/ingot/iron = 1,
				/obj/item/roguegear = 1)
	verbage_simple = "engineer"
	verbage = "engineers"
	skillcraft = /datum/skill/craft/engineering
	craftdiff = 4

/datum/crafting_recipe/roguetown/engineering/lever
	name = "lever"
	result = /obj/structure/lever
	reqs = list(/obj/item/roguegear = 1)
	verbage_simple = "engineer"
	verbage = "engineers"
	skillcraft = /datum/skill/craft/engineering

/datum/crafting_recipe/roguetown/engineering/trapdoor
	name = "floorhatch"
	result = /obj/structure/floordoor
	reqs = list(/obj/item/grown/log/tree/small = 1,
					/obj/item/roguegear = 1)
	verbage_simple = "engineer"
	verbage = "engineers"
	skillcraft = /datum/skill/craft/engineering
	craftdiff = 2

/datum/crafting_recipe/roguetown/engineering/bars
	name = "metal bars"
	result = /obj/structure/bars
	reqs = list(/obj/item/ingot/iron = 1)
	verbage_simple = "engineer"
	verbage = "engineers"
	skillcraft = /datum/skill/craft/engineering

/datum/crafting_recipe/roguetown/engineering/shopbars
	name = "shop bars"
	result = /obj/structure/bars/shop
	reqs = list(/obj/item/ingot/iron = 1)
	verbage_simple = "engineer"
	verbage = "engineers"
	skillcraft = /datum/skill/craft/engineering

/datum/crafting_recipe/roguetown/engineering/distiller
	name = "copper distiller"
	result = /obj/structure/fermentation_keg/distiller
	reqs = list(/obj/item/ingot/copper = 2, /obj/item/roguegear = 1)
	verbage_simple = "engineer"
	verbage = "engineers"
	skillcraft = /datum/skill/craft/engineering
	craftdiff = 2

/datum/crafting_recipe/roguetown/engineering/freedomchair
	name = "LIBERTAS"
	result = /obj/structure/chair/freedomchair/crafted
	reqs = list(/obj/item/ingot/gold = 1, /obj/item/roguegear = 3)
	verbage_simple = "engineer"
	verbage = "engineers"
	skillcraft = /datum/skill/craft/engineering
	craftdiff = 4

/datum/crafting_recipe/roguetown/engineering/passage
	name = "passage"
	result = /obj/structure/bars/passage
	reqs = list(/obj/item/ingot/iron = 1,
					/obj/item/roguegear = 1)
	verbage_simple = "engineer"
	verbage = "engineers"
	skillcraft = /datum/skill/craft/engineering
	craftdiff = 2

/datum/crafting_recipe/roguetown/engineering/passage/TurfCheck(mob/user, turf/T)
	if(istype(T,/turf/open/transparent/openspace))
		return FALSE
	if(istype(T,/turf/open/lava))
		return FALSE
	if(istype(T,/turf/open/water))
		return FALSE
	return ..()

//pyro arrow crafting, from stonekeep
/datum/crafting_recipe/roguetown/engineering/pyrobolt
	name = "pyroclastic bolt"
	result = /obj/item/ammo_casing/caseless/rogue/bolt/pyro
	reqs = list(/obj/item/ammo_casing/caseless/rogue/bolt = 1,
				/obj/item/reagent_containers/food/snacks/grown/rogue/fyritius = 1)
	req_table = TRUE
	craftdiff = 1
	skillcraft = /datum/skill/craft/engineering

/datum/crafting_recipe/roguetown/engineering/pyrobolt_five
	name = "pyroclastic bolt (x5)"
	result = list(
				/obj/item/ammo_casing/caseless/rogue/bolt/pyro,
				/obj/item/ammo_casing/caseless/rogue/bolt/pyro,
				/obj/item/ammo_casing/caseless/rogue/bolt/pyro,
				/obj/item/ammo_casing/caseless/rogue/bolt/pyro,
				/obj/item/ammo_casing/caseless/rogue/bolt/pyro
				)
	reqs = list(/obj/item/ammo_casing/caseless/rogue/bolt = 5,
				/obj/item/reagent_containers/food/snacks/grown/rogue/fyritius = 5)
	req_table = TRUE
	craftdiff = 1
	skillcraft = /datum/skill/craft/engineering

/datum/crafting_recipe/roguetown/engineering/pyroarrow
	name = "pyroclastic arrow"
	result = /obj/item/ammo_casing/caseless/rogue/arrow/pyro
	reqs = list(/obj/item/ammo_casing/caseless/rogue/arrow/iron = 1,
				/obj/item/reagent_containers/food/snacks/grown/rogue/fyritius = 1)
	req_table = TRUE
	craftdiff = 1
	skillcraft = /datum/skill/craft/engineering

/datum/crafting_recipe/roguetown/engineering/pyroarrow_five
	name = "pyroclastic arrow (x5)"
	result = list(
				/obj/item/ammo_casing/caseless/rogue/arrow/pyro,
				/obj/item/ammo_casing/caseless/rogue/arrow/pyro,
				/obj/item/ammo_casing/caseless/rogue/arrow/pyro,
				/obj/item/ammo_casing/caseless/rogue/arrow/pyro,
				/obj/item/ammo_casing/caseless/rogue/arrow/pyro
				)
	reqs = list(/obj/item/ammo_casing/caseless/rogue/arrow/iron = 5,
				/obj/item/reagent_containers/food/snacks/grown/rogue/fyritius = 5)
	req_table = TRUE
	craftdiff = 1
	skillcraft = /datum/skill/craft/engineering

// FIREARMS CRAFTING RECIPE

/datum/crafting_recipe/roguetown/firearmstock
	name = "Firearm stock"
	tools = (/obj/item/rogueweapon/huntingknife)
	reqs = list(/obj/item/grown/log/tree/small = 1)
	result = list(/obj/item/weaponcrafting/stock)
	skillcraft = /datum/skill/craft/engineering
	craftdiff = 2

/datum/crafting_recipe/roguetown/firearmparts
	name = "Firearm parts"
	reqs = list(/obj/item/ingot/steel = 2)
	result = list(/obj/item/weaponcrafting/receiver)
	skillcraft = /datum/skill/craft/engineering
	craftdiff = 4

/datum/crafting_recipe/roguetown/firearmbarrel
	name = "Firearm barrel"
	reqs = list(/obj/item/ingot/iron = 2)
	result = list(/obj/item/weaponcrafting/barrel)
	skillcraft = /datum/skill/craft/engineering
	craftdiff = 3

/datum/crafting_recipe/roguetown/arquebus
	name = "Arquebus Rifle"
	reqs = list(/obj/item/ingot/steel = 16, /obj/item/ingot/bronze = 2, /obj/item/weaponcrafting/barrel = 1, /obj/item/weaponcrafting/receiver = 1, /obj/item/grown/log/tree/small = 1, /obj/item/weaponcrafting/stock = 1)
	result = list(/obj/item/gun/ballistic/arquebus)
	skillcraft = /datum/skill/craft/engineering
	craftdiff = 5 //le ultimate challenge

/datum/crafting_recipe/roguetown/arquebuspistol
	name = "Arquebus pistol"
	reqs = list(/obj/item/ingot/steel = 8, /obj/item/ingot/bronze = 1 , /obj/item/weaponcrafting/barrel = 1, /obj/item/weaponcrafting/receiver = 1, /obj/item/grown/log/tree/small = 1)
	result = list(/obj/item/gun/ballistic/arquebus_pistol)
	skillcraft = /datum/skill/craft/engineering
	craftdiff = 4

/datum/crafting_recipe/roguetown/firearmramrod
	name = "replacement ramrod"
	reqs = list(/obj/item/ingot/iron = 1)
	result = list(/obj/item/ramrod)
	skillcraft = /datum/skill/craft/engineering
	craftdiff = 3
