//Obter teclas pressionadas
var _direita = keyboard_check(vk_right) or keyboard_check(ord("D")) // definição de variável associada à movimentação do jogador para a direita
var _esquerda = keyboard_check(vk_left) or keyboard_check(ord("A")) // definição de variável associada à movimentação do jogador para a esquerda
var _cima = keyboard_check(vk_up) or keyboard_check(ord("W")) or keyboard_check(vk_space) // definição de variável associada ao do jogador
var _ataque = keyboard_check_pressed(ord("E")) // definição de variável associada ao ataque do jogador
mapats = layer_tilemap_get_id("Tiles_2") // definição de variável para verificação de colisões 

//Atribuição de valores à respetiva variável do jogador a ser armazenada 
global.player_data.vida = int64(global.vida) 
global.player_data.pontos = int64(global.pontos)
global.player_data.posicao._x = int64(x)
global.player_data.posicao._y = int64(y)
global.player_data.slime = int64(global.slime) 

save_player_data(global.player_data,arquivo_dados) // guardar dados do jogador

if(_ataque && !attaking && !global.dead) // Se o jogador clicar no botão para a atacar e não estiver a atacar nem morto executa o seguinte código 
{
	attaking = true //Trocar a variável boolean de verificação de ataque para true(está a atacar)
	image_index = 0 // troca de indice da imagem do personagem para o 1ºFrame
}
if(_direita) // Se o jogador clicar no botão de movimento para a direita executa o seguinte código
{
	last_dir = 1 // Armazenamento da ultima direção para a qual o jogador andou(direita)
}
if(_esquerda)
{
	last_dir = -1 // Armazenamento da ultima direção para a qual o jogador andou(esquerda)
}

function stop() // Função usada para parar o jogador
{
	slimevel = 0 // anulamento da velocidade do jogador
	salto = 0 // anulamento da força de salto do jogador
}
if(global.gamepaused)
{
	stop()
}

if(room == rm_nivel1) // Se o nivel for rm_nivel1 guarda a variável global.player_data.niv1 como true 
{
	global.player_data.niv1 = true
}
else if(room == rm_nivel2) // Se o nivel for rm_nivel2 guarda a variável global.player_data.niv2 como true 
{
	global.player_data.niv2 = true
}
else if(room == rm_nivel3) // Se o nivel for rm_nivel3 guarda a variável global.player_data.niv3 como true 
{
	global.player_data.niv3 = true
}

if(inmenu) // enquanto se estiver com o menu aberto(inmenu == true) a variável global.gamepaused é guardada como true 
{
	global.gamepaused = true
}
else // caso contrário a variável passa a ser guardada como false
{
	global.gamepaused = false
}

if(global.slime == 0) // se o indice do slime(personagem) for igual a 0(1º) então guarda as respetivas variáveis 
{
	sprite_idle = spr_slimenormal // variável idle do personagem
	sprite_ataque = spr_slimenormal_ataque_direita // variável de ataque do personagem
	sprite_morto = spr_slimenormal_morto // variável de morte do personagem
	sprite_moving =	spr_slimenormal_direita // variável de movimento do personagem
}
else if(global.slime == 1) // se o indice do slime(personagem) for igual a 1(2º) então guarda as respetivas variáveis 
{
	sprite_idle = spr_slimepegajoso // variável idle do personagem
	sprite_ataque = spr_slimepegajoso // variável de ataque do personagem
	sprite_morto = spr_slimepegajoso_morto // variável de morte do personagem
	sprite_moving =	spr_slimepegajoso_direita // variável de movimento do personagem
}
else if(global.slime == 2) // se o indice do slime(personagem) for igual a 2(3º) então guarda as respetivas variáveis 
{
	sprite_idle = spr_slimemoldavel // variável idle do personagem
	sprite_ataque = spr_slimemoldavel_ataque_direita // variável de ataque do personagem
	sprite_morto = spr_slimemoldavel_morto // variável de morte do personagem
	sprite_moving =	spr_slimemoldavel_direita // variável de movimento do personagem
}
if(!global.dead) // se o jogador não estiver morto executa-se o código dentro da condição
{
	if(keyboard_check_pressed(ord("C")) && (!ativardialogo || global.troca)) // se o jogador pressionar a tecla C e o dialogo com o segundo personagem estiver acabado ou ser permitida a troca executa o seguinte código
	{
		global.slime ++ // aumentar o indice do slime(trocar para a proxima personagem)
		if(global.slime == 3) // se o indice do slime chegar ao seu limite volta para o início
		{
			global.slime = 0 // reiniciar o indice do slime
		}
		global.troca = true // armazenar a variável de troca como true caso se tenha acabado o dialogo e clicado C pela primeira vez
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
		if(attaking && !global.dead)
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
		if(attaking && !global.dead)
		{	
			state = STATES.ATTACKING
		}
		else
		{
			state = STATES.MOVING
		}
		if(place_meeting(x,y,mapats))//Correção de colisões
		{
			correcao_de_colisoes(mapats)
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
		if(global.vida <= 0)
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
		if(room == rm_nivel3)
		{
			room_goto_previous()
		}
	}
if(global.slime == 0)
{
	image_angle = 0
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
		image_angle = 90
	}
	else
	{
		if(image_angle > 0)
		{
			image_angle = image_angle - 10
		}
		else
		{
			image_angle = 0
		}
		
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
else if(global.slime == 2)
{
	image_angle = 0
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
		global.player_data.vida = ceil(global.vida) - 1
		global.vida --
}
if(keyboard_check(ord("R")) && global.vida <= 2)
{
		global.player_data.vida += 1
		global.vida ++
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
if(global.dead)
{
	sprite_index = sprite_morto
			slimevel = 0
			salto = 0
			if(image_index >= image_number - 1)
			{
				image_speed = 0
				state = STATES.DEAD
			}
			else if(!global.dead)
			{
				image_speed = 1
				state = STATES.IDLE
			}
}
#endregion