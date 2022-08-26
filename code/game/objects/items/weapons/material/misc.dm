/obj/item/material/harpoon
	name = "harpoon"
	sharp = 1
	edge = 1
	desc = "Tharr she blows!"
	icon_state = "harpoon"
	item_state = "harpoon"
	force_divisor = 0.3 // 18 with hardness 60 (steel)
	attack_verb = list("jabbed","stabbed","ripped")

/obj/item/material/hatchet
	name = "hatchet"
	desc = "A very sharp axe blade upon a short fibremetal handle. It has a long history of chopping things, but now it is used for chopping wood."
	icon = 'icons/obj/weapons/melee/misc.dmi'
	icon_state = "hatchet"
	force_divisor = 0.2 // 12 with hardness 60 (steel)
	thrown_force_divisor = 0.75 // 15 with weight 20 (steel)
	w_class = ITEM_SIZE_SMALL
	sharp = 1
	edge = 1
	origin_tech = list(TECH_MATERIAL = 2, TECH_COMBAT = 1)
	attack_verb = list("chopped", "torn", "cut")
	applies_material_colour = 0
	hitsound = "chop"

/obj/item/material/hatchet/tacknife
	name = "tactical knife"
	desc = "You'd be killing loads of people if this was Medal of Valor: Heroes of Space."
	icon = 'icons/obj/weapons/melee/misc.dmi'
	icon_state = "tacknife"
	item_state = "knife"
	attack_verb = list("stabbed", "chopped", "cut")
	applies_material_colour = 1

/obj/item/material/hatchet/machete
	name = "machete"
	desc = "A long, sturdy blade with a rugged handle. Leading the way to cursed treasures since before space travel."
	icon_state = "machetedx"
	item_state = "machete"
	w_class = ITEM_SIZE_NORMAL
	slot_flags = SLOT_BELT

/obj/item/material/hatchet/machete/Initialize()
	icon_state = "machete[pick("","_red","_blue", "_black", "_olive")]"
	. = ..()

/obj/item/material/hatchet/machete/deluxe
	name = "deluxe machete"
	desc = "A fine example of a machete, with a polished blade, wooden handle and a leather cord loop."
	icon_state = "machetedx"
	item_state = "machete"
	sales_price = 5

/obj/item/material/minihoe // -- Numbers
	name = "mini hoe"
	desc = "It's used for removing weeds or scratching your back."
	icon = 'icons/obj/weapons/melee/misc.dmi'
	icon_state = "hoe"
	item_state = "hoe"
	force_divisor = 0.25 // 5 with weight 20 (steel)
	thrown_force_divisor = 0.25 // as above
	w_class = ITEM_SIZE_SMALL
	attack_verb = list("slashed", "sliced", "cut", "clawed")

/obj/item/material/scythe
	icon_state = "scythe0"
	name = "scythe"
	desc = "A sharp and curved blade on a long fibremetal handle, this tool makes it easy to reap what you sow."
	force_divisor = 0.275 // 16 with hardness 60 (steel)
	thrown_force_divisor = 0.25 // 5 with weight 20 (steel)
	sharp = 1
	edge = 1
	throw_speed = 1
	throw_range = 3
	w_class = ITEM_SIZE_HUGE
	slot_flags = SLOT_BACK
	origin_tech = list(TECH_MATERIAL = 2, TECH_COMBAT = 2)
	attack_verb = list("chopped", "sliced", "cut", "reaped")

/obj/item/material/sword/commissword
	name = "commissar's sword"
	desc = "An orante officer's sword and the Commissar's prized possession. Used to cut down heretics and cowards alike"
	icon = 'icons/obj/weapons/melee/misc.dmi'
	icon_state = "commissword"
	item_state = "commissword"
	attack_verb = list("stabbed", "chopped", "cut", "sliced")
	force = 33
	sharp = 1
	edge = 1
	block_chance = 50
	w_class = ITEM_SIZE_NORMAL
	origin_tech = list(TECH_MATERIAL = 2, TECH_COMBAT = 2)
	slot_flags = SLOT_BELT
	sales_price = 25

/obj/item/material/sword/slaanesh
	name = "slaanesh sword"
	desc = "A sword made of corruption."
	icon = 'icons/obj/weapons/melee/misc.dmi'
	icon_state = "slaanesh_sword"
	item_state = "sabre"
	attack_verb = list("stabbed", "chopped", "cut", "sliced")
	force = 30
	sharp = 1
	edge = 1
	block_chance = 30
	w_class = ITEM_SIZE_NORMAL
	origin_tech = list(TECH_MATERIAL = 2, TECH_COMBAT = 2)
	slot_flags = SLOT_BELT
	sales_price = 100

/obj/item/material/sword/hellblade
	name = "hellblade sword"
	desc = "A sword forged with corruption and souls of the raged."
	icon = 'icons/obj/weapons/melee/misc.dmi'
	icon_state = "hellblade"
	item_state = "sabre"
	attack_verb = list("stabbed", "chopped", "cut", "sliced", "burned")
	force = 40
	sharp = 1
	edge = 1
	block_chance = 65
	w_class = ITEM_SIZE_NORMAL
	origin_tech = list(TECH_MATERIAL = 2, TECH_COMBAT = 2)
	slot_flags = SLOT_BELT
	sales_price = 240

/obj/item/material/sword/commissword/sabre
	name = "Sabre"
	desc = "A masteredcrafted sabre of exceptional quality, it has a duelists grip."
	icon = 'icons/obj/weapons/melee/misc.dmi'
	icon_state = "sabre"
	item_state = "sabre"
	block_chance = 65
	sales_price = 35

/obj/item/material/sword/choppa
	name = "choppa"
	desc = "Fixed out of a rusted sheet of metal, this choppa looks too big to be a sword. More like a piece of iron."
	icon = 'icons/obj/weapons/melee/misc.dmi'
	str_requirement = 13
	icon_state = "choppa"
	item_state = "choppa"
	attack_verb = list("stabbed", "chopped", "cut", "sliced")
	force = 42
	block_chance = 25
	sharp = 1
	edge = 1
	hitsound = "slash_sound"
	w_class = ITEM_SIZE_NORMAL
	origin_tech = list(TECH_MATERIAL = 2, TECH_COMBAT = 2)
	slot_flags = SLOT_BELT
	sales_price = 2
