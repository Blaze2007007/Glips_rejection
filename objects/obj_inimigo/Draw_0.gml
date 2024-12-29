draw_self() // Desenhar o inimigo
draw_healthbar(x-10,y-10,x+50,y -15,enemy_hp,c_green,c_green,c_red,0,true,true) // Desenhar a barra de vida do inimigo

if(keyboard_check(ord("Z"))) // Desenhar o círculo de proximidade do estado alerta
{
	draw_set_color(c_orange)
	draw_circle(x,y,224,false)
	draw_set_color(c_blue)
	draw_text(x + 10,y - 32,state)
}
if(keyboard_check(ord("X"))) // Desenhar o círculo de proximidade para verificar se o inimigo pode ou não ser atacado
{
	draw_set_color(c_red)
	draw_circle(x,y,96,false)
	draw_set_color(c_blue)
	draw_text(x + 10,y - 32,state)
}