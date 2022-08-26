/obj/item/melee/whip
	name = "whip"
	desc = "A generic whip."
	icon_state = "chain"
	item_state = "chain"
	obj_flags = OBJ_FLAG_CONDUCTIBLE
	slot_flags = SLOT_BELT
	force = 10
	throwforce = 7
	w_class = ITEM_SIZE_NORMAL
	origin_tech = list(TECH_COMBAT = 4)
	attack_verb = list("flicked", "whipped", "lashed")

/obj/item/melee/whip/abyssal
	name = "abyssal whip"
	desc = "A weapon from the abyss. Requires 70 attack to wield."
	icon_state = "whip"
	item_state = "whip"
	obj_flags = OBJ_FLAG_CONDUCTIBLE
	slot_flags = SLOT_BELT
	force = 16 //max hit with 60 strength and no equipment. Duel Arena no No forfeit - Snapshot
	throwforce = 7
	w_class = ITEM_SIZE_NORMAL
	origin_tech = list(TECH_COMBAT = 4)
	attack_verb = list("flicked", "whipped", "lashed")

/obj/item/melee/whip/chainofcommand
	name = "chain of command"
	desc = "A tool used by great men to placate the frothing masses."
	attack_verb = list("flogged", "whipped", "lashed", "disciplined")
	icon_state = "chain"
	item_state = "whip"

/obj/item/material/sword/replica/officersword
	name = "fleet officer's sword"
	desc = "A polished sword issued to officers of the fleet."
	icon_state = "officersword"
	item_state = "officersword"
	slot_flags = SLOT_BELT
	applies_material_colour = FALSE

/obj/item/material/sword/replica/officersword/marine
	name = "marine NCO's sword"
	desc = "A polished sword issued to SCG Marine NCOs."
	icon_state = "marinesword"

/obj/item/material/sword/replica/officersword/marineofficer
	name = "marine officer's sword"
	desc = "A curved sword issued to SCG Marine officers."
	icon_state = "marineofficersword"
	item_state = "marineofficersword"

/obj/item/material/sword/replica/officersword/pettyofficer
	name = "chief petty officer's cutlass"
	desc = "A polished cutlass issued to chief petty officers of the fleet."
	icon_state = "pettyofficersword"
	item_state = "pettyofficersword"

/obj/item/material/mekmace
	name = "scrap mace"
	desc = "A mace normally used by the ork meks, made of scrap."
	str_requirement = 13
	force = 35
	icon = 'icons/obj/weapons/melee/misc.dmi'
	icon_state = "mekmace"
	item_state = "mekmace"

/obj/item/material/mekmace/afterattack(atom/target, mob/user, proximity_flag, click_parameters)

	if(istype(target, /obj/item/stack/material))
		var/obj/item/stack/material/M = target
		to_chat(user, "<span class='notice'> You start making scrap. </span>")
		if(do_after(user, 30))
			to_chat(user, "<span class='notice'> You make scrap using the [target].</span>")
			new /obj/item/stack/material/scrap(target.loc, M.amount)
			del(target)
		else
			to_chat(user, "<span class='notice'> You stop making scrap.</span>")
	. = ..()

/obj/item/melee/whip/lashoftorment //my little POGchamp pain harvester
	name = "lash of torment"
	desc = "Made up of lascivious coils and barbed hooks, a Lash of Torment moves with a mind of its own."
	icon = 'icons/obj/weapons/melee/misc.dmi'
	icon_state = "lash"
	item_state = "lash"
	hitsound = 'sound/weapons/whip.ogg'
	obj_flags = OBJ_FLAG_CONDUCTIBLE
	slot_flags = SLOT_BELT
	force = 5
	block_chance = 35
	throwforce = 7
	w_class = ITEM_SIZE_NORMAL
	origin_tech = list(TECH_COMBAT = 4)
	attack_verb = list("flicked", "whipped", "lashed")
	var/slan = 1

//code copypasted from the mutated arm
/obj/item/melee/whip/lashoftorment/attack(mob/living/carbon/C as mob, var/mob/living/carbon/human/user as mob) //
	user.setClickCooldown(5)
	var/hit_zone = ran_zone()
	if(!isheretic(user))
		return
	if(C.stat == DEAD)
		to_chat(user,"<font color='#800080'>There is no pain to be harvested from the dead, a waste...</font>")
	if(user.a_intent == I_HELP)
		visible_message("<font color='#800080'>[user] lustfully whips [C] , leaving a red mark.</font>")
		playsound(usr, 'sound/weapons/succubus.ogg', 100, 1, 1)
	else
		playsound(usr, 'sound/effects/slanattack.ogg', 100, 1, 1)
		C.apply_damage(rand(30,40), BRUTE, hit_zone, 0,(DAM_SHARP|DAM_EDGE))
		to_chat(C, "<span class='warning'>[user] mangles your body with the whip. It causes you pain on a level you didn't know existed.</span>")
		if(C.gender == MALE)
			playsound(usr, 'sound/voice/Screams_Male_3.ogg', 100, 1, 1)
		else if(C.gender == FEMALE)
			playsound(usr, 'sound/voice/Screams_Woman_1.ogg', 100, 1, 1)
		..()


