draw_self()
draw_healthbar(x-10,y-10,x+50,y -15,Enemy_hp,c_green,c_green,c_red,0,true,true)

if(collision_circle(x,y,288,obj_playerchecker,false,false))
{
	draw_set_color(c_yellow)
	draw_circle(x,y,288,false)
	draw_set_color(c_blue)
	draw_text(x + 10,y - 32,state)
}
if(collision_circle(x,y,288,obj_playerchecker,false,false) && collision_circle(x,y,192,obj_playerchecker,false,false))
{
	draw_set_color(c_orange)
	draw_circle(x,y,192,false)
	draw_set_color(c_blue)
	draw_text(x + 10,y - 32,state)
}
if(collision_circle(x,y,288,obj_playerchecker,false,false) && collision_circle(x,y,192,obj_playerchecker,false,false) && collision_circle(x,y,112,obj_playerchecker,false,false))
{
	draw_set_color(c_red)
	draw_circle(x,y,112,false)
	draw_set_color(c_blue)
	draw_text(x + 10,y - 32,state)
}