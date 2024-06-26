/obj/effect/bhole
	name = "black hole"
	icon = 'icons/obj/objects.dmi'
	desc = "FUCK FUCK FUCK AAAHHH!"
	icon_state = "bhole3"
	opacity = 1
	unacidable = 1
	density = 0
	anchored = 1

/obj/effect/bhole/New()
	spawn(4)
		controller()

/obj/effect/bhole/proc/controller()
	while(src)

		if(!isturf(loc))
			qdel(src)
			return

		//DESTROYING STUFF AT THE EPICENTER
		for(var/mob/living/M in orange(1,src))
		//	qdel(M) ((DISABLED FOR NOW TO PREVENT ACCIDENTAL ADMIN MURDER))
		for(var/obj/O in orange(1,src))
			qdel(O)
		var/base_turf = get_base_turf_by_area(src)
		for(var/turf/simulated/ST in orange(1,src))
			if(ST.type == base_turf)
				continue
			ST.ChangeTurf(base_turf)

		sleep(6)
		grav(12, 8, 12, 0 )
		sleep(6)
		grav( 16, 14, 20, 0 )
		sleep(6)
		grav( 19, 14, 10, 0 )
		sleep(6)
		grav( 14, 13, 40, 1 )
		sleep(6)
		grav( 5, 3, 40, 1 )
		sleep(6)
		grav( 6, 3, 40, 1 )
		sleep(6)
		grav( 4, 2, 50, 6 )
		sleep(6)
		grav( 3, 2, 50, 6 )
		sleep(6)
		grav( 2, 2, 75,25 )
		sleep(6)



		//MOVEMENT
		if( prob(50) )
			src.anchored = 0
			step(src,pick(GLOB.alldirs))
			src.anchored = 1

/obj/effect/bhole/proc/grav(var/r, var/ex_act_force, var/pull_chance, var/turf_removal_chance)
	if(!isturf(loc))	//blackhole cannot be contained inside anything. Weird stuff might happen
		qdel(src)
		return
	for(var/t = -r, t < r, t++)
		affect_coord(x+t, y-r, ex_act_force, pull_chance, turf_removal_chance)
		affect_coord(x-t, y+r, ex_act_force, pull_chance, turf_removal_chance)
		affect_coord(x+r, y+t, ex_act_force, pull_chance, turf_removal_chance)
		affect_coord(x-r, y-t, ex_act_force, pull_chance, turf_removal_chance)
	return

/obj/effect/bhole/proc/affect_coord(var/x, var/y, var/ex_act_force, var/pull_chance, var/turf_removal_chance)
	//Get turf at coordinate
	var/turf/T = locate(x, y, z)
	if(isnull(T))	return

	//Pulling and/or ex_act-ing movable atoms in that turf
	if( prob(pull_chance) )
		for(var/obj/O in T.contents)
			if(O.anchored)
				O.ex_act(ex_act_force)
			else
				step_towards(O,src)
		for(var/mob/living/M in T.contents)
			step_towards(M,src)

	//Destroying the turf
	if( T && istype(T,/turf/simulated) && prob(turf_removal_chance) )
		var/turf/simulated/ST = T
		var/base_turf = get_base_turf_by_area(src)
		if(ST.type != base_turf)
			ST.ChangeTurf(base_turf)
