draw_self()
draw_healthbar(x-10,y-10,x+50,y -15,Enemy_hp,c_green,c_green,c_red,0,true,true)
draw_rectangle(x,y,x+32,y+32,false)

if(keyboard_check(ord("Z")))
{
	draw_set_color(c_orange)
	draw_circle(x,y,192,false)
	draw_set_color(c_blue)
	draw_text(x + 10,y - 32,state)
}
if(keyboard_check(ord("X")))
{
	draw_set_color(c_red)
	draw_circle(x,y,112,false)
	draw_set_color(c_blue)
	draw_text(x + 10,y - 32,state)
}