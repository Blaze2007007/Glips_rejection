//Obter teclas pressionadas
var _direita = keyboard_check(vk_right) or keyboard_check(ord("D"))
var _esquerda = keyboard_check(vk_left) or keyboard_check(ord("A"))
var _cima = keyboard_check(vk_up) or keyboard_check(ord("W")) or keyboard_check(vk_space)
var _ataque = keyboard_check_pressed(ord("E"))

if(inmenu)
{
	global.gamepaused = true
}

if(keyboard_check_pressed(ord("C")) && ativardialogo == false)
{
	global.slime ++
	if(global.slime == 3)
	{
		global.slime = 0
	}
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


//Para onde nos mexemos horizontalmente
direcao = _direita - _esquerda

velx = direcao * slimevel

image_xscale = facing

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
			sprite_index = sprite_idle
		}
		if(keyboard_check_pressed(vk_escape))
		{
			state = STATES.MENU
		}
	#endregion
	case STATES.MOVING:
	#region
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
		if(_ataque)
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
	case STATES.ATTACKING:
	#region

		if(keyboard_check_pressed(ord("Q")) && global.vida > 0)
		{
				global.vida = ceil(global.vida) - 1
		}
		if(keyboard_check(ord("R")) && global.vida <= 2)
		{
				global.vida += 1
		}
	#endregion
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
		stop()
		obj_dialogo1.visible = true
		obj_dialogo1.image_speed = 0
		obj_dialogo1.image_index = 0
		instance_destroy(obj_limite)
	}
	if(room == rm_inicio)
	{
		x = 691
		y = 646
	}
	}
}
if(global.slime == 1)
{
	switch(state)
	{
		case STATES.CLIMBING:
			#region
				if(place_meeting(x,y,obj_parede) && _direita)
				{
					y -= 1
				}
				else
				{
					state = STATES.IDLE
				}
			#endregion
	}
	if(!instance_exists(obj_dialogo1))
	{
		ativardialogo = false
	}
	if(ativardialogo == true)
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