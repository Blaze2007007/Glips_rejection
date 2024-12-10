if(!instance_exists(obj_dialogo1))
{
	state = STATES.IDLE
	ativardialogo = false
	slimevel = 5
	salto = - 35
	trocadeslimes()
}
if(place_meeting(x,y,obj_limite))
{
	stop()
	obj_dialogo1.visible = true
	obj_dialogo1.image_speed = 0
	obj_dialogo1.image_index = 0
	instance_destroy(obj_limite)
}
if(place_meeting(x,y,obj_centro) && keyboard_check_pressed(ord("F")))
{
	room_goto_next()
	obj_slime_pai.x = 170
	obj_slime_pai.y = 600
	instance_destroy(obj_hollow)
}
if(room == rm_inicio)
{
	obj_slime_pai.x = 691
	obj_slime_pai.y = 646
}
event_inherited();