/obj/item/melee/whip/lashoftorment/pickup(var/mob/living/carbon/human/user)
	if(!isheretic(user))
		to_chat(user, "<span class='warning'>An overwhelming feeling of dread comes over you as you pick up the [src]. It would be wise to be rid of this quickly.</span>")
		user.make_dizzy(120)
		playsound(usr, 'sound/effects/whispers1.ogg', 100, 0, -1)

// KRIEG MELEE

/obj/item/melee/trench_axe
	name = "Trench Axe"
	desc = "Used mainly for murdering those on the enemy side."
	icon = 'icons/obj/weapons/melee/misc.dmi'
	icon_state = "trenchaxe"
	item_state = "trenchaxe"
	wielded_icon = "trenchaxe-w"
	slot_flags = SLOT_BELT|SLOT_BACK|SLOT_S_STORE
	force = 35
	block_chance = 30
	sharp = TRUE
	hitsound = "slash_sound"
	drop_sound = 'sound/items/handle/axe_drop.ogg'
	equipsound = 'sound/items/equip/axe_equip.ogg'
	grab_sound = 'sound/items/handle/axe_grab.ogg'
	grab_sound_is_loud = TRUE
	weapon_speed_delay = 7

// NEW MELEE

/obj/item/melee/classic_baton/daemonhammer
	name = "Daemonhammer"
	desc = "A power weapon of incredible legend and stature amongst the Ordos Malleus, this Daemonhammer has been used by countless Inquisitor's in their conflict against the unholy creatures of chaos."
	icon_state = "thunder_hammer"
	item_state = "trenchaxe"
	wielded_icon = "trenchaxe-w"
	slot_flags = SLOT_BACK|SLOT_S_STORE
	w_class = ITEM_SIZE_HUGE
	str_requirement = 13
	force = 50
	block_chance = 65
	grab_sound_is_loud = TRUE
	weapon_speed_delay = 8
	edge = TRUE
	sales_price = 180

// CHAINSWORD

/obj/item/melee/chain/mercycs
	name = "Locke Pattern Double-Edged Chainsword"
	desc = "Nicknamed 'Mercy', This Chainsword is designed for a absolute lunatic, it comes with two ripping edges. Designed for maximum rip and tear."
	icon = 'icons/obj/weapons/melee/misc.dmi'
	icon_state = "mercychainsword"
	item_state = "mercychainsword"
	wielded_icon = "mercychainsword"
	slot_flags = SLOT_BELT|SLOT_BACK|SLOT_S_STORE
	str_requirement = 13
	force = 44
	block_chance = 30
	sharp = TRUE
	edge = TRUE
	hitsound = 'sound/weapons/chainsword.ogg'
	drop_sound = 'sound/items/handle/axe_drop.ogg'
	equipsound = 'sound/items/equip/axe_equip.ogg'
	grab_sound = 'sound/items/handle/axe_grab.ogg'
	grab_sound_is_loud = TRUE
	weapon_speed_delay = 9
	sales_price = 50

/obj/item/melee/chain/inqcs
	name = "Drusian Pattern Chainsword"
	desc = "Nicknamed the 'Crusader', It's a common Chainsword pattern issued to Inquisitorial agents of the Inquisition in the Koronus Expanse, Designed solely to smite the filthy xenos."
	icon = 'icons/obj/weapons/melee/misc.dmi'
	icon_state = "inqchainsword"
	item_state = "inqchainsword"
	wielded_icon = "inqchainsword"
	slot_flags = SLOT_BELT|SLOT_BACK|SLOT_S_STORE
	str_requirement = 11
	force = 41
	block_chance = 35
	sharp = TRUE
	edge = TRUE
	hitsound = 'sound/weapons/chainsword.ogg'
	drop_sound = 'sound/items/handle/axe_drop.ogg'
	equipsound = 'sound/items/equip/axe_equip.ogg'
	grab_sound = 'sound/items/handle/axe_grab.ogg'
	grab_sound_is_loud = TRUE
	weapon_speed_delay = 9
	sales_price = 45

