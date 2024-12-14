if(global.vida == 3)
{
	draw_sprite(spr_vida,0,cam_x,cam_y)
	draw_sprite(spr_vida,0,cam_x + 75,cam_y)
	draw_sprite(spr_vida,0,cam_x + 150,cam_y)
}
else if(global.vida <= 3 && global.vida > 2)
{
	draw_sprite(spr_vida,0,cam_x,cam_y)
	draw_sprite(spr_vida,0,cam_x + 75,cam_y)
	draw_sprite(spr_vida,0,cam_x + 150,cam_y)
}
else if(global.vida <= 2 && global.vida > 1)
{
	draw_sprite(spr_vida,0,cam_x,cam_y)
	draw_sprite(spr_vida,0,cam_x + 75,cam_y)
	draw_sprite(spr_vazio,0,cam_x+150,cam_y)
}
else if(global.vida <= 1 && global.vida > 0)
{
	draw_sprite(spr_vida,0,cam_x,cam_y)
	draw_sprite(spr_vazio,0,cam_x + 75,cam_y)
	draw_sprite(spr_vazio,0,cam_x + 150,cam_y)
}
else if(global.vida == 0)
{
	draw_sprite(spr_vazio,0,cam_x,cam_y)
	draw_sprite(spr_vazio,0,cam_x + 75,cam_y)
	draw_sprite(spr_vazio,0,cam_x + 150,cam_y)
}