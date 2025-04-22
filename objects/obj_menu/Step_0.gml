if(keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space) || (mouse_check_button_pressed(mb_left) && instance_position(mouse_x, mouse_y, obj_menu)))// se se clicar no enter, no espaço ou com o rato no botão, executa-se o seguinte código
{
	room_goto(rm_inicio) // vai-se para a sala do menu principal
	instance_destroy(obj_slime_pai) // destroi-se o objeto obj_slime_pai
	obj_bg.image_alpha = 0 // marca-se o alpha deste objeto com 0
	instance_destroy(obj_menu) // destroi-se este objeto
}