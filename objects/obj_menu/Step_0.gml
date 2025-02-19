if(keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space) || (mouse_check_button_pressed(mb_left) && instance_position(mouse_x, mouse_y, obj_menu))) 
{
	room_goto(rm_inicio)
	instance_destroy(obj_slime_pai)
	obj_bg.image_alpha = 0
	instance_destroy(obj_menu)
}