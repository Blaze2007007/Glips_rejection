with(obj_name)
{
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_set_color(c_black)
	draw_text(x+100,y-20,"username")
	draw_set_color(c_white)
	draw_set_valign(fa_middle)
	if(sel)
	{
		draw_text(x+10,y+10,string(str)+" "+ string(obj_draw.typing_str))
	}
	else
	{
		draw_text(x+10,y+10,str)
	}
}

with(obj_pass)
{
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_set_color(c_black)
	draw_text(x+100,y-20,"password")
	draw_set_color(c_white)
	draw_set_valign(fa_middle)
	if(sel)
	{
		draw_text(x+10,y+10,string(str)+" "+ string(obj_draw.typing_str))
	}
	else
	{
		draw_text(x+10,y+10,str)
	}
}