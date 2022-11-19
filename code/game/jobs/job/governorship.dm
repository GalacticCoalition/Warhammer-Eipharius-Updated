// Governor

var/datum/announcement/minor/captain_announcement = new(do_newscast = 1)

/datum/job/governor
	title = "Planetary Governor"
	department = "Planetary Governor"
	head_position = 1
	department_flag = COM|CIV
	social_class = SOCIAL_CLASS_MAX
	total_positions = 1
	spawn_positions = 1
	open_when_dead = 0
	supervisors = "The Golden Throne and the High Lords of Terra"
	selection_color = "#540c97"
	req_admin_notify = 1
	access = list(20) 			//See get_access()
	minimal_access = list(20) 	//See get_acce ss()
	minimal_player_age = 65
	economic_modifier = 20
	announced = TRUE
	latejoin_at_spawnpoints = TRUE

	ideal_character_age = 120
	outfit_type = /decl/hierarchy/outfit/job/governor
	auto_rifle_skill = 8
	semi_rifle_skill = 8
	sniper_skill = 8
	shotgun_skill = 8
	lmg_skill = 8
	smg_skill = 8
	cultist_chance = 50 // we want funny inq vs rt nonsense. highest in game besides pathfinder/pilgrim


	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		..()
		H.fully_replace_character_name("Governor [current_name]")
		H.add_stats(rand(14,18), rand(14,18), rand(14,18), rand(14,18))
		H.add_skills(rand(6,10),rand(6,10),rand(5,6),rand(1,8),rand(1,8)) //melee, ranged, med, eng, surgery
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		H.warfare_language_shit(LANGUAGE_HIGH_GOTHIC )
		H.adjustStaminaLoss(-INFINITY)
		H.warfare_faction = IMPERIUM
		H.say(":v [title] reporting for duty!")
		H.verbs += list(/mob/living/carbon/human/proc/hire)
		to_chat(H, "<span class='notice'><b><font size=3>You are the ruling lord of the old city of Messina and by proxy the ice-world of Eipharius -- having arrived in M41 923 exactly fifty years ago. By the golden writ signed by the High Lords of Terra, you have authorization to explore, colonize, and trade with near impunity. Your goals are far into the future, achievable with rejuvenate treatment that shall keep you alive long enough to see the tithe fleets arrive in a few decades time.  You anticipate the coming border wars with the navigator guilds, the uprisings of cults on this forsaken world and the dissent among your retinue as you ask for greater and greater sacrifice each passing year.</font></b></span>")

/datum/job/governor/get_access()
	return get_all_station_access()

/datum/job/heir
	title = "Heir"
	head_position = 1
	department_flag = COM|CIV
	social_class = SOCIAL_CLASS_HIGH
	total_positions = 1
	spawn_positions = 1
	open_when_dead = 0
	supervisors = "Your Lord. If you so desire..."
	selection_color = "#6220a0"
	req_admin_notify = 1
	minimal_player_age = 25
	economic_modifier = 10
	ideal_character_age = 50
	latejoin_at_spawnpoints = TRUE
	announced = FALSE
	auto_rifle_skill = 7
	semi_rifle_skill = 7
	sniper_skill = 7
	shotgun_skill = 7
	lmg_skill = 7
	smg_skill = 7
	cultist_chance = 30 // lots of delicacies growing up


	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		..()
		H.fully_replace_character_name("Lord [current_name]")
		H.add_stats(rand(13,16), rand(13,16), rand(13,15), rand(13,17)) //
		H.add_skills(rand(6,10),rand(6,10),rand(1,8),rand(1,8),rand(1,6)) //melee, ranged, med, eng, surgery
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC )
		H.warfare_language_shit(LANGUAGE_HIGH_GOTHIC )
		H.adjustStaminaLoss(-INFINITY)
		H.say(":v [title] reporting for duty!")
		H.warfare_faction = IMPERIUM
		to_chat(H, "<span class='notice'><b><font size=3>You are the heir to the Lord Trader, born within the City of Messina this world is all you know and you been prepared over your young life to succeed your Lord and one day rule this planet. Despite all they have given you, an entire planet to lead -- there are pressures from benefactors close to the Trader that encourage his death so that you may take the mantle from them.</font></b></span>")


	access = list(access_security, access_guard_common, access_magi,
			            access_medical, access_mechanicus, access_change_ids, access_ai_upload, access_heads,
			            access_all_personal_lockers, access_village, access_bar, access_janitor,
			            access_kitchen, access_cargo, access_qm, access_hydroponics,
			            access_library, access_mining, access_heads_vault, access_mining_station,
			            access_hop, access_RC_announce, access_keycard_auth, access_gateway, access_treasury,)
	minimal_access = list(access_security, access_guard_common, access_magi,
			            access_medical, access_change_ids, access_heads,
			            access_all_personal_lockers, access_village, access_bar, access_janitor,
			            access_kitchen, access_cargo, access_qm, access_hydroponics,
			            access_library, access_mining, access_heads_vault, access_mining_station,
			            access_hop, access_RC_announce, access_keycard_auth, access_gateway, access_treasury)

	outfit_type = /decl/hierarchy/outfit/job/heir


