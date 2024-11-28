//Obter teclas pressionadas
var _direita = keyboard_check(vk_right) or keyboard_check(ord("D"))
var _esquerda = keyboard_check(vk_left) or keyboard_check(ord("A"))
var _cima = keyboard_check(vk_up) or keyboard_check(ord("W")) or keyboard_check(vk_space)

var _mapats = layer_tilemap_get_id("Tiles_2")

actual_delta = delta_time/1000000
delta_multiplier = actual_delta/target_delta

inmenu = false

function stop()
{
	if(keyboard_check_pressed(vk_escape))
	{
		slimevel = 0
		salto = 0
	}
}

//Para onde nos mexemos horizontalmente
velx = (_direita - _esquerda) * slimevel * delta_multiplier

if(place_meeting(x,y+2,_mapats))
{
	vely = 0
if(_cima)
{
vely = salto * grv
}
}else if(vely < 10)
{
	vely += 1
}

state = STATES_2.IDLE

switch(state)
{
	case STATES_2.IDLE:
	#region 
		if(_direita || _esquerda || _cima)
		{
			state = STATES.MOVING
		}
		else if(velx == 0)
		{
			sprite_index = spr_slimepegajoso
		}
	#endregion
	case STATES_2.MOVING:
		#region
		
		//"" verticalmente
		vely = vely + grv

		move_and_collide(velx,vely,_mapats)
		if(_direita)
		{
			sprite_index = spr_slimepegajoso_direita
		}
		if(_esquerda)
		{
			sprite_index = spr_slimepegajoso_esquerda
		}
		if(velx = 0)
		{
			sprite_index = spr_slimepegajoso
		}
		if(place_meeting(x,y,_mapats))//Correção de colisões
		{
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
				if(keyboard_check_pressed(vk_escape))
				{
					state = STATES_2.MENU
				}
			}
		}
#endregion

	case STATES_2.CLIMBING:
		#region
			if(place_meeting(x,y,obj_parede) && _direita)
			{
				y -= 0.5
				vely -= 1.55
			}
			else
			{
				state = STATES.IDLE
			}
		#endregion
	case STATES_2.MENU:
	#region
	if(instance_exists(obj_menu))
		{
			inmenu = true
			stop()
		}
		else if(keyboard_check_pressed(vk_escape) && inmenu == true)
		{
			inmenu = false
			salto = -35
			slimevel = 5
		}
	
	#endregion
}
if(!instance_exists(obj_dialogo1))
{
	ativardialogo = false
}
if(ativardialogo == true)
{
	sprite_index = spr_slimepegajoso
	slimevel = 0
	salto = 0
}
else
{
	slimevel = 5
	salto = -35
}
if(place_meeting(x,y,obj_centro) && keyboard_check_pressed(ord("F")))
{
	room_goto_next()
	obj_slimepegajoso.x = 170
	obj_slimepegajoso.y = 600
}
trocadeslimes()
