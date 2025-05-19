if((keyboard_check_pressed(vk_enter) || (mouse_check_button_pressed(mb_left))) && (instance_position(mouse_x, mouse_y, obj_tutorial) || global.opcao_escolhida == 2))// Se se clicar no enter ou se clicar com o rato em cima do botão ou se a opção for 2 (se o botão estiver selecionado), executa-se o seguinte código
{
    room_goto(rm_tutorial) // vai-se para o nivel do tutorial
	instance_create_layer(160,644,layer,obj_slime_pai) // cria-se o objeto que o jogador vai controlar
}
if(instance_position(mouse_x, mouse_y, obj_tutorial) or global.opcao_escolhida == 2)// Se o jogador passar com o rato por cima deste objeto ou a variável global.opcao escolhida for 2, aumenta o seu tamanho
{
	image_xscale = lerp(image_xscale,2,0.1)
	image_yscale = lerp(image_yscale,2,0.1)
	global.opcao_escolhida = 2
}
else// caso contrário o objeto mantem o tamanho original
{
	image_xscale = lerp(image_xscale,1.5,0.1)
	image_yscale = lerp(image_yscale,1.5,0.1)
}
if(keyboard_check_pressed(vk_tab) && global.opcao_escolhida == 2 && !aumentar)// se o jogador clicar no tab e este objeto estiver escolhido, passa para o próximo objeto
{
	global.opcao_escolhida = 3
	image_xscale = lerp(image_xscale,1.5,0.1)
	image_yscale = lerp(image_yscale,1.5,0.1)
	aumentar = true// serve para permitir que o obj_tutorial possa aumentar de tamanho
}
// se o jogador passar o rato por os objetos a seguir referidos este objeto mantem o seu tamanho original
if(instance_position(mouse_x, mouse_y, obj_levels) or instance_position(mouse_x, mouse_y, obj_exit)  or instance_position(mouse_x, mouse_y, obj_start) && global.opcao_escolhida == 2)
{
	image_xscale = lerp(image_xscale,1.5,0.1)
	image_yscale = lerp(image_yscale,1.5,0.1)
}
if(aumentar && global.opcao_escolhida == 2)// se a variável aumentar for true e este objeto estiver escolhido, este objeto aumenta de tamanho
{
	aumentar = false
	image_xscale = lerp(image_xscale,2,0.1)
	image_yscale = lerp(image_yscale,2,0.1)
}