// Seneschal/steward removed until we need it due to pop
/*
/datum/job/hop
	title = "Steward"
	head_position = 1
	department_flag = COM|CIV
	social_class = SOCIAL_CLASS_HIGH
	total_positions = 1
	spawn_positions = 1
	open_when_dead = 0
	supervisors = "the Rogue Trader"
	selection_color = "#3e0177"
	req_admin_notify = 1
	minimal_player_age = 25
	economic_modifier = 10
	ideal_character_age = 50
	latejoin_at_spawnpoints = TRUE
	announced = FALSE
	auto_rifle_skill = 7
	semi_rifle_skill = 7
	sniper_skill = 7
	shotgun_skill = 7
	lmg_skill = 7
	smg_skill = 7
	cultist_chance = 30 // command going culty is good in round wildness


	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		..()
		H.fully_replace_character_name("Steward [current_name]")
		H.add_stats(rand(12,14), rand(16,18), rand(10,13), rand(13,18)) //they are like rogues but smarter and faster
		H.add_skills(rand(7,10),rand(7,10),rand(5,6),rand(4,8),rand(1,6)) //melee, ranged, med, eng, surgery
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC )
		H.warfare_language_shit(LANGUAGE_HIGH_GOTHIC )
		H.adjustStaminaLoss(-INFINITY)
		H.say(":v [title] reporting for duty!")
		H.warfare_faction = IMPERIUM
		to_chat(H, "<span class='notice'><b><font size=3>You are the Steward and personal aid to the Lord Trader acting as their Major-Domo, you interact with the Administratum and Munitorium on behalf of your Lord while wielding some semblence of the golden writ of authority in their absence.</font></b></span>")


	access = list(access_security, access_guard_common, access_magi,
			            access_medical, access_mechanicus, access_change_ids, access_ai_upload, access_heads,
			            access_all_personal_lockers, access_village, access_bar, access_janitor,
			            access_kitchen, access_cargo, access_qm, access_hydroponics,
			            access_library, access_mining, access_heads_vault, access_mining_station,
			            access_hop, access_RC_announce, access_keycard_auth, access_gateway, access_treasury,)
	minimal_access = list(access_security, access_guard_common, access_magi,
			            access_medical, access_mechanicus, access_change_ids, access_ai_upload, access_heads,
			            access_all_personal_lockers, access_village, access_bar, access_janitor,
			            access_kitchen, access_cargo, access_qm, access_hydroponics,
			            access_library,access_mining, access_heads_vault, access_mining_station,
			            access_hop, access_RC_announce, access_keycard_auth, access_gateway, access_treasury)

	outfit_type = /decl/hierarchy/outfit/job/hop
*/
/datum/job/servant
	title = "Servant"
	department_flag = PIL
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Lord Trader"
	selection_color = "#6220a0"
	economic_modifier = 5
	social_class = SOCIAL_CLASS_MED
	announced = 0
	access = list(access_security, access_guard_common,
			            access_medical, access_mechanicus, access_ai_upload, access_heads,
			            access_all_personal_lockers, access_village, access_bar, access_janitor,
			            access_kitchen, access_cargo, access_qm, access_hydroponics,
			            access_library, access_mining, access_heads_vault, access_mining_station,
			            access_hop, access_RC_announce, access_keycard_auth, access_gateway, access_treasury,)
	minimal_access = list(access_security, access_guard_common,
			            access_medical, access_mechanicus, access_ai_upload, access_heads,
			            access_all_personal_lockers, access_village, access_bar, access_janitor,
			            access_kitchen, access_cargo, access_qm, access_hydroponics,
			            access_library, access_mining, access_heads_vault, access_mining_station,
			            access_hop, access_RC_announce, access_keycard_auth, access_gateway, access_treasury)
	minimal_player_age = 3
	ideal_character_age = 40
	outfit_type = /decl/hierarchy/outfit/job/cargo/servant
	latejoin_at_spawnpoints = 1
	auto_rifle_skill = 7 // guard are 7-8.
	semi_rifle_skill = 7
	sniper_skill = 6
	shotgun_skill = 7
	lmg_skill = 6
	smg_skill = 7
	cultist_chance = 20

	equip(var/mob/living/carbon/human/H)
		var/current_name = H.real_name
		..()
		H.fully_replace_character_name("Servant [current_name]")
		H.add_stats(rand(11,15), rand(11,15), rand(11,15), rand(13,16)) //meant to be a brute keeping the plebs in line
		H.add_skills(rand(6,8),rand(6,8),rand(3,6),4,rand(3,6)) //melee, ranged, med, eng, surgery
		H.assign_random_quirk()
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		H.warfare_language_shit(LANGUAGE_HIGH_GOTHIC)
		H.adjustStaminaLoss(-INFINITY)
		H.say(":v [title] reporting for duty!")
		H.warfare_faction = IMPERIUM
		to_chat(H, "<span class='notice'><b><font size=3>You are a servant in direct service to the Lord Trader to whom you owe your life, having been in service to their family for generations of your line you are the last surviving member of your family, you may of served them for many decades or have been recently been inducted into the house out of your own  free will. Regardless you are their property now.</font></b></span>")


/mob/living/carbon/human/proc/hire(var/mob/living/carbon/human/M in view(src))
	set category = "Planetary Governor"
	set name = "Hire Mercenary"
	set desc = "Finally! Some recognition!"
	if(!client)
		to_chat(src, "<span class='notice'>Thats not a person.</span>")
		return

	var/list/options = list(
		"Hire on",
		"Cancel",
		)

	var/theoptions = input("Would you like to hire [M]?", "Hiring Menu") as null|anything in options
	if (isnull(theoptions))																	//You chose poorly
		return
	if(!Adjacent(M))																			//How close are we?
		to_chat(src, "<span class='notice'>Get a little closer.</span>")
		return

	switch(theoptions)
		if ("Cancel")
			return	//do nothing

		if ("Hire on")
			for(var/obj/item/card/id/W in M.contents)
				M.unEquip(W)
				visible_message(("<span class='alert'>[src] snatches [W] and tosses it on the ground.</span>"))

			var/obj/item/card/id/dog_tag/guardsman/W = new
			W.access = list(access_security, access_guard_common, access_village,)
			W.assignment = "Mercenary"
			W.registered_name = M.real_name
			W.update_label()
			M.equip_to_slot_or_del(W, slot_wear_id)
			M.regenerate_icons()
			M.mind.special_role = "Mercenary"
			src.mind.special_role = "Mercenary"
			M.warfare_faction = IMPERIUM
			M.AddInfectionImages()
			src.AddInfectionImages()
			visible_message("<span class='alert'>[src] slaps a new ID onto [M].</span>")
			src.say("Welcome to my service.")
		else
			return

// TDM OPFOR bad xeno, removed for now
/*
/datum/job/mercenary/watchman
	title = "Xeno Combatant"
	department_flag = SRV
	social_class = SOCIAL_CLASS_MIN //these boys are gross
	total_positions = 30
	spawn_positions = 30
	supervisors = "Cult Leader and Sgt."
	selection_color = "#414397"
	latejoin_at_spawnpoints = TRUE
	equip(var/mob/living/carbon/human/H)
		H.warfare_faction = IMPERIUM
		..()
		H.say("; [title] reporting for duty!")




	equip(var/mob/living/carbon/human/H)
		H.warfare_faction = IMPERIUM
		..()
		H.add_stats(rand(11,16), rand(11,17), rand(11,17), rand (8,14))
		H.warfare_language_shit(LANGUAGE_LOW_GOTHIC)
		H.adjustStaminaLoss(-INFINITY)
		H.assign_random_quirk()
		H.witchblood()
		H.stat = UNCONSCIOUS
		H.sleeping = 500
		H.verbs += list(
			/mob/living/carbon/human/proc/mercenaryclass,
		)

*/