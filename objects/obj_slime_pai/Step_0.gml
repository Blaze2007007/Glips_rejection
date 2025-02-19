//Obter teclas pressionadas
var _direita = keyboard_check(vk_right) or keyboard_check(ord("D"))
var _esquerda = keyboard_check(vk_left) or keyboard_check(ord("A"))
var _cima = keyboard_check(vk_up) or keyboard_check(ord("W")) or keyboard_check(vk_space)
var _ataque = keyboard_check_pressed(ord("E"))
mapats = layer_tilemap_get_id("Tiles_2")

save_player_data(global.player_data,arquivo_dados)

if(_ataque && !attaking)
{
	attaking = true
	image_index = 0
}
if(_direita)
{
	last_dir = 1
}
if(_esquerda)
{
	last_dir = -1
}
if(_ataque && _direita)
{
	direita = true
	esquerda = false
}
if(_ataque && _esquerda)
{
	direita = false
	esquerda = true
}

function stop()
{
	slimevel = 0
	salto = 0
}

if(room == rm_nivel1)
{
	global.player_data.nivel = "rm_nivel1"
	global.player_data.numero_niveis = int64(1)
	global.player_data.niv1 = true
}
else if(room == rm_nivel2)
{
	global.player_data.nivel = "rm_nivel2"
	global.player_data.numero_niveis = int64(2)
	global.player_data.niv2 = true
}
else if(room == rm_nivel3)
{
	global.player_data.nivel = "rm_nivel3"
	global.player_data.numero_niveis = int64(3)
	global.player_data.niv3 = true
}

if(inmenu)
{
	global.gamepaused = true
}

