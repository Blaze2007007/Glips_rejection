var _mapats = layer_tilemap_get_id("Tiles_2")

state = ENEMYSTATES.IDLE
vulneravel = true
switch(state)
{
case ENEMYSTATES.IDLE:
#region
alarm[0] = 3000
//Contagem para troca de estados
if(canchange == true)
{	
	var _troca = choose(0,1)
	switch(_troca)
	{
		case 0:
		state = ENEMYSTATES.MOVING
		canchange = false
		case 1:
		//Recomeçar contagem
		canchange = false
		break
	}
}
//verificação de proximidade
if(collision_circle(x,y,192,obj_playerchecker,false,false))
{
	state = ENEMYSTATES.ALERT
}
if(place_meeting(x,y,obj_playerchecker) && obj_slime.sprite_index == obj_slime.sprite_ataque)
{
	state = ENEMYSTATES.HIT
}
#endregion
case ENEMYSTATES.MOVING:
#region
alarm[1] = 3000
if(place_meeting(x,y+2,_mapats))
{
	vely = 0
}else if(vely < 10)
{
	vely += 1
}
if(canchange2 == true)
{
	var _troca = choose(0,1)
	switch(_troca)
	{
		case 0:
		state = ENEMYSTATES.IDLE
		canchange2 = false
		case 1:
		var _direcao = choose(0,1)
		switch(_direcao)
		{
			case 0:
				x += 10
				canchange2 = false
			case 1:
				x -= 10
				canchange2 = false
		}
		canchange2 = false
	}
}
if(collision_circle(x,y,192,obj_playerchecker,false,false))
{
	state = ENEMYSTATES.ALERT
}
if(place_meeting(x,y,obj_playerchecker) && keyboard_check_pressed(ord("E")))
{
	state = ENEMYSTATES.HIT
}
#endregion
case ENEMYSTATES.ALERT:
#region
my_dir = point_direction(x,y,obj_playerchecker.x,obj_playerchecker.y)
movex = lengthdir_x(0.5,my_dir)
if(place_meeting(x,y+2,_mapats))
{
	vely = 0
}else if(vely < 10)
{
	vely += 1
}

x += movex

if(!collision_circle(x,y,192,obj_playerchecker,false,false))
{
	state = ENEMYSTATES.IDLE
}
if(collision_circle(x,y,112,obj_playerchecker,false,false))
{
	state = ENEMYSTATES.ATTACKING
}
if(place_meeting(x,y,obj_playerchecker))
{
	state = ENEMYSTATES.HIT
}
#endregion
case ENEMYSTATES.ATTACKING:
#region
alarm[2] = 10000
if(place_meeting(x,y,obj_playerchecker) && vulneravel == true)
{
	if(global.vida > 0)
	{
		global.vida -= 1
	}
}
else if(vulneravel == false)
{
	global.vida = global.vida
}
if(!place_meeting(x,y,obj_playerchecker))
{
	state = ENEMYSTATES.MOVING
}
	//attack sprite
#endregion
case ENEMYSTATES.HIT:
#region
	//hit sprite
#endregion
case ENEMYSTATES.DEAD:
#region
	//death sprite
#endregion
}
