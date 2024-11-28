if(keyboard_check_pressed(vk_escape) && image_alpha == 0)
{
	image_alpha = 0.75
	instance_create_depth(obj_slime.x,obj_slime.y - 100,-100,obj_menu)
	instance_activate_object(obj_menu)
	show_debug_message("clicado")
}
else if(keyboard_check_pressed(vk_escape) && image_alpha == 0.75)
{
	image_alpha = 0
	instance_destroy(obj_menu)
	show_debug_message("clicado2")
}