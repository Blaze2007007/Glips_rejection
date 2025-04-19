if(!moved) // Se o jogador ainda não se tiver mexido executa o seguinte código
{
	obj_bg.image_alpha = 0.75 // Altera-se a opacidade do objeto obj_bg para 0.75(escuro)
	if(keyboard_check_pressed(ord("A")) or keyboard_check_pressed(ord("D")) or keyboard_check_pressed(vk_left) or keyboard_check_pressed(vk_right)) // Se o jogador se mexer(clicar na tecla A ou D ou nas setas da esquerda ou direita) executa o seguinte código
	{
		moved = true // O jogador mexeu-se por tanto a variável moved passa a ser verdadeira
		obj_bg.image_alpha = 0 // Altera-se de novo a opacidade do objeto obj_bg para 0(transparente)
	}
}
if(moved && !jumped)// Se o jogador já se mexeu, mas ainda não saltou executa o seguinte código
{
	obj_bg.image_alpha = 0.75 // Altera-se a opacidade do objeto obj_bg para 0.75(escuro)
	if(keyboard_check_pressed(ord("W")) or keyboard_check_pressed(vk_up) or keyboard_check_pressed(vk_space)) // Se o jogador saltar(clicar na tecla W ou ⇧ ou na tecla do espaço) executa o seguinte código
	{
		jumped = true // O jogador saltou por tanto a variável jumped passa a ser verdadeira
		obj_bg.image_alpha = 0 // Altera-se de novo a opacidade do objeto obj_bg para 0(transparente)
	}
}
if(instance_exists(obj_hollow))
{
	if(collision_circle(obj_hollow.x,obj_hollow.y,100,obj_slime_pai,false,true) && !attacked)
	{
		global.gamepaused = true
		obj_bg.image_alpha = 0.75 // Altera-se a opacidade do objeto obj_bg para 0.75(escuro)
		// Anulamento de velocidades do jogador e do inimigo
		obj_slime_pai.salto = 0
		obj_slime_pai.slimevel = 0
		obj_hollow.movex = 0
		if(keyboard_check_pressed(ord("E"))) // Se o jogador atacar(clicar na tecla E) executa o seguinte código
		{
			obj_slime_pai.salto = 5
			obj_slime_pai.slimevel = -35
			attacked = true // O jogador atacou por tanto a variável attacked passa a ser verdadeira
			obj_bg.image_alpha = 0 // Altera-se de novo a opacidade do objeto obj_bg para 0(transparente)
			global.gamepaused = false
		}
	}
	if(collision_circle(x,y,32,obj_slime_pai,false,true) && global.vida < 3 && !warned) // Se o inimigo colidir com o jogador
	{
		if(count == 180)
		{
			warned = true
		}
		else
		{
			global.gamepaused = true
			count ++
			obj_bg.image_alpha = 0.75 // Altera-se a opacidade do objeto obj_bg para 0.75(escuro)
			global.vida = 2
		}
	}
}