if(instance_exists(obj_slime_pai)) // Se o objeto obj_slime_pai existir a camara segue-o
{
	xto = obj_slime_pai.x // Definir o x da camara para seguir o x do jogador 
	yto = obj_slime_pai.y // Definir o y da camara para seguir o y do jogador 
	camera_set_view_pos(view_camera[0],x-(cam_l*0.5),y-(cam_a*0.5)) // Atualizar a cada frame a posição da camara
		
	x += (xto-x) / 15 // Aumentar aos poucos a posição da camara até chegar ao x do jogador (movento suave da camara)
	y += (yto-y) / 15 // Aumentar aos poucos a posição da camara até chegar ao y do jogador (movento suave da camara)
}
