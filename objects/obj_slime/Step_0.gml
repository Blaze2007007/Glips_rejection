//Obter teclas pressionadas
var _direita = keyboard_check(vk_right) or keyboard_check(ord("D"))
var _esquerda = keyboard_check(vk_left) or keyboard_check(ord("A"))
var _cima = keyboard_check(vk_up) or keyboard_check(ord("W")) or keyboard_check(vk_space)
var _ataque = keyboard_check_pressed(ord("E"))

var _mapats = layer_tilemap_get_id("Tiles_2")

if(inmenu)
{
	global.gamepaused = true
}

actual_delta = delta_time/1000000
delta_multiplier = actual_delta/target_delta 
//Para onde nos mexemos horizontalmente
direcao = _direita - _esquerda

velx = direcao * slimevel * delta_multiplier

if(direcao == -1)
{
	facing = -1
	//esquerda
	last_dir = false
}
if(direcao == 1)
{
	facing = 1
	//direita
	last_dir = true
}
function stop()
{
	slimevel = 0
	salto = 0
}

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
move_and_collide(velx,vely,_mapats)
state = STATES.IDLE

switch(state)
{
	case STATES.IDLE:
	#region 
		if(_direita || _esquerda || _cima)
		{
			state = STATES.MOVING
		}
		else if(velx == 0)
		{
			sprite_index = spr_slimenormal
		}
	#endregion
	case STATES.MOVING:
		#region
		
//"" verticalmente
vely = vely + grv

		if(_direita)
		{
			sprite_index = spr_slimenormal_direita
		}
		if(_esquerda)
		{
			sprite_index = spr_slimenormal_esquerda
		}
		else if(velx == 0)
		{
			sprite_index = spr_slimenormal
		}
		if(!instance_exists(obj_dialogo1))
		{
			state = STATES.IDLE
		}
		if(keyboard_check_pressed(ord("E")))
		{
			state = STATES.ATTACKING
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
			}
		}
		if(keyboard_check_pressed(vk_escape))
		{
			state = STATES.MENU
		}
#endregion
		case STATES.MENU:
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
		if(!instance_exists(obj_dialogo1))
		{
			ativardialogo = false
			slimevel = 5
			salto = - 35
			trocadeslimes()
		}
		if(place_meeting(x,y,obj_limite))
		{
			stop()
			if(_direita || _esquerda)
			{
				sprite_index = spr_slimenormal
			}
			obj_dialogo1.visible = true
			obj_dialogo1.image_speed = 0
			obj_dialogo1.image_index = 0
			instance_destroy(obj_limite)
		}
		case STATES.ATTACKING:
		#region
		if(keyboard_check_pressed(ord("E")) && facing == 0)
		{
			if(keyboard_check_pressed(ord("E")) && last_dir == true)
			{
				sprite_ataque = spr_slimenormal_ataque_direitaHB
				sprite_index = sprite_ataque
				if(image_index >= image_number -1)
				{
					image_speed = 0
				}
			}
			else if(keyboard_check_pressed(ord("E")) && last_dir == false)
			{
				sprite_ataque = spr_slimenormal_ataque_esquerdaHB
				sprite_index = sprite_ataque
				if(image_index >= image_number -1)
				{
					image_speed = 0
				}
			}
		}
		#endregion
if(place_meeting(x,y,obj_centro) && keyboard_check_pressed(ord("F")))
{
	room_goto_next()
	obj_slime.x = 170
	obj_slime.y = 600
}
if(keyboard_check_pressed(ord("Q")))
{
	if(global.vida > 0)
	{
		global.vida -= 1
	}
}
if(keyboard_check_pressed(ord("R")))
{
	if(global.vida < 3)
	{
		global.vida += 1
	}
}
if(room == rm_inicio)
{
	obj_slime.x = 691
	obj_slime.y = 646
}
}