var _mapats = layer_tilemap_get_id("Tiles_2")

state = ENEMYSTATES.IDLE
grv = 2
vely = 0
movex = 0
pode_mudar = true
pode_atacar = true
if(timer <= 0)
{
	timer = 180
	pode_atacar = true
}
else
{
	timer--;
}

switch(state)
{
	case ENEMYSTATES.IDLE: //ESTADO 0
	#region
	if(pode_mudar)
	{
		opcao = choose(0,1)
		switch(opcao)
		{
			case 0:
				movex += 1
				if(place_meeting(x,y+2,_mapats))
				{
					vely = 0
				}
				else if(vely < 1)
				{
					vely += 1
					vely = vely + grv
				}
			case 1:
				movex -= 1
				if(place_meeting(x,y+2,_mapats))
				{
					vely = 0
				}
				else if(vely < 1)
				{
					vely += 1
					vely = vely + grv
				}
		}
		pode_mudar = false
	}
	else
	{
		return
	}
	//verificação de proximidade
	if(collision_circle(x,y,192,obj_playerchecker,false,false))
	{
		state = ENEMYSTATES.ALERT
	}
	
	if(place_meeting(x,y+2,_mapats))
	{
		vely = 0
	}
	else if(vely < 1)
	{
		vely += 1
		vely = vely + grv
	}
	#endregion
	
	case ENEMYSTATES.ALERT: //ESTADO 1
	#region
	if(place_meeting(x,y+2,_mapats))
	{
		vely = 0
		for(var _i = 0; _i < 1000; _i++)
			{
				//Direita
				if(!place_meeting(x + _i,y,_mapats))
				{
					x += _i
					break
				}
				//Esquerda
				if(!place_meeting(x - _i,y,_mapats))
				{
					x -= _i
					break
				}
				//Cima
				if(!place_meeting(x,y - _i,_mapats))
				{
					y -= _i
					break
				}
				//Baixo
				if(!place_meeting(x,y + _i,_mapats))
				{
					y += _i
					break
				}
				//Topo direita
				if(!place_meeting(x + _i,y - _i,_mapats))
				{
					x += _i
					y -= _i
					break
				}
				//Topo esquerda
				if(!place_meeting(x - _i,y - _i,_mapats))
				{
					x -= _i
					y -= _i
					break
				}
				//Baixo direita
				if(!place_meeting(x + _i,y + _i,_mapats))
				{
					x += _i
					y += _i
					break
				}
				//Baixo esquerda
				if(!place_meeting(x - _i,y + _i,_mapats))
				{
					x -= _i
					y += _i
					break
				}
			}
	}
	else if(vely < 1)
	{
		vely += 1
		vely = vely + grv
	}
	
	dis_from_player = point_direction(x,y,obj_playerchecker.x,obj_playerchecker.y-y)
	
	if(dis_from_player > 90)
	{
		my_dir = point_direction(x,y,obj_playerchecker.x + 30,obj_playerchecker.y)
	}
	else if (dis_from_player < 90)
	{
		my_dir = point_direction(x,y,obj_playerchecker.x - 60,obj_playerchecker.y)
	}
	else
	{
		return
	}
	
	movex = lengthdir_x(1,my_dir)
	
	x += movex
	move_and_collide(movex,vely,_mapats)
	
	if(place_meeting(x,y,obj_playerchecker))
	{
		state = ENEMYSTATES.ATTACKING
	}
	if(collision_circle(x,y,64,obj_playerchecker,false,false) && keyboard_check_pressed(ord("E")))
	{
		state = ENEMYSTATES.HIT
	}
	#endregion
	case ENEMYSTATES.ATTACKING: //ESTADO 2
	#region
	
	if(place_meeting(x,y,obj_playerchecker) && global.vida > 0 && pode_atacar)
	{
		global.vida --
		pode_atacar = false
	}
	
	if(collision_circle(x,y,64,obj_playerchecker,false,false) && keyboard_check_pressed(ord("E")))
	{
		state = ENEMYSTATES.HIT
	}
		//attack sprite
	#endregion
	case ENEMYSTATES.HIT: //ESTADO 3
	#region
	if(!collision_circle(x,y,64,obj_playerchecker,false,false))
	{
		state = ENEMYSTATES.ATTACKING
	}
		//hit sprite
	#endregion
	case ENEMYSTATES.DEAD: //ESTADO 4
	#region
		//death sprite
	#endregion
}
