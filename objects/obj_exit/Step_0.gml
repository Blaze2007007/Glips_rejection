if((keyboard_check_pressed(vk_enter)|| (mouse_check_button_pressed(mb_left))) && (instance_position(mouse_x, mouse_y, obj_exit) || global.opcao_escolhida == 3))
{
	game_end()
}
if(instance_position(mouse_x, mouse_y, obj_exit) or global.opcao_escolhida == 3)
{
	image_xscale = lerp(image_xscale,2,0.1)
	image_yscale = lerp(image_yscale,2,0.1)
	global.opcao_escolhida = 3
}
else
{
	image_xscale = lerp(image_xscale,1.5,0.1)
	image_yscale = lerp(image_yscale,1.5,0.1)
}
if(keyboard_check_pressed(vk_tab) && global.opcao_escolhida == 3)
{
	global.opcao_escolhida = 0
	image_xscale = lerp(image_xscale,1.5,0.1)
	image_yscale = lerp(image_yscale,1.5,0.1)
	obj_start.aumentar = true
}
if(instance_position(mouse_x, mouse_y, obj_levels) or instance_position(mouse_x, mouse_y, obj_start) or instance_position(mouse_x, mouse_y, obj_tutorial) &&  global.opcao_escolhida == 3)
{
	image_xscale = lerp(image_xscale,1.5,0.1)
	image_yscale = lerp(image_yscale,1.5,0.1)
}