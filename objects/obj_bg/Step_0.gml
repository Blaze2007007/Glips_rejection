if(keyboard_check_pressed(vk_escape) && image_alpha == 0) // Se se clicar esc e a opacidade do objeto for igual a zero(invisivel), executa o seguinte codigo
{
	image_alpha = 0.75 // Definição da opacidade do objeto para 0.75(quase preenchido)
	instance_create_depth(obj_slime_pai.x,obj_slime_pai.y - 100,-100,obj_menu) // Criar o objeto menu em cima do jogador, para que, quando clicado leve o jogador para as opções de menu do jogo
}
else if(keyboard_check_pressed(vk_escape) && image_alpha == 0.75) // Se se clicar esc e a opacidade do objeto for igual a 0.75(Quase preenchido), executa o seguinte codigo
{
	image_alpha = 0 // Tornar o objeto invisivel novamente, para uso futuro
	instance_destroy(obj_menu) // Destruir o objeto
}