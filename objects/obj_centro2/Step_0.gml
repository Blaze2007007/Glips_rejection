if(place_meeting(x,y,obj_slime_pai) && keyboard_check_pressed(ord("F")))
{
	room_goto(rm_inicio)
	instance_destroy(obj_slime_pai)
}