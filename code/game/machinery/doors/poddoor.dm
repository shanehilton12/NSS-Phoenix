/obj/machinery/door/blast
	name = "Blast Door"
	desc = "That looks like it doesn't open easily."
	icon = 'icons/obj/doors/rapid_pdoor.dmi'
	icon_state = "pdoor1"
	var/id = 1.0
	var/brigdoors = 0
	dir = 1
	explosion_resistance = 25

/obj/machinery/door/blast/New()
	. = ..()
	if(density)
		layer = 3.3		//to override door.New() proc
	else
		layer = initial(layer)
	return

/obj/machinery/door/blast/Bumped(atom/AM)
	if(!density)
		return ..()
	else
		return 0

/obj/machinery/door/blast/attackby(obj/item/weapon/C as obj, mob/user as mob)
	src.add_fingerprint(user)
	if (!( istype(C, /obj/item/weapon/crowbar) || (istype(C, /obj/item/weapon/twohanded/fireaxe) && C:wielded == 1) ))
		return
	if ((src.density && (stat & NOPOWER) && !( src.operating )))
		spawn( 0 )
			src.operating = 1
			flick("pdoorc0", src)
			src.icon_state = "pdoor0"
			src.SetOpacity(0)
			sleep(15)
			src.density = 0
			src.operating = 0
			return
	return

/obj/machinery/door/blast/open()
	if (src.operating == 1) //doors can still open when emag-disabled
		return
	if (!ticker)
		return 0
	if(!src.operating) //in case of emag
		src.operating = 1
	flick("pdoorc0", src)
	src.icon_state = "pdoor0"
	src.SetOpacity(0)
	sleep(10)
	layer = initial(layer)
	src.density = 0
	update_nearby_tiles()

	if(operating == 1) //emag again
		src.operating = 0
	if(autoclose)
		spawn(150)
			autoclose()
	return 1

/obj/machinery/door/blast/close()
	if (src.operating)
		return
	src.operating = 1
	layer = 3.3
	flick("pdoorc1", src)
	src.icon_state = "pdoor1"
	src.density = 1
	src.SetOpacity(initial(opacity))
	update_nearby_tiles()

	sleep(10)
	src.operating = 0
	return

/obj/machinery/door/blast/reddoors
	name = "Code Red Blast Doors"
	desc = "That looks like it doesn't open easily."
	icon = 'icons/obj/doors/rapid_pdoor.dmi'
	icon_state = "pdoor1"
	explosion_resistance = 25

/obj/machinery/door/blast/reddoors/New()
	. = ..()
	if(density)
		layer = 3.3		//to override door.New() proc
	else
		layer = initial(layer)
	return

/obj/machinery/door/blast/reddoors/Bumped(atom/AM)
	if(!density)
		return ..()
	else
		return 0

/obj/machinery/door/blast/reddoors/attackby(obj/item/weapon/C as obj, mob/user as mob)
	src.add_fingerprint(user)
	if (!( istype(C, /obj/item/weapon/crowbar) || (istype(C, /obj/item/weapon/twohanded/fireaxe) && C:wielded == 1) ))
		return
	if ((src.density && (stat & NOPOWER) && !( src.operating )))
		spawn( 0 )
			src.operating = 1
			flick("pdoorc0", src)
			src.icon_state = "pdoor0"
			src.SetOpacity(0)
			sleep(15)
			src.density = 0
			src.operating = 0
			return
	return

/obj/machinery/door/blast/reddoors/open()
	if (src.operating == 1) //doors can still open when emag-disabled
		return
	if (!ticker)
		return 0
	if(!src.operating) //in case of emag
		src.operating = 1
	flick("pdoorc0", src)
	src.icon_state = "pdoor0"
	src.SetOpacity(0)
	sleep(10)
	layer = initial(layer)
	src.density = 0
	update_nearby_tiles()

	if(operating == 1) //emag again
		src.operating = 0
	if(autoclose)
		spawn(150)
			autoclose()
	return 1

/obj/machinery/door/blast/reddoors/close()
	if (src.operating)
		return
	src.operating = 1
	layer = 3.3
	flick("pdoorc1", src)
	src.icon_state = "pdoor1"
	src.density = 1
	src.SetOpacity(initial(opacity))
	update_nearby_tiles()

	sleep(10)
	src.operating = 0
	return

