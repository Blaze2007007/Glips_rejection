if(global.started)
{
salas = global.player_data.numero_niveis
}
else
{
salas = 0
}

if(int64(salas) >= 3)
{
	image_index = 3
	if(ativa == false)
	{
		ativa = true
	}
}
else
{
	image_index = 0
}
if((keyboard_check_pressed(vk_enter)|| (mouse_check_button_pressed(mb_left))) && (instance_position(mouse_x, mouse_y, obj_levels_image_holder_2) || global.escolha == 2) && image_index == 3)
{
	room_goto(rm_nivel3)
	instance_create_depth(148,582,-100,obj_slime_pai)
}
if(instance_position(mouse_x, mouse_y, obj_levels_image_holder_2) or global.escolha == 2)
{
	image_xscale = lerp(image_xscale,3.2,0.1)
	image_yscale = lerp(image_yscale,3.2,0.1)
	global.escolha = 2
}
else
{
	image_xscale = lerp(image_xscale,2.7,0.1)
	image_yscale = lerp(image_yscale,2.7,0.1)
}
if(keyboard_check_pressed(vk_tab) && global.escolha == 2 && !aumentar)
{
	global.escolha = 0
	image_xscale = lerp(image_xscale,2.7,0.1)
	image_yscale = lerp(image_yscale,2.7,0.1)
	aumentar = true
	obj_levels_image_holder.aumentar = true
}
if(instance_position(mouse_x, mouse_y, obj_levels_image_holder_1) or instance_position(mouse_x, mouse_y, obj_levels_image_holder) &&  global.escolha == 2)
{
	image_xscale = lerp(image_xscale,2.7,0.1)
	image_yscale = lerp(image_yscale,2.7,0.1)
}
if(aumentar && global.escolha == 2)
{
	aumentar = false
	image_xscale = lerp(image_xscale,2.7,0.1)
	image_yscale = lerp(image_yscale,2.7,0.1)
}