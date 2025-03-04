if((keyboard_check_pressed(vk_enter) || (mouse_check_button_pressed(mb_left))) && (instance_position(mouse_x, mouse_y, obj_tutorial) || global.opcao_escolhida == 2))
{
    room_goto(rm_tutorial)
	instance_create_layer(160,644,layer,obj_slime_pai)
}
if(instance_position(mouse_x, mouse_y, obj_tutorial) or global.opcao_escolhida == 2)
{
	image_xscale = lerp(image_xscale,2,0.1)
	image_yscale = lerp(image_yscale,2,0.1)
	global.opcao_escolhida = 2
}
else
{
	image_xscale = lerp(image_xscale,1.5,0.1)
	image_yscale = lerp(image_yscale,1.5,0.1)
}
if(keyboard_check_pressed(vk_tab) && global.opcao_escolhida == 2 && !aumentar)
{
	global.opcao_escolhida = 3
	image_xscale = lerp(image_xscale,1.5,0.1)
	image_yscale = lerp(image_yscale,1.5,0.1)
	aumentar = true
}
if(instance_position(mouse_x, mouse_y, obj_levels) or instance_position(mouse_x, mouse_y, obj_exit)  or instance_position(mouse_x, mouse_y, obj_start) && global.opcao_escolhida == 2)
{
	image_xscale = lerp(image_xscale,1.5,0.1)
	image_yscale = lerp(image_yscale,1.5,0.1)
}
if(aumentar && global.opcao_escolhida == 2)
{
	aumentar = false
	image_xscale = lerp(image_xscale,2,0.1)
	image_yscale = lerp(image_yscale,2,0.1)
}