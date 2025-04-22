if(global.player_data.vida == 3) // se a vida for igual a 3 desenha os três corações
{
	draw_sprite(spr_vida,0,cam_x,cam_y)
	draw_sprite(spr_vida,0,cam_x + 75,cam_y)
	draw_sprite(spr_vida,0,cam_x + 150,cam_y)
}
else if(global.player_data.vida <= 3 && global.player_data.vida > 2) // se a vida for maior que 2 desenha e menor ou igual a 3 os três corações
{
	draw_sprite(spr_vida,0,cam_x,cam_y)
	draw_sprite(spr_vida,0,cam_x + 75,cam_y)
	draw_sprite(spr_vida,0,cam_x + 150,cam_y)
}
else if(global.player_data.vida <= 2 && global.player_data.vida > 1) // se a vida for menor ou igual a 2 e maior que 1 desenha os dois corações
{
	draw_sprite(spr_vida,0,cam_x,cam_y)
	draw_sprite(spr_vida,0,cam_x + 75,cam_y)
	draw_sprite(spr_vazio,0,cam_x + 150,cam_y)
}
else if(global.player_data.vida <= 1 && global.player_data.vida > 0) // se a vida for menor ou igual a 1 e for maior que 0desenha 1 coração
{
	draw_sprite(spr_vida,0,cam_x,cam_y)
	draw_sprite(spr_vazio,0,cam_x + 75,cam_y)
	draw_sprite(spr_vazio,0,cam_x + 150,cam_y)
}
else if(global.player_data.vida == 0) // se a vida for igual a 0 não desenha corações
{
	draw_sprite(spr_vazio,0,cam_x,cam_y)
	draw_sprite(spr_vazio,0,cam_x + 75,cam_y)
	draw_sprite(spr_vazio,0,cam_x + 150,cam_y)
}
draw_text(cam_x,cam_y + 100,global.pontos) // desenhar os pontos do jogador