/obj/item/melee/chain/inqcs/Guard // making them inqcs because it has the shittiest stats, dont want these to be strong
	name = "Imperial Guard chainsword" //add it to guard outfits later down the track
	desc = "A chainsword, likely belonging to an NCO or higher rank in the Astra Militarium. Under the golden eagle it reads 'For the Throne'"
	icon_state = "guardchains"
	item_state = "inqchainsword"
	sales_price = 40

/obj/item/melee/chain/inqcs/gold
	name = "Terra Pattern Chainsword" //add it to RT's vault
	desc = "A golden chainsword emblazened with over the top shine from it's expensive base metal. Almost as golden as a Custodes, you think."
	icon_state = "goldchains"
	item_state = "goldchains"
	sales_price = 120 //only RT has it. if made craftable, decrease value.

/obj/item/melee/chain/pcsword
	name = "Mark I Pattern Chainsword"
	desc = "The standard issued chainsword of the Adeptus Astartes since Millenias ago, Forged by the finest Warsmith, these Chainsword have seen the test of time."
	icon = 'icons/obj/weapons/melee/misc.dmi'
	icon_state = "pcsword"
	item_state = "pcsword"
	wielded_icon = "pcsword"
	slot_flags = SLOT_BELT|SLOT_BACK|SLOT_S_STORE
	str_requirement = 16
	force = 47
	block_chance = 55
	sharp = TRUE
	edge = TRUE
	hitsound = 'sound/weapons/chainsword.ogg'
	drop_sound = 'sound/items/handle/axe_drop.ogg'
	equipsound = 'sound/items/equip/axe_equip.ogg'
	grab_sound = 'sound/items/handle/axe_grab.ogg'
	grab_sound_is_loud = TRUE
	weapon_speed_delay = 7
	sales_price = 65

/obj/item/melee/chain/pcsword/eviscerator
	name = "Eviscerator Pattern Chainsword"
	desc = "Favoured by Ecclesiarchy Zealots and Ordo Hereticus Members, It's a absurdly large, two-handed chainsword, equipped with a crude disruption field found commonly on power weapon, Though extremely unwieldly, It is a powerful sword, And in the hands of an Astarte, it's truly shines on the Battlefield."
	icon = 'icons/obj/weapons/melee/misc.dmi'
	icon_state = "eviscerator"
	item_state = "eviscerator"
	wielded_icon ="eviscerator"
	str_requirement = 13
	force = 27// it's unwieldy when you don't use two hands, baby sword.
	force_wielded = 49
	block_chance = 35
	sharp = TRUE
	edge = TRUE
	w_class = ITEM_SIZE_HUGE
	hitsound = 'sound/weapons/chainsword.ogg'
	drop_sound = 'sound/items/handle/axe_drop.ogg'
	equipsound = 'sound/items/equip/axe_equip.ogg'
	grab_sound = 'sound/items/handle/axe_grab.ogg'
	grab_sound_is_loud = TRUE
	slot_flags = SLOT_BACK|SLOT_S_STORE
	attack_verb = list("attacked", "sawed", "cleaved", "torn", "cut")
	weapon_speed_delay = 11
	sales_price = 70

/obj/item/melee/chain/pcsword/khorneaxe
	name = "Khornate Chainaxe"
	desc = "The Chainaxe of the Blood God's chosen mortal men and Astartes alike. It looks excellent for killing, maiming, and perhaps even burning. It doesn't look very good for blocking, good thing you're only gonna attack with it."
	icon = 'icons/obj/weapons/melee/misc.dmi'
	icon_state = "chainaxe"
	item_state = "chainaxe"
	wielded_icon = "chainaxe"
	str_requirement = 16
	force = 47 // blood for the blood god. its strong,  but the shit block chance makes it balanced
	force_wielded = 55
	block_chance = 28
	sharp = TRUE
	edge = TRUE
	w_class = ITEM_SIZE_NORMAL
	hitsound = 'sound/weapons/chainsword.ogg'
	drop_sound = 'sound/items/handle/axe_drop.ogg'
	equipsound = 'sound/items/equip/axe_equip.ogg'
	grab_sound = 'sound/items/handle/axe_grab.ogg'
	grab_sound_is_loud = TRUE
	slot_flags = SLOT_BACK|SLOT_S_STORE
	attack_verb = list("attacked", "sawed", "cleaved", "torn", "cut")
	weapon_speed_delay = 8
	sales_price = 85