/*
/obj/machinery/door/blast/two_tile_hor/open()
	if (src.operating == 1) //doors can still open when emag-disabled
		return
	if (!ticker)
		return 0
	if(!src.operating) //in case of emag
		src.operating = 1
	flick("pdoorc0", src)
	src.icon_state = "pdoor0"
	src.SetOpacity(0)
	f1.SetOpacity(0)
	f2.SetOpacity(0)

	sleep(10)
	src.density = 0
	f1.density = 0
	f2.density = 0

	update_nearby_tiles()

	if(operating == 1) //emag again
		src.operating = 0
	if(autoclose)
		spawn(150)
			autoclose()
	return 1

/obj/machinery/door/blast/two_tile_hor/close()
	if (src.operating)
		return
	src.operating = 1
	flick("pdoorc1", src)
	src.icon_state = "pdoor1"

	src.density = 1
	f1.density = 1
	f2.density = 1

	sleep(10)
	src.SetOpacity(initial(opacity))
	f1.SetOpacity(initial(opacity))
	f2.SetOpacity(initial(opacity))

	update_nearby_tiles()

	src.operating = 0
	return

/obj/machinery/door/blast/four_tile_hor/open()
	if (src.operating == 1) //doors can still open when emag-disabled
		return
	if (!ticker)
		return 0
	if(!src.operating) //in case of emag
		src.operating = 1
	flick("pdoorc0", src)
	src.icon_state = "pdoor0"
	sleep(10)
	src.density = 0
	src.sd_SetOpacity(0)

	f1.density = 0
	f1.sd_SetOpacity(0)
	f2.density = 0
	f2.sd_SetOpacity(0)
	f3.density = 0
	f3.sd_SetOpacity(0)
	f4.density = 0
	f4.sd_SetOpacity(0)

	update_nearby_tiles()

	if(operating == 1) //emag again
		src.operating = 0
	if(autoclose)
		spawn(150)
			autoclose()
	return 1

/obj/machinery/door/blast/four_tile_hor/close()
	if (src.operating)
		return
	src.operating = 1
	flick("pdoorc1", src)
	src.icon_state = "pdoor1"
	src.density = 1

	f1.density = 1
	f1.sd_SetOpacity(1)
	f2.density = 1
	f2.sd_SetOpacity(1)
	f3.density = 1
	f3.sd_SetOpacity(1)
	f4.density = 1
	f4.sd_SetOpacity(1)

	if (src.visible)
		src.sd_SetOpacity(1)
	update_nearby_tiles()

	sleep(10)
	src.operating = 0
	return

/obj/machinery/door/blast/two_tile_ver/open()
	if (src.operating == 1) //doors can still open when emag-disabled
		return
	if (!ticker)
		return 0
	if(!src.operating) //in case of emag
		src.operating = 1
	flick("pdoorc0", src)
	src.icon_state = "pdoor0"
	sleep(10)
	src.density = 0
	src.sd_SetOpacity(0)

	f1.density = 0
	f1.sd_SetOpacity(0)
	f2.density = 0
	f2.sd_SetOpacity(0)

	update_nearby_tiles()

	if(operating == 1) //emag again
		src.operating = 0
	if(autoclose)
		spawn(150)
			autoclose()
	return 1

/obj/machinery/door/blast/two_tile_ver/close()
	if (src.operating)
		return
	src.operating = 1
	flick("pdoorc1", src)
	src.icon_state = "pdoor1"
	src.density = 1

	f1.density = 1
	f1.sd_SetOpacity(1)
	f2.density = 1
	f2.sd_SetOpacity(1)

	if (src.visible)
		src.sd_SetOpacity(1)
	update_nearby_tiles()

	sleep(10)
	src.operating = 0
	return

/obj/machinery/door/blast/four_tile_ver/open()
	if (src.operating == 1) //doors can still open when emag-disabled
		return
	if (!ticker)
		return 0
	if(!src.operating) //in case of emag
		src.operating = 1
	flick("pdoorc0", src)
	src.icon_state = "pdoor0"
	sleep(10)
	src.density = 0
	src.sd_SetOpacity(0)

	f1.density = 0
	f1.sd_SetOpacity(0)
	f2.density = 0
	f2.sd_SetOpacity(0)
	f3.density = 0
	f3.sd_SetOpacity(0)
	f4.density = 0
	f4.sd_SetOpacity(0)

	update_nearby_tiles()

	if(operating == 1) //emag again
		src.operating = 0
	if(autoclose)
		spawn(150)
			autoclose()
	return 1

/obj/machinery/door/blast/four_tile_ver/close()
	if (src.operating)
		return
	src.operating = 1
	flick("pdoorc1", src)
	src.icon_state = "pdoor1"
	src.density = 1

	f1.density = 1
	f1.sd_SetOpacity(1)
	f2.density = 1
	f2.sd_SetOpacity(1)
	f3.density = 1
	f3.sd_SetOpacity(1)
	f4.density = 1
	f4.sd_SetOpacity(1)

	if (src.visible)
		src.sd_SetOpacity(1)
	update_nearby_tiles()

	sleep(10)
	src.operating = 0
	return




/obj/machinery/door/blast/two_tile_hor
	var/obj/machinery/door/blast/filler_object/f1
	var/obj/machinery/door/blast/filler_object/f2
	icon = 'icons/obj/doors/1x2blast_hor.dmi'

	New()
		..()
		f1 = new/obj/machinery/door/blast/filler_object (src.loc)
		f2 = new/obj/machinery/door/blast/filler_object (get_step(src,EAST))
		f1.density = density
		f2.density = density
		f1.sd_SetOpacity(opacity)
		f2.sd_SetOpacity(opacity)

	Del()
		del f1
		del f2
		..()

/obj/machinery/door/blast/two_tile_ver
	var/obj/machinery/door/blast/filler_object/f1
	var/obj/machinery/door/blast/filler_object/f2
	icon = 'icons/obj/doors/1x2blast_vert.dmi'

	New()
		..()
		f1 = new/obj/machinery/door/blast/filler_object (src.loc)
		f2 = new/obj/machinery/door/blast/filler_object (get_step(src,NORTH))
		f1.density = density
		f2.density = density
		f1.sd_SetOpacity(opacity)
		f2.sd_SetOpacity(opacity)

	Del()
		del f1
		del f2
		..()

/obj/machinery/door/blast/four_tile_hor
	var/obj/machinery/door/blast/filler_object/f1
	var/obj/machinery/door/blast/filler_object/f2
	var/obj/machinery/door/blast/filler_object/f3
	var/obj/machinery/door/blast/filler_object/f4
	icon = 'icons/obj/doors/1x4blast_hor.dmi'

	New()
		..()
		f1 = new/obj/machinery/door/blast/filler_object (src.loc)
		f2 = new/obj/machinery/door/blast/filler_object (get_step(f1,EAST))
		f3 = new/obj/machinery/door/blast/filler_object (get_step(f2,EAST))
		f4 = new/obj/machinery/door/blast/filler_object (get_step(f3,EAST))
		f1.density = density
		f2.density = density
		f3.density = density
		f4.density = density
		f1.sd_SetOpacity(opacity)
		f2.sd_SetOpacity(opacity)
		f4.sd_SetOpacity(opacity)
		f3.sd_SetOpacity(opacity)

	Del()
		del f1
		del f2
		del f3
		del f4
		..()

/obj/machinery/door/blast/four_tile_ver
	var/obj/machinery/door/blast/filler_object/f1
	var/obj/machinery/door/blast/filler_object/f2
	var/obj/machinery/door/blast/filler_object/f3
	var/obj/machinery/door/blast/filler_object/f4
	icon = 'icons/obj/doors/1x4blast_vert.dmi'

	New()
		..()
		f1 = new/obj/machinery/door/blast/filler_object (src.loc)
		f2 = new/obj/machinery/door/blast/filler_object (get_step(f1,NORTH))
		f3 = new/obj/machinery/door/blast/filler_object (get_step(f2,NORTH))
		f4 = new/obj/machinery/door/blast/filler_object (get_step(f3,NORTH))
		f1.density = density
		f2.density = density
		f3.density = density
		f4.density = density
		f1.sd_SetOpacity(opacity)
		f2.sd_SetOpacity(opacity)
		f4.sd_SetOpacity(opacity)
		f3.sd_SetOpacity(opacity)

	Del()
		del f1
		del f2
		del f3
		del f4
		..()
*/
/obj/machinery/door/blast/filler_object
	name = ""
	icon_state = ""