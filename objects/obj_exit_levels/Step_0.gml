if(keyboard_check_pressed(vk_escape) || (mouse_check_button_pressed(mb_left) && instance_position(mouse_x, mouse_y, obj_exit_levels))) 
{
	room_goto(rm_inicio) // voltar à sala do menu
}
if(instance_position(mouse_x, mouse_y, obj_exit_levels)) // se o jogador passar o rato por cima deste objeto ele aumenta de tamanho
{
	image_xscale = lerp(image_xscale,2.25,0.1)
	image_yscale = lerp(image_yscale,2.25,0.1)
}
else // caso contrário mantem o seu tamanho original
{
	image_xscale = lerp(image_xscale,2,0.1)
	image_yscale = lerp(image_yscale,2,0.1)
}