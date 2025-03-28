if(place_meeting(x,y,obj_slime_pai) && keyboard_check_pressed(ord("F"))) // Se o jogador estiver em contacto com o objeto e clicar F volta para a sala principal
{
	room_goto(rm_inicio) //ir para a sala principal
	instance_destroy(obj_slime_pai) // Apagar o objeto obj_slime_pai para não se guardarem os dados do mesmo quando ele sair dos niveis
}