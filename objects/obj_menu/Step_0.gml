if(keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space) || (mouse_check_button_pressed(mb_left) && instance_position(mouse_x, mouse_y, obj_menu))) 
{
    show_debug_message("Clicado no objeto");
	room_goto(rm_inicio)
	obj_bg.image_alpha = 0
	instance_destroy(obj_menu)
}