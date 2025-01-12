var arquivo = working_directory + "jogador_dados.json"
if((keyboard_check_pressed(vk_enter)|| (mouse_check_button_pressed(mb_left))) && (instance_position(mouse_x, mouse_y, obj_start) || global.opcao_escolhida == 0))
{
	room_goto_next()
	if(!file_exists(arquivo))
	{
		instance_create_layer(190,446,layer,obj_slime_pai)
	}
	else
	{
		instance_create_layer(player_data.posicao._x,player_data.posicao._y,layer,obj_slime_pai)
	}
}
if(instance_position(mouse_x, mouse_y, obj_start) or global.opcao_escolhida == 0)
{
	image_xscale = lerp(image_xscale,2,0.1)
	image_yscale = lerp(image_yscale,2,0.1)
	global.opcao_escolhida = 0
}
else
{
	image_xscale = lerp(image_xscale,1.5,0.1)
	image_yscale = lerp(image_yscale,1.5,0.1)
}
if(keyboard_check_pressed(vk_tab) && global.opcao_escolhida == 0 && !aumentar)
{
	global.opcao_escolhida = 1
	image_xscale = lerp(image_xscale,1.5,0.1)
	image_yscale = lerp(image_yscale,1.5,0.1)
	aumentar = true
}
if(instance_position(mouse_x, mouse_y, obj_levels) && global.opcao_escolhida == 0)
{
	image_xscale = lerp(image_xscale,1.5,0.1)
	image_yscale = lerp(image_yscale,1.5,0.1)
}
if(aumentar && global.opcao_escolhida == 0)
{
	aumentar = false
	image_xscale = lerp(image_xscale,2,0.1)
	image_yscale = lerp(image_yscale,2,0.1)
}














//else if(keyboard_check_pressed(vk_tab) && clicavel)
//{
//	clicavel = false
//	obj_login.clicavel = true
//	image_xscale = lerp(image_xscale,1,0.1)
//	image_yscale = lerp(image_yscale,1,0.1)
//}