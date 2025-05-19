//fonte da letra
draw_set_font(f_Text)

if(!moved) // se o jogador não se mexeu mostra a seguinte mensagem
{
	draw_text(obj_slime_pai.x - 100,obj_slime_pai.y-100, "Clica A, D ou SETAS para andar")
}
if(moved && !jumped) // se o jogador se mexeu, mas não saltou mostra a seguinte mensagem
{
	draw_text(obj_slime_pai.x - 100,obj_slime_pai.y-100, "Clica W, ⇧ ou espaço para saltar")
}
if(instance_exists(obj_hollow)) // se o inimigo existe mostra as seguintes mensagems
{
	if(collision_circle(obj_hollow.x,obj_hollow.y,100,obj_slime_pai,false,true) && !attacked) // quando o jogador está à distância para atacar o inimigo
	{
		draw_text(obj_slime_pai.x - 100,obj_slime_pai.y-100, "Clica 'E' para atacar")
	}
	if(place_meeting(obj_slime_pai.x,obj_slime_pai.y,obj_hollow) && global.vida < 3) // Se o inimigo colidir com o jogador
	{
		draw_text(obj_slime_pai.x - 100,obj_slime_pai.y-100, "Cuidado tens vida limitada")
	}
}