if(global.slime == 0)
{
	sprite_idle = spr_slimenormal
	sprite_ataque = spr_slimenormal_ataque_direita
	sprite_morto = spr_slimenormal_morto
	sprite_moving =	spr_slimenormal_direita
}
else if(global.slime == 1)
{
	sprite_idle = spr_slimepegajoso
	sprite_ataque = spr_slimepegajoso
	sprite_morto = spr_slimepegajoso_morto
	sprite_moving =	spr_slimepegajoso_direita
}
else if(global.slime == 2)
{
	sprite_idle = spr_slimemoldavel
	sprite_ataque = spr_slimemoldavel_ataque_direita
	sprite_morto = spr_slimemoldavel_morto
	sprite_moving =	spr_slimemoldavel_direita
}
if(!global.dead)
{
	if(keyboard_check_pressed(ord("C")) && (!ativardialogo || global.troca))
	{
		global.slime ++
		if(global.slime == 3)
		{
			global.slime = 0
		}
		global.troca = true
	}
	
	//Para onde nos mexemos horizontalmente
	direcao = _direita - _esquerda
	
	velx = direcao * slimevel
	
	if(_direita)
	{
		image_xscale = 1	
	}
	else
	{
		image_xscale = -1
	}
	if(place_meeting(x,y+2,mapats))
	{
		vely = 0
		if(_cima)
		{
			vely = salto * grv
		}
	}
	else if(vely < 10)
	{
		vely += 1
	}
	move_and_collide(velx,vely,mapats)
	
	state = STATES.IDLE
}
else
{
	if(place_meeting(x,y,mapats))
	{
		vely = 0
		state = STATES.DEAD
	}
	else if(vely < 1)
	{
		vely += 1
		state = STATES.IDLE
	}
	
	
}
switch(state)
{
	case STATES.IDLE:
	#region 
	if(!global.dead)
	{
		image_speed = 1
		if(_direita || _esquerda)
		{
			state = STATES.MOVING
		}
		else if(velx == 0)
		{
			sprite_index = sprite_idle
		}
		if(keyboard_check_pressed(vk_escape))
		{
			state = STATES.MENU
		}
		if(attaking)
		{
			state = STATES.ATTACKING
		}
		else
		{
			state = STATES.IDLE
		}
		if(instance_exists(obj_drop))
		{
			if(global.count >= 90)
			{
				var _drops = ds_list_create()
				var _inst = instance_place_list(x,y,obj_drop,_drops,false)
				ds_list_add(_drops,_inst)
				if(_inst > 0 && place_meeting(x,y,obj_drop))
				{
					for(var _i = 0; _i < _inst; _i++)
					{
						instance_destroy(_drops[| _i])
						global.pontos = global.pontos + 10
					}
				}
				ds_list_destroy(_drops)
			}
		}
		if(global.vida == 0)
		{
			state = STATES.DEAD
		}
	}
	else
	{
		state = STATES.DEAD
	}
	#endregion
	case STATES.MOVING:
	#region
	if(!global.dead)
	{
		//"" verticalmente
		vely = vely + grv

		if(_direita || _esquerda)
		{
			sprite_index = sprite_moving
		}
		else if(velx == 0)
		{
			sprite_index = sprite_idle
		}
		if(attaking)
		{	
			state = STATES.ATTACKING
		}
		else
		{
			state = STATES.MOVING
		}
		if(place_meeting(x,y,mapats))//Correção de colisões
		{
			for(var _i = 0; _i < 1000; _i++)
			{
				//Direita
				if(!place_meeting(x + _i,y,mapats))
				{
					x += _i
					break
				}
				//Esquerda
				if(!place_meeting(x - _i,y,mapats))
				{
					x -= _i
					break
				}
				//Cima
				if(!place_meeting(x,y - _i,mapats))
				{
					y -= _i
					break
				}
				//Baixo
				if(!place_meeting(x,y + _i,mapats))
				{
					y += _i
					break
				}
				//Topo direita
				if(!place_meeting(x + _i,y - _i,mapats))
				{
					x += _i
					y -= _i
					break
				}
				//Topo esquerda
				if(!place_meeting(x - _i,y - _i,mapats))
				{
					x -= _i
					y -= _i
					break
				}
				//Baixo direita
				if(!place_meeting(x + _i,y + _i,mapats))
				{
					x += _i
					y += _i
					break
				}
				//Baixo esquerda
				if(!place_meeting(x - _i,y + _i,mapats))
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
		if(global.vida == 0)
		{
			state = STATES.DEAD
		}
		if(instance_exists(obj_drop))
		{
			count ++
			if(count >= 90)
			{
				var _drops = ds_list_create()
				var _inst = instance_place_list(x,y,obj_drop,_drops,false)
				ds_list_add(_drops,_inst)
				if(_inst > 0 && place_meeting(x,y,obj_drop))
				{
					for(var _i = 0; _i < _inst; _i++)
					{
						instance_destroy(_drops[| _i])
						global.pontos ++
					}
				}
				if(ds_list_empty(_drops))
				{
					count = 0
				}
				ds_list_destroy(_drops)
			}
		}
	}
	else
	{
		state = STATES.DEAD
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
	case STATES.ATTACKING:
	#region
	if(!global.dead)
	{
		if(attaking)
		{ 
			if(last_dir == 1)
			{
				image_xscale = 1
			}
			else if(last_dir == -1)
			{
				image_xscale = -1
			}
			sprite_index = sprite_ataque
			if(image_index >= image_number - 1)
			{
				state = STATES.IDLE
				attaking = false
			}
			else
			{
				sprite_index = sprite_ataque
				state = STATES.ATTACKING
			}
		}
		else
		{
			state = STATES.IDLE
		}
		if(global.vida == 0)
		{
			state = STATES.DEAD
		}
	}
	else
	{
		state = STATES.DEAD
	}
	#endregion
	case STATES.DEAD:
	#region
		if(global.vida == 0)
		{
			global.dead = true
			sprite_index = sprite_morto
			slimevel = 0
			salto = 0
			if(image_index >= image_number - 1)
			{
				image_speed = 0
			}
			else if(!global.dead)
			{
				image_speed = 1
				state = STATES.IDLE
			}
		}
		else
		{
			global.dead = false
			state = STATES.IDLE
			salto = -35
			slimevel = 5
			if(_stop)
			{
				stop()
			}
		}
	#endregion
}
#region ifs

if(place_meeting(x,y,obj_centro) && keyboard_check_pressed(ord("F")))
	{
		room_goto_next()
		x = 170
		y = 600
		instance_destroy(obj_hollow)
	}
if(global.slime == 0)
{
	if(!instance_exists(obj_dialogo1))
	{
		state = STATES.IDLE
		ativardialogo = false
		slimevel = 5
		salto = - 35
	}
	if(place_meeting(x,y,obj_limite))
	{
		_stop = true
		obj_dialogo1.visible = true
		obj_dialogo1.image_speed = 0
		obj_dialogo1.image_index = 0
		instance_destroy(obj_limite)
	}
}
else if(global.slime == 1)
{
	if(place_meeting(x,y,obj_parede) && _direita)
	{
		vely -= 1.5
		y -= 1
	}
	if(!instance_exists(obj_dialogo1))
	{
		ativardialogo = false
	}
	if(ativardialogo)
	{
		sprite_index = sprite_idle
		slimevel = 0
		salto = 0
	}
	else
	{
		slimevel = 5
		salto = -35
	}
}
if(keyboard_check_pressed(ord("Q")) && global.vida > 0)
{
		global.vida = ceil(global.vida) - 1
}
if(keyboard_check(ord("R")) && global.vida <= 2)
{
		global.vida += 1
}
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