function Inimigos()
{
	var _mapats = layer_tilemap_get_id("Tiles_2")

	move_and_collide(x,y,_mapats)
	
	state = ENEMYSTATES.IDLE
	enum ENEMYSTATES
	{
		IDLE,
		MOVING,
		ALERT,
		ATTACKING,
		HIT,
		DEAD
	}
	
	
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
	if(collision_circle(x,y,64,obj_playerchecker,false,false))
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
	move_and_collide(x,y,obj_playerchecker)
	x += movex
	if(canchange == true)
	{
		var _troca = choose(0,1)
		switch(_troca)
		{
			case 0:
			state = ENEMYSTATES.IDLE
			canchange = false
			case 1:
			var _direcao = choose(0,1)
			switch(_direcao)
			{
				case 0:
					x -= 2
					canchange2 = false
				case 1:
					x += 2
					canchange2 = false
			}
			canchange = false
		}
	}
	if(collision_circle(x,y,48,obj_playerchecker,false,false))
	{
		state = ENEMYSTATES.ALERT
	}
	if(place_meeting(x,y,obj_playerchecker) &&  obj_slime.sprite_index == obj_slime.sprite_ataque)
	{
		state = ENEMYSTATES.HIT
	}
	#endregion
	case ENEMYSTATES.ALERT:
	#region
	my_dir = point_direction(x,y,obj_playerchecker.x,obj_playerchecker.y)
	movex = lengthdir_x(0.5,obj_playerchecker.x)
	
	x += movex
	
	if(!collision_circle(x,y,48,obj_playerchecker,false,false))
	{
		state = ENEMYSTATES.IDLE
	}
	if(collision_circle(x,y,16,obj_playerchecker,false,false))
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
	
	#endregion
	case ENEMYSTATES.HIT:
	#region
	atacar_inimigo(dano)
	#endregion
	case ENEMYSTATES.DEAD:
	#region
		//death sprite
	#endregion
	}
}