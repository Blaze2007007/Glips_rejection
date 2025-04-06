var _mapats = layer_tilemap_get_id("Tiles_2") // Definir colisões do mapa

state = ENEMYSTATES.IDLE
grv = 2 
vely = 0
movex = 0

switch(state)
{
	case ENEMYSTATES.IDLE: //ESTADO 0 (estado idle)
 	#region
		count1 ++ // Incrementar a variável "count1" (começar o temporizador)
		
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
			#region
			if(!collision_circle(x,y,224,obj_slime_pai,false,false)) // Se o jogador não estiver dentro do círculo definido realiza a seguinte ação
			{
				movex += 1 // Incrementar a variável do movimento horizontal
				x -= movex // Mover o inimigo de acordo com a variável do movimento horizontal
				sprite_index = sprite_ini_moving
				
				if(place_meeting(x,y+2,_mapats)) // Se estiver a tocar no chão (colisão do mapa) a velocidade vertical do inimigo é igual a 0
				{
					vely = 0
					if(collision_rectangle(bbox_left-10,y+15,bbox_left,y,_mapats,false,false))
					{
						vely = -30 * grv
					}
				}
				else if(vely < 1) // Se não colidir com o chão aplica-se gravidade ao inimigo
				{
					vely += 1 // Incrementar a velocidade vertical
					vely = vely + grv // Ajustar a velocidade vertical com a gravidade
				}
				
				y += vely / 2 // Mover o inimigo de acordo com a variável do movimento vertical
				#region //Verificação de colisões
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
					#endregion
			}
			#endregion
			case 1: // Movimento para a Direita
			#region
			if(!collision_circle(x,y,224,obj_slime_pai,false,false)) // Se o jogador não estiver dentro do círculo definido realiza a seguinte ação
			{
				movex -= 1 // Decrementar a variável do movimento horizontal
				x -= movex // Mover o inimigo de acordo com a variável do movimento horizontal
				sprite_index = sprite_ini_moving
				
				if(place_meeting(x,y+2,_mapats)) // Se estiver a tocar no chão (colisão do mapa) a velocidade vertical do inimigo é igual a 0
				{
					vely = 0
					if(collision_rectangle(bbox_right+10,y+15,bbox_right,y,_mapats,false,false))
					{
						vely = -30 * grv
					}
				}
				else if(vely < 1) // Se não colidir com o chão aplica-se gravidade ao inimigo
				{
					vely += 1 // Incrementar a velocidade vertical
					vely = vely + grv // Ajustar a velocidade vertical com a gravidade
				}
				
				y += vely / 2 // Mover o inimigo de acordo com a variável do movimento vertical
				#region //Verificação de colisões
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
					#endregion
			}
			#endregion
			case 2: // Ficar parado
			#region
				movex = 0 // Atribuir o valor 0 à variável "movex" para o inimigo ficar parado
				
				if(place_meeting(x,y+2,_mapats)) // Se estiver a tocar no chão (colisão do mapa) a velocidade vertical do inimigo é igual a 0
				{
					vely = 0
					if(collision_rectangle(bbox_left-10,y+15,bbox_left,y,_mapats,false,false))
					{
						vely = -30 * grv
					}
				}
				else if(vely < 1) // Se não colidir com o chão aplica-se gravidade ao inimigo
				{
					vely += 1 // Incrementar a velocidade vertical
					vely = vely + grv // Ajustar a velocidade vertical com a gravidade
				}
				
				y += vely / 2 // Mover o inimigo de acordo com a variável do movimento vertical
				#region //Verificação de colisões
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
				#endregion
			#endregion
		}
	//verificação de proximidade
	if(collision_circle(x,y,224,obj_slime_pai,false,false)) // Se o jogador se aproximar do inimigo o suficiente o inimigo passa a perseguir o jogador
	{
		state = ENEMYSTATES.ALERT // A variável "state" passa a indicar que o inimigo está no estado alerta
	}
	#endregion
	case ENEMYSTATES.ALERT: //ESTADO 1 (estado alerta)
	#region
	if(!collision_circle(x,y,224,obj_slime_pai,false,false)) // Se o jogador não estiver proximo o suficiente do circulo do alerta, o inimigo volta para o seu estado idle
	{
		state = ENEMYSTATES.IDLE // A variável "state" passa a indicar que o inimigo está no estado idle
	}
	else //Se o jogador estiver proximo o suficiente o inimigo executa as seguintes ações
	{
		if(place_meeting(x,y+2,_mapats)) // Se estiver a tocar no chão (colisão do mapa) a velocidade vertical do inimigo é igual a 0 e faz as verificações de colisão do mapa
		{
			vely = 0
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
			if(collision_rectangle(bbox_left-20,y+15,bbox_left,y,_mapats,false,false) or collision_rectangle(bbox_right+20,y+15,bbox_right,y,_mapats,false,false))
			{
				vely = -30 * grv
			}
		}
		else if(vely < 1) // Se não colidir com o chão aplica-se gravidade ao inimigo
		{
			vely += 1 // Incrementar a velocidade vertical
			vely = vely + grv // Ajustar a velocidade vertical com a gravidade
		}
		
		dis_from_player = point_direction(x,y,obj_slime_pai.x,obj_slime_pai.y-y) //Definir a variável "dis_from_player" para as seguintes verificações
		
		if(dis_from_player > 90) // Se a distância entre o inimigo e o jogador for maior que 90 o inimigo segue o jogador até um certo ponto 
		{
			sprite_index = sprite_ini_moving
			my_dir = point_direction(x,y,obj_slime_pai.x + 50,obj_slime_pai.y) // Definir a direção do inimigo para se aproximar do jogador pela direita
			facing = 1
		}
		else if (dis_from_player < 90) // Se a distância entre o inimigo e o jogador for menor que 90 o inimigo segue o jogador até um certo ponto
		{
			sprite_index = sprite_ini_moving
			my_dir = point_direction(x,y,obj_slime_pai.x - 50,obj_slime_pai.y) // Definir a direção do inimigo para se aproximar do jogador pela esquerda
			facing = -1
		}
		else // Se nenhuma das ações anteriores for verdadeira o codigo continua a verificar as distâncias
		{
			return // Serve para fechar as condições no caso de acontecer algo diferente do que foi referido anteriormente
		}
		
		movex = lengthdir_x(2,my_dir) // Definir a variável "movex" como a distancia e direção que o inimigo tem que andar para chegar ao jogador
		
		x += movex // Incrementar "x"(ou a posição do jogador) de acordo com a variável previamente definida
		
		move_and_collide(movex,vely,_mapats) // Esta função permite que o jogador se mova enquanto verifica colisões
		
		if(collision_circle(x,y,32,obj_slime_pai,false,false)) // Se o inimigo colidir com o jogador o inimigo passa ao estado de ataque
		{
			state = ENEMYSTATES.ATTACKING // Passar para o estado de ataque
			attaking = true
		}
		if(collision_circle(x,y,64,obj_slime_pai,false,false) && keyboard_check_pressed(ord("E"))) //Se o jogador se aproximar o suficiente do inimigo e clicar no "E" (atacar o inimigo), o inimigo passa para o seu estado de ser atingido
		{
			state = ENEMYSTATES.HIT // Passar ao estado em que é atacado
		}
	}
	#endregion
	case ENEMYSTATES.ATTACKING: //ESTADO 2 (estado de ataque)
	#region
	#region // sistema de ataque
	count2 ++ // Incrementar a variável "count2" (começar o temporizador)
	if(count2 == 180) // Se "count2" chegar a 180(3 segundos em frames) exucuta a proxima
	{
		count2 = 0 // Recomeçar o temporizador
		pode_atacar = true // Pode voltar a atacar
	}
	if(attaking && pode_atacar && global.vida > 0) // Se estiver a colidir com o jogador, poder atacar e a vida do jogador for maior do que 0, então executa o seguinte codigo
	{
		sprite_index = sprite_ini_ataque
		image_speed = 1
		if(image_index < image_number - 1)
		{
			sprite_index = sprite_ini_ataque
		}
		else
		{
			sprite_index = sprite_ini_idle
			attaking = false
		}
		if(global.gamepaused)
		{
			global.vida = global.vida
		}
		else
		{
			global.vida -= enemy_damage // Tira vida ao jogador de acordo com o dano do inimigo
		}
		pode_atacar = false // Não pode atacar até ao temporizador chegar a 180
		count2 = 0 // Recomeça o temporizador
	}
	else
	{
		sprite_index = sprite_ini_idle
		state = ENEMYSTATES.IDLE
	}
	#endregion
	if(collision_circle(x,y,64,obj_slime_pai,false,false) && keyboard_check_pressed(ord("E"))) // Mudança para o estado em que é atacado, se o jogador entrar em colisão com o circulo de ataque e atacar
	{
		state = ENEMYSTATES.HIT // Passar ao estado em que é atacado
	}
	if(!place_meeting(x,y,obj_slime_pai)) // Se não colidir com o jogador passa para o estado alerta
	{
		state = ENEMYSTATES.ALERT // A variável "state" passa a indicar que o inimigo está no estado alerta
	}
		//attack sprite
	#endregion
	case ENEMYSTATES.HIT: //ESTADO 3 (estado em que é atacado)
	#region
	if(!collision_circle(x,y,64,obj_slime_pai,false,false)) // Se não estiver proximo o suficiente da area de ataque passa para o estado alerta
	{
		state = ENEMYSTATES.ALERT // A variável "state" passa a indicar que o inimigo está no estado alerta
	}
	if(collision_circle(x,y,64,obj_slime_pai,false,false) && keyboard_check_pressed(ord("E")) && !global.dead) // Se estiver proximo o suficiente da area de ataque passa para o estado alerta
	{
		global.vida_inimigo -- // Decrementar a vida do inimigo com cada ataque do jogador
	}
	if(global.vida_inimigo == 0) // Se a vida do inimigo for igual a 0 o jogador morre (passa para o estado "DEAD")
	{
		state = ENEMYSTATES.DEAD 
	}
		//hit sprite
	#endregion
	case ENEMYSTATES.DEAD: //ESTADO 4 (estado da morte do inimigo)
	#region
		if(global.vida_inimigo == 0) // Se a vida do inimigo for igual a zero(morrer), criam-se instancias do objeto drop perto do inimigo já morto, as que, ao serem apanhadas dão pontos
		{
			if(enemy_id == 0)
			{
				instance_destroy(self) //Apagar inimigo
				for(var _i;_i < enemy_drops;_i++)//Ciclo para criação das instâncias do objeto drop
				{
					var _random_pos = random(100) // definição da posição dos drops
					var _esc_dir = choose(0,1) // Direção dos drops
					switch(_esc_dir)
					{
						case 0:
							_random_pos = sign(_random_pos)
						case 1:
							break
					}
					instance_create_depth(x + _random_pos,y,depth,obj_drop) // criação dos drops
				}
			}
			else if(enemy_id == 1)
			{
				instance_destroy(self) //Apagar inimigo
				for(var _i;_i < enemy_drops;_i++)//Ciclo para criação das instâncias do objeto drop
				{
					var _random_pos = random(100) // definição da posição dos drops
					var _esc_dir = choose(0,1) // Direção dos drops
					switch(_esc_dir)
					{
						case 0:
							_random_pos = sign(_random_pos)
						case 1:
							break
					}
					instance_create_depth(x + _random_pos,y-60,depth,obj_drop) // criação dos drops
				}
			}
		}
		else //Se a vida do inimigo não for igual a zero passa para o estado idle do inimigo
		{
			state = STATES.IDLE
		}
	#endregion
}