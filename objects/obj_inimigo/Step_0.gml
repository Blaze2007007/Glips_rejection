var _mapats = layer_tilemap_get_id("Tiles_2")

state = ENEMYSTATES.IDLE
grv = 2
vely = 0
movex = 0

switch(state)
{
	case ENEMYSTATES.IDLE: //ESTADO 0
	#region
	
		count1 ++
		
		if(pode_mudar)
		{
			pode_mudar = false
			opcao = round(random(2))
		}
		else if(count1 == 120)
		{
			count1 = 0
			pode_mudar = true
		}
		switch(opcao)
		{
			case 0:
			if(!collision_circle(x,y,224,obj_playerchecker,false,false))
			{
				movex += 1
				x -= movex
				if(place_meeting(x,y+2,_mapats))
				{
					vely = 0
				}
				else if(vely < 1)
				{
					vely += 1
					vely = vely + grv
				}
				y += vely / 2
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
			case 1:
			if(!collision_circle(x,y,224,obj_playerchecker,false,false))
			{
				movex -= 1
				x -= movex
				if(place_meeting(x,y+2,_mapats))
				{
					vely = 0
				}
				else if(vely < 1)
				{
					vely += 1
					vely = vely + grv
				}
				y += vely / 2
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
			case 2:
				movex = 0
				if(place_meeting(x,y+2,_mapats))
				{
					vely = 0
				}
				else if(vely < 1)
				{
					vely += 1
					vely = vely + grv
				}
				y += vely / 2
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
	//verificação de proximidade
	if(collision_circle(x,y,224,obj_playerchecker,false,false))
	{
		state = ENEMYSTATES.ALERT
	}
	#endregion
	case ENEMYSTATES.ALERT: //ESTADO 1
	#region
	if(!collision_circle(x,y,224,obj_playerchecker,false,false))
	{
		state = ENEMYSTATES.IDLE
	}
	else
	{
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
	}
	#endregion
	case ENEMYSTATES.ATTACKING: //ESTADO 2
	#region
	#region // sistema de ataque
	count2 ++
	if(count2 == 180)
	{
		count2 = 0
		pode_atacar = true
	}
	if(place_meeting(x,y,obj_playerchecker) && pode_atacar && global.vida > 0)
	{
		global.vida --
		pode_atacar = false
		count2 = 0
	}
	#endregion
	if(collision_circle(x,y,64,obj_playerchecker,false,false) && keyboard_check_pressed(ord("E")))
	{
		state = ENEMYSTATES.HIT
	}
	if(!place_meeting(x,y,obj_playerchecker))
	{
		state = ENEMYSTATES.ALERT
	}
		//attack sprite
	#endregion
	case ENEMYSTATES.HIT: //ESTADO 3
	#region
	if(!collision_circle(x,y,64,obj_playerchecker,false,false))
	{
		state = ENEMYSTATES.ATTACKING
	}
	if(collision_circle(x,y,64,obj_playerchecker,false,false) && keyboard_check_pressed(ord("E")))
	{
		enemy_hp --
	}
	if(enemy_hp == 0)
	{
		state = ENEMYSTATES.DEAD
	}
		//hit sprite
	#endregion
	case ENEMYSTATES.DEAD: //ESTADO 4
	#region
	movex = 0
		//death sprite
	#endregion
}
