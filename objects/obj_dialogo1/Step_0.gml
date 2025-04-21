if(!global.dead)
{
	if(keyboard_check_pressed(vk_space) && !instance_exists(obj_limite)) // Se o jogador clicar espaço e o objeto obj_limite não existir passa os frames do sprite do dialogo
	{
		image_index = image_index + 1 // Incremento dos frames do sprite de dialogo
		if(obj_dialogo1.image_index == 6 && keyboard_check_pressed(vk_space)) // Se os frames chegarem a 6 e o jogador clicar espaço acaba a conversa e destroy o objeto da mesma
		{
			instance_destroy(obj_dialogo1)
			instance_destroy(obj_slimepegajoso)
		}
		else // Se não chegar ao fim das frames do sprite continua a ser incrementado
		{
			image_index = image_index // O indice da imagem fica igual(à espera de ser incrementado)
		}
	}
}