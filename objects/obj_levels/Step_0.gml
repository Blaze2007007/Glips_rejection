if((keyboard_check_pressed(vk_enter) || (mouse_check_button_pressed(mb_left))) && (instance_position(mouse_x, mouse_y, obj_levels) || global.opcao_escolhida == 1))// Se se clicar no enter ou se clicar com o rato em cima do botão ou se a opção for 1 (se o botão estiver selecionado), passa-se para a sala dos niveis
{
    room_goto(rm_levels)
}
if(instance_position(mouse_x, mouse_y, obj_levels) or global.opcao_escolhida == 1) // Se o jogador passar com o rato por cima deste objeto ou a variável global.opcao_escolhida for 2, aumenta o seu tamanho
{
	image_xscale = lerp(image_xscale,2,0.1)
	image_yscale = lerp(image_yscale,2,0.1)
	global.opcao_escolhida = 1
}
else// caso não o faça mantem o tamanho original
{
	image_xscale = lerp(image_xscale,1.5,0.1)
	image_yscale = lerp(image_yscale,1.5,0.1)
}
if(keyboard_check_pressed(vk_tab) && global.opcao_escolhida == 1)// se o jogador clicar no tab e este objeto estiver escolhido, passa para o próximo objeto
{
	global.opcao_escolhida = 2 // variável global reiniciada com um valor que se refere a outro objeto
	image_xscale = lerp(image_xscale,1.5,0.1)
	image_yscale = lerp(image_yscale,1.5,0.1)
	obj_tutorial.aumentar = true// serve para permitir que o obj_toturial possa aumentar de tamanho
}
// serve para permitir que o obj_start possa aumentar de tamanho
if(instance_position(mouse_x, mouse_y, obj_start) or instance_position(mouse_x, mouse_y, obj_exit)  or instance_position(mouse_x, mouse_y, obj_tutorial) && global.opcao_escolhida == 1)
{
	image_xscale = lerp(image_xscale,1.5,0.1)
	image_yscale = lerp(image_yscale,1.5,0.1)
}