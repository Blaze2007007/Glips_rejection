if(keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space) || (mouse_check_button_pressed(mb_left) && instance_position(mouse_x, mouse_y, obj_exit_levels))) 
{
	room_goto(rm_inicio)
}