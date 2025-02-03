if(global.player_data.vida == 3)
{
	draw_sprite(spr_vida,0,cam_x,cam_y)
	draw_sprite(spr_vida,0,cam_x + 75,cam_y)
	draw_sprite(spr_vida,0,cam_x + 150,cam_y)
}
else if(global.player_data.vida <= 3 && global.player_data.vida > 2)
{
	draw_sprite(spr_vida,0,cam_x,cam_y)
	draw_sprite(spr_vida,0,cam_x + 75,cam_y)
	draw_sprite(spr_vida,0,cam_x + 150,cam_y)
}
else if(global.player_data.vida <= 2 && global.player_data.vida > 1)
{
	draw_sprite(spr_vida,0,cam_x,cam_y)
	draw_sprite(spr_vida,0,cam_x + 75,cam_y)
	draw_sprite(spr_vazio,0,cam_x + 150,cam_y)
}
else if(global.player_data.vida <= 1 && global.player_data.vida > 0)
{
	draw_sprite(spr_vida,0,cam_x,cam_y)
	draw_sprite(spr_vazio,0,cam_x + 75,cam_y)
	draw_sprite(spr_vazio,0,cam_x + 150,cam_y)
}
else if(global.player_data.vida == 0)
{
	draw_sprite(spr_vazio,0,cam_x,cam_y)
	draw_sprite(spr_vazio,0,cam_x + 75,cam_y)
	draw_sprite(spr_vazio,0,cam_x + 150,cam_y)
}
draw_text(cam_x,cam_y + 100,global.pontos)