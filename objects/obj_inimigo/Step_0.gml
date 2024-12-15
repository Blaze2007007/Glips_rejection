var _mapats = layer_tilemap_get_id("Tiles_2") // Definir colisões do mapa

state = ENEMYSTATES.IDLE
grv = 2 
vely = 0
movex = 0

switch(state)
{
	case ENEMYSTATES.IDLE: //ESTADO 0 (estado idle)
	#region
	
		count1 ++ // Incrementar a variável count1 (começar o temporizador)
		
		if(pode_mudar) // Se o inimigo mode mudar de direção então o programa escolhe um valor aleatório de 0 a 2 e passa a não poder mudar de direção
		{
			pode_mudar = false // O inimigo passa a não poder mudar de direção durante dois segundo
			opcao = round(random(2)) // Escolha de um valor aleatório de 0 a 2 (valor inteiro)
		}
		else if(count1 == 120) // se o temporizador chegar a dois segundos (120 frames = 2 segundos), o inimigo pode voltar a trocar de direção e o temporizador é recomeçado
		{
			count1 = 0 // Recomeçar o temporizador
			pode_mudar = true // O inimigo pode mudar de direção
		}
		switch(opcao) // Dependendo da escolha do programa (0, 1 ou 2) o inimigo realiza as seguintes ações
		{
			case 0: // Mover-se para a esquerda
			
			if(!collision_circle(x,y,224,obj_playerchecker,false,false)) // Se o jogador não estiver dentro do círculo definido realiza a seguinte ação
			{
				movex += 1 // Incrementar a variável do movimento horizontal
				x -= movex // Mover o inimigo de acordo com a variável do movimento horizontal
				if(place_meeting(x,y+2,_mapats)) // Se estiver a tocar no chão (colisão do mapa) a velocidade vertical do inimigo é igual a 0
				{
					vely = 0 // Atribuir o valor 0 à velocidade vertical
				}
				else if(vely < 1) // Se não colidir com o chão aplica-se gravidade ao inimigo
				{
					vely += 1 // Incrementar a velocidade vertical
					vely = vely + grv // Ajustar a velocidade vertical com a gravidade
				}
				
				y += vely / 2 // Mover o inimigo de acordo com a variável do movimento vertical
				
				for(var _i = 0; _i < 1000; _i++) // verificação de colisões com o mapa para que o inimigo não atravesse paredes ao mover-se
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
			case 1: // Movimento para a Direita
			if(!collision_circle(x,y,224,obj_playerchecker,false,false)) // Se o jogador não estiver dentro do círculo definido realiza a seguinte ação
			{
				movex -= 1 // Decrementar a variável do movimento horizontal
				x -= movex // Mover o inimigo de acordo com a variável do movimento horizontal
				if(place_meeting(x,y+2,_mapats)) // Se estiver a tocar no chão (colisão do mapa) a velocidade vertical do inimigo é igual a 0
				{
					vely = 0 // Atribuir o valor 0 à velocidade vertical
				}
				else if(vely < 1) // Se não colidir com o chão aplica-se gravidade ao inimigo
				{
					vely += 1 // Incrementar a velocidade vertical
					vely = vely + grv // Ajustar a velocidade vertical com a gravidade
				}
				
				y += vely / 2 // Mover o inimigo de acordo com a variável do movimento vertical
				
					for(var _i = 0; _i < 1000; _i++) // verificação de colisões com o mapa para que o inimigo não atravesse paredes ao mover-se
					{
						//Direita
						if(!place_meeting(x + _i,y,_mapats))
						{
							x += _i // Avançar para a direita para não atravessar a pareda à esquerda
							break
						}
						//Esquerda
						if(!place_meeting(x - _i,y,_mapats))
						{
							x -= _i // Avançar para a esquerda para não atravessar a pareda à direita
							break
						}
						//Cima
						if(!place_meeting(x,y - _i,_mapats))
						{
							y -= _i // Impedir que o inimigo caia(puxa-lo para cima)
							break
						}
						//Baixo
						if(!place_meeting(x,y + _i,_mapats))
						{
							y += _i // Impedir que o inimigo atravesse o teto(puxa-lo para baixo)
							break
						}
						//Topo direita
						if(!place_meeting(x + _i,y - _i,_mapats)) //Impedir que o inimigo atravesse o teto e a parede esquerda(puxa-lo para baixo e para a direita)
						{
							x += _i
							y -= _i
							break
						}
						//Topo esquerda
						if(!place_meeting(x - _i,y - _i,_mapats))//Impedir que o inimigo atravesse o teto e a parede direita(puxa-lo para baixo e para a esquerda)
						{
							x -= _i
							y -= _i
							break
						}
						//Baixo direita
						if(!place_meeting(x + _i,y + _i,_mapats))//Impedir que o inimigo atravesse o chão e a parede esquerda(puxa-lo para cima e para a direita)
						{
							x += _i
							y += _i
							break
						}
						//Baixo esquerda
						if(!place_meeting(x - _i,y + _i,_mapats))//Impedir que o inimigo atravesse o chão e a parede direita(puxa-lo para cima e para a esquerda)
						{
							x -= _i
							y += _i
							break
						}
					}
			}
			case 2: // Ficar parado
				movex = 0 // Atribuir o valor 0 à variável "movex" para o inimigo ficar parado
				if(place_meeting(x,y+2,_mapats)) // Se estiver a tocar no chão (colisão do mapa) a velocidade vertical do inimigo é igual a 0
				{
					vely = 0 // Atribuir o valor 0 à velocidade vertical
				}
				else if(vely < 1) // Se não colidir com o chão aplica-se gravidade ao inimigo
				{
					vely += 1 // Incrementar a velocidade vertical
					vely = vely + grv // Ajustar a velocidade vertical com a gravidade
				}
				
				y += vely / 2 // Mover o inimigo de acordo com a variável do movimento vertical
				
				for(var _i = 0; _i < 1000; _i++) // verificação de colisões com o mapa para que o inimigo não atravesse paredes ao mover-se
				{
					//Direita
					if(!place_meeting(x + _i,y,_mapats))
					{
						x += _i // Avançar para a direita para não atravessar a pareda à esquerda
						break
					}
					//Esquerda
					if(!place_meeting(x - _i,y,_mapats))
					{
						x -= _i // Avançar para a esquerda para não atravessar a pareda à direita
						break
					}
					//Cima
					if(!place_meeting(x,y - _i,_mapats))
					{
						y -= _i // Impedir que o inimigo caia(puxa-lo para cima)
						break
					}
					//Baixo
					if(!place_meeting(x,y + _i,_mapats))
					{
						y += _i // Impedir que o inimigo atravesse o teto(puxa-lo para baixo)
						break
					}
					//Topo direita
					if(!place_meeting(x + _i,y - _i,_mapats)) //Impedir que o inimigo atravesse o teto e a parede esquerda(puxa-lo para baixo e para a direita)
					{
						x += _i
						y -= _i
						break
					}
					//Topo esquerda
					if(!place_meeting(x - _i,y - _i,_mapats))//Impedir que o inimigo atravesse o teto e a parede direita(puxa-lo para baixo e para a esquerda)
					{
						x -= _i
						y -= _i
						break
					}
					//Baixo direita
					if(!place_meeting(x + _i,y + _i,_mapats))//Impedir que o inimigo atravesse o chão e a parede esquerda(puxa-lo para cima e para a direita)
					{
						x += _i
						y += _i
						break
					}
					//Baixo esquerda
					if(!place_meeting(x - _i,y + _i,_mapats))//Impedir que o inimigo atravesse o chão e a parede direita(puxa-lo para cima e para a esquerda)
					{
						x -= _i
						y += _i
						break
					}
				}
		}
	//verificação de proximidade
	if(collision_circle(x,y,224,obj_playerchecker,false,false)) // Se o jogador se aproximar do inimigo o suficiente o inimigo passa a perseguir o jogador
	{
		state = ENEMYSTATES.ALERT // A variável "state" passa a indicar que o inimigo está no estado alerta
	}
	#endregion
	case ENEMYSTATES.ALERT: //ESTADO 1 (estado alerta)
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
	
	movex = lengthdir_x(2,my_dir)
	
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
		global.vida -= enemy_damage
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
		global.vida_inimigo --
	}
	if(global.vida_inimigo == 0)
	{
		state = ENEMYSTATES.DEAD
	}
		//hit sprite
	#endregion
	case ENEMYSTATES.DEAD: //ESTADO 4
	#region
		if(global.vida_inimigo == 0)
		{
		movex = 0
		//death sprite
		instance_destroy(self)
			for(var _i;_i < enemy_drops;_i++)
			{
				var _random_pos = random(3)
				var _esq_dir = choose(0,1)
				switch(_esq_dir)
				{
					case 0:
						_random_pos = sign(_random_pos)
					case 1:
						break
				}
				instance_create_layer(x + _random_pos,y,layer,obj_drop)
			}
		}
		else
		{
			state = STATES.IDLE
		}
	#endregion
}
