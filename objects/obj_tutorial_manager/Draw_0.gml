draw_set_font(f_Text)
if(!moved)
{
	draw_text(obj_slime_pai.x - 100,obj_slime_pai.y-100, "Clica A, D ou SETAS para andar")
}
if(moved && !jumped)
{
	draw_text(obj_slime_pai.x - 100,obj_slime_pai.y-100, "Clica W, ⇧ ou espaço para saltar")
}
if(instance_exists(obj_hollow))
{
	if(collision_circle(obj_hollow.x,obj_hollow.y,100,obj_slime_pai,false,true) && !attacked)
	{
		draw_text(obj_slime_pai.x - 100,obj_slime_pai.y-100, "Clica 'E' para atacar")
	}
	if(collision_circle(x,y,32,obj_slime_pai,false,true) && global.vida < 3) // Se o inimigo colidir com o jogador
	{
		draw_text(obj_slime_pai.x - 100,obj_slime_pai.y-100, "Cuidado tens vida limitada")
	}
}
