// Obter teclas pressionadas
var _direita = keyboard_check(vk_right) or keyboard_check(ord("D")) // Verifica se o jogador está a carregar na seta direita ou na tecla D
var _esquerda = keyboard_check(vk_left) or keyboard_check(ord("A")) // Verifica se o jogador está a carregar na seta esquerda ou na tecla A
var _cima = keyboard_check(vk_up) or keyboard_check(ord("W")) or keyboard_check(vk_space) // Verifica se o jogador está a carregar para cima, W ou espaço (salto)
var _ataque = keyboard_check_pressed(ord("E")) // Verifica se o jogador carregou a tecla E (ataque)

// Obter o tilemap da camada "Tiles_2" para verificar colisões
mapats = layer_tilemap_get_id("Tiles_2")
if(instance_exists(obj_limite))
{
	ativardialogo = true // Esta variável é usada para verificar diálogos
}
else
{
	ativardialogo = false
}

// Atualizar variáveis locais com os valores globais (estado do jogador)
player_hp = global.vida // Define a vida atual do jogador
player_pontos = global.pontos // Define os pontos do jogador
player_slime = global.slime // Define o tipo de slime que o jogador está a usar
ini1_morto = global.ini1_morto // Variável boolean que verifica se o 1ºinimigo está morto
ini2_morto = global.ini2_morto // Variável boolean que verifica se o 2ºinimigo está morto
ini3_morto = global.ini3_morto // Variável boolean que verifica se o 3ºinimigo está morto 

// Verifica se o jogador pressionou ataque, não está a atacar e não está morto
if(_ataque && !attaking && !global.dead) {
	attaking = true // Ativar estado de ataque
	image_index = 0 // Reiniciar a animação de ataque desde o início
}

// Guardar a última direção pressionada (para onde o jogador está virado)
if(_direita) {
	last_dir = 1 // Direita
}
if(_esquerda) {
	last_dir = -1 // Esquerda
}

// Função para parar o movimento do jogador
function stop() {
	slimevel = 0 // Velocidade horizontal a 0
	salto = 0 // Força de salto a 0
}

// Se o jogo estiver pausado, o movimento do jogador é parado
if(global.gamepaused) {
	stop()
}

// Atualiza os flags de progresso conforme a sala atual (nível)
if(room == rm_nivel1) {
	global.player_data.niv1 = true
}
else if(room == rm_nivel2) {
	global.player_data.niv2 = true
}
else if(room == rm_nivel3) {
	global.player_data.niv3 = true
}

// Controla se o jogo está pausado com base no menu
if(inmenu) {
	global.gamepaused = true
} else {
	global.gamepaused = false
}

// Define os sprites conforme o tipo de slime selecionado
if(global.slime == 0) {
	// Slime normal
	sprite_idle = spr_slimenormal // Sprite quando está parado
	sprite_ataque = spr_slimenormal_ataque_direita // Sprite de ataque
	sprite_morto = spr_slimenormal_morto // Sprite de morte
	sprite_moving = spr_slimenormal_direita // Sprite de movimento
}
else if(global.slime == 1) {
	// Slime pegajoso
	sprite_idle = spr_slimepegajoso
	sprite_ataque = spr_slimepegajoso
	sprite_morto = spr_slimepegajoso_morto
	sprite_moving = spr_slimepegajoso_direita
}
else if(global.slime == 2) {
	// Slime moldável
	sprite_idle = spr_slimemoldavel
	sprite_ataque = spr_slimemoldavel_ataque_direita
	sprite_morto = spr_slimemoldavel_morto
	sprite_moving = spr_slimemoldavel_direita
}

// Verifica se o jogador está vivo
if(!global.dead) {
	// Permite troca de personagem se o jogador pressionar "C"
	if(keyboard_check_pressed(ord("C")) && (!ativardialogo || global.troca) && global.player_data.niv2) 
	{
		global.slime ++ // Avança para o próximo slime
		if(global.slime == 3) {
			global.slime = 0 // Reinicia para o primeiro slime
		}
		global.troca = true // Ativa a permissão de troca
	}
	
	// Define direção horizontal com base nas teclas pressionadas
	direcao = _direita - _esquerda
	
	// Calcula a velocidade horizontal
	velx = direcao * slimevel
	
	// Ajusta a escala da imagem com base na direção (espelhamento)
	if(_direita) {
		image_xscale = 1
	} else {
		image_xscale = -1
	}
	
	// Verifica se o jogador está no chão (colisão por baixo)
	if(place_meeting(x, y+2, mapats)) {
		vely = 0 // Zera velocidade vertical
		if(_cima) {
			vely = salto * grv // Aplica força de salto
		}
	}
	else if(vely < 10) {
		vely += 1 // Aumenta a gravidade até um máximo
	}
	
	// Move e trata colisões com o tilemap
	move_and_collide(velx, vely, mapats)
	
	// Define estado inicial como parado
	state = STATES.IDLE
}
else {
	// Se estiver morto
	if(place_meeting(x, y, mapats)) {
		vely = 0 // Para o movimento vertical
		state = STATES.DEAD // Estado de morto
	}
	else if(vely < 1) {
		vely += 1 // Continua a aplicar gravidade leve
	}
}
switch(state) // Estados do jogador
{
	case STATES.IDLE: //Estado IDLE (jogador parado)
	#region 
	if(!global.dead) // se o jogador não estiver morto executa-se o seguinte código
	{
		image_speed = 1 // definir velocidade da imagem do sprite do jogador como 1(normal)
		if(_direita || _esquerda) // se o jogador andar para a esquerda ou para a direita entra no estado MOVING
		{
			state = STATES.MOVING
		}
		else if(velx == 0) // se não e se a sua velocidade horizontal for neutra o seu sprite passa a ser sprite_idle
		{
			sprite_index = sprite_idle
		}
		if(keyboard_check_pressed(vk_escape)) // Se o jogador precionar na tecla escape entra no entado menu
		{
			state = STATES.MENU
		}
		if(attaking && !global.dead) // se o jogador estiver a atacar e não estiver morto passa para o estado ATTAKING
		{
			state = STATES.ATTACKING
		}
		else if(!global.dead) // se não estiver a atacar mas estiver vivo continua no estado IDLE
		{
			state = STATES.IDLE
		}
		else // Se estiver morto passa para o estado DEAD
		{
			state = STATES.DEAD
		}
		if(instance_exists(obj_drop)) // se o objeto obj_drop existir executa-se o seguinte código
		{
			count ++ //incrementar valor do temporizador
			if(count >= 90) // se a o temporizador global chegar a 90 ou ultrapassa-lo, executa-se o seguinte código
			{
				var _drops = ds_list_create() // atribuição de uma lista a uma variável local (_drops)
				var _inst = instance_place_list(x,y,obj_drop,_drops,false) // armazenamento dos drops do inimigo na variável _inst ao detetar as colisões com os mesmos
				ds_list_add(_drops,_inst) // adicionar à lista _drops todos os drops com que o jogador colidiu
				if(_inst > 0 && place_meeting(x,y,obj_drop)) // se o valor de drops do inimigo for maior que zero e o jogador colidir com os mesmos executa-se o seguinte código
				{
					for(var _i = 0; _i < _inst; _i++) // começar um ciclo for que passa por todos os valores de drops do inimigo
					{
						instance_destroy(_drops[| _i]) // destroir o drops com o qual o jogador colidiu
						global.pontos ++ // incrementar pontos
					}
				}
				if ds_list_empty(_drops) // reiniciar o temporizador caso a lista esteja vazia
				{
					count = 0
				}
				ds_list_destroy(_drops) // apagar a lista dos drops do inimigo 
			}
		}
		if(global.vida == 0) // se o jogador perder toda a vida passa para o estado DEAD
		{
			state = STATES.DEAD
		}
	}
	else // caso o jogador não esteja vivo passa para o estado DEAD
	{
		state = STATES.DEAD
	}
	#endregion
	case STATES.MOVING: //Estado de Movimento do jogador
	#region
	if(!global.dead) // se o jogador não estiver morto executa-se o seguinte código
	{
		// atribuir gravidade
		vely = vely + grv 

		if(_direita || _esquerda) // se o jogador andar para a esquerda ou para a direita passa a ter o sprite de movimente(sprite_moving)
		{
			sprite_index = sprite_moving
		}
		else if(velx == 0) // Se a velocidade horizontal for nula passa para o estado IDlE
		{
			state = STATES.IDLE
		}
		if(attaking && !global.dead) // se o jogador estiver a atacar e não estiver morto passa para o estado ATTAKING
		{	
			state = STATES.ATTACKING
		}
		else if(!global.dead) // Se não estiver morto e não estiver a atacar continua no estado de movimento
		{
			state = STATES.MOVING
		}
		else // Se estiver morto passa para o estado DEAD
		{
			state = STATES.DEAD
		}
		if(place_meeting(x,y,mapats))//Correção de colisões
		{
			correcao_de_colisoes(mapats)
		}
		if(keyboard_check_pressed(vk_escape)) // se o jogador pressionar na tecla escape passa a estar no estado MENU
		{
			state = STATES.MENU
		}
		if(global.vida == 0) // se a vida do jogador for nula passa a estar no estado DEAD
		{
			state = STATES.DEAD
		}
		if(instance_exists(obj_drop)) // se o objeto obj_drop existir executa-se o seguinte código
		{
			count ++ //incrementar valor do temporizador
			if(count >= 90) // se a o temporizador global chegar a 90 ou ultrapassa-lo, executa-se o seguinte código
			{
				var _drops = ds_list_create() // atribuição de uma lista a uma variável local (_drops)
				var _inst = instance_place_list(x,y,obj_drop,_drops,false) // armazenamento dos drops do inimigo na variável _inst ao detetar as colisões com os mesmos
				ds_list_add(_drops,_inst) // adicionar à lista _drops todos os drops com que o jogador colidiu
				if(_inst > 0 && place_meeting(x,y,obj_drop)) // se o valor de drops do inimigo for maior que zero e o jogador colidir com os mesmos executa-se o seguinte código
				{
					for(var _i = 0; _i < _inst; _i++) // começar um ciclo for que passa por todos os valores de drops do inimigo
					{
						instance_destroy(_drops[| _i]) // destroir o drops com o qual o jogador colidiu
						global.pontos ++ // incrementar pontos
					}
				}
				if ds_list_empty(_drops) // reiniciar o temporizador caso a lista esteja vazia
				{
					count = 0
				}
				ds_list_destroy(_drops) // apagar a lista dos drops do inimigo 
			}
		}
	}
	else // se o jogador perder toda a vida passa para o estado DEAD
	{
		state = STATES.DEAD
	}
	#endregion
	case STATES.MENU: // Estado de menu
	#region
		if(instance_exists(obj_menu)) // se o objeto obj_menu existir inmenu passa a ser verdadeiro e o jogador para
		{
			inmenu = true
			stop()
		}
		if(keyboard_check_pressed(vk_escape) && inmenu == true) // se se pressionar a tecla escape e a variável inmenu for verdadeira executa-se o seguinte código 
		{
			inmenu = false // inmenu passa a ser false(não se está mais no menu)
			//o jogador pode se volta a mexer
			salto = -35 
			slimevel = 5
		}
	#endregion
	case STATES.ATTACKING: // Estado de ataque
	#region
	if(!global.dead) // se o jogador não estiver morto executa-se o seguinte código
	{
		if(attaking) // se o jogador estiver a atacar executa-se o seguinte código
		{ 
			if(last_dir == 1) // se a ultima direção(last_dir) for direita(1) então a escala do sprite é 1(o jogador olha para a direita) 
			{
				image_xscale = 1
			}
			else if(last_dir == -1) // se a ultima direção(last_dir) for esquerda(-1) então a escala do sprite é -1(o jogador olha para a esquerda) 
			{
				image_xscale = -1
			}
			sprite_index = sprite_ataque // atribuição do sprite de ataque ao jogador
			if(image_index >= image_number - 1) // se o indice da imagem for o ultimo indice do sprite o jogador passa para o estado IDLE e attaking passa a ser false(não está a atacar)
			{
				state = STATES.IDLE
				attaking = false
			}
			else // caso contrário mantém o sprite e o estado de ataque
			{
				sprite_index = sprite_ataque
				state = STATES.ATTACKING
			}
		}
		else //se o jogador não estiver a atacar passa para o estado IDLE
		{
			state = STATES.IDLE
		}
		if(global.vida == 0) // se o jogador perder toda a vida passa para o estado DEAD
		{
			state = STATES.DEAD
		}
	}
	else  // se o jogador estiver morto passa para o estado DEAD
	{
		state = STATES.DEAD
	}
	#endregion
	case STATES.DEAD: //Estado de morte
	#region
		if(global.vida <= 0)  // se o jogador perder toda a vida passa para o estado DEAD executa-se o seguinte código
		{
			global.dead = true // global.dead passa a ser true(o jogador está morto)
			sprite_index = sprite_morto //sprite de morto
			stop() //impedir movimento do jogador
			if(image_index >= image_number - 1) // se a imagem do sprite chegar ao fim para o loop dos frames da imagem
			{
				image_speed = 0
			}
			if(!place_meeting(x,y,mapats)) // Se não estiver a tocar no chão passa a descer até o fazer
			{
				vely = vely + grv // atribuir gravidade
				if(vely > 10) // abrandar a descida se vely(velocidade vertical) for maior que 10
				{
					vely = 1
				}
				y = y + vely // atribuir valores anteriores à posição do jogador
			}
			else // se o jogador estiver a tocar no chão a sua velocidade vertical passa a ser 0
			{
				vely = 0
			}
		}
		else // se o jogador não estiver morto executa-se o seguinte código
		{
			global.dead = false // global.dead passa a ser false(o jogador está vivo)
			state = STATES.IDLE // passa-se para o estado IDLE
			// o jogador pode voltar a mexer-se
			salto = -35
			slimevel = 5
			// se _stop for true o jogador passa a ficar inativo
			if(_stop)
			{
				stop()
			}
		}
	#endregion
}
#region ifs extra
if(!global.dead) // se o jogador perder toda a vida executa-se o seguinte código
{
	if(place_meeting(x,y,obj_centro) && keyboard_check_pressed(ord("F"))) // se o jogador estiver em colisão com o objeto obj_centro e clicar na tecla F executa-se o seguinte código
		{
			room_goto_next() // segue-se para a próxima sala
			instance_destroy(obj_slimepegajoso)
			instance_destroy(obj_limite)
			// posição inicial da próxima sala
			x = 170
			y = 600
			if(room == rm_nivel3) // caso se esteja na ultima sala e as condições previamente referidas se verificarem o jogador volta para a sala anterior
			{
				room_goto_previous() // voltar para a sala anterior
			}
		}
	if(global.slime == 0) // se o jogador estiver a usar a primeira personagem excuta-se o seguinte código
	{
		image_angle = 0 // o angulo da imagem volta a ficar normal (já se precebe mais a frente no código)
		if(!instance_exists(obj_text)) // se o objeto obj_text não existir executa-se o seguinte código 
		{
			state = STATES.IDLE // o jogador passa para o estado IDLE
			// permite-se o movemento do jogador
			slimevel = 5
			salto = -35
		}
		if(place_meeting(x,y,obj_limite) && ativardialogo) // se o jogador colidir com o objeto obj_limite cria-se uma começa-se um dialogo com o 2º personagem
		{
			instance_destroy(obj_limite) // destruir a parede limite que permite que a conversa começe
			_stop = true // a variável _stop passa a ser true(impede o jogador de se mexer)
			ativardialogo = false
			//------------------------------------1ªConversa------------------------------------\\
			var _s = id
			with(instance_create_depth(x,y,depth,obj_text)) // ao criar o objeto obj_text chama-se a função create_textbox (o que começa uma conversa)
			{
					create_textbox(_s.text_id)
			}
			if(!instance_exists(obj_text) && !ativardialogo)
			{
				global.player_data.conv_1 = true
			}
		}
	}
	else if(global.slime == 1) // se o jogador estiver a jogar do segundo personagem executa-se o seguinte código
	{
		if(place_meeting(x,y,obj_parede) && _direita) // se o jogador colidir com o objeto obj_parede e estiver a andar para a direita consegue escalar a pareder
		{
			vely -= 1.5 // decrementar os valores da velocidade vertical do jogador
			y -= 1 // decrementar os valores da posição y do jogador
			image_angle = 90 // troca do angulo da imagem (é por isto que o angulo da imagem do 1º personagem volta a ser zero)
		}
		else // se o jogador não colidir com esse objeto ou o fizer e não estiver a andar para a direita executa-se o seguinte código
		{
			if(image_angle > 0) //se o angulo da imagem for maior que zero então vai decrementando até lá chegar
			{
				image_angle = image_angle - 10 // decremento do angulo da imagem
			}
			else // se for não for maior que zero passa a ser igual a zero(angulo normal)
			{
				image_angle = 0
			}
			
		}
		if(!ativardialogo && instance_exists(obj_text)) // se a variável ativardialogo for verdadeira executa-se o seguinte código
		{
			sprite_index = sprite_idle // o sprite do jogador passa a ser o sprite_idle
			stop() //o jogador deixa de se poder mexer
		}
		else // se ativardialogo for false o jogador pode se mexer
		{
			slimevel = 5
			salto = -35
		}
	}
	else if(global.slime == 2) // se o jogador estiver a jogar com o terceiro personagem executa-se o seguinte código
	{
		image_angle = 0 // o angulo do sprite volta ao normal
		if(!ativardialogo && instance_exists(obj_text)) // se a variável ativardialogo for false executa-se o seguinte código
		{
			sprite_index = sprite_idle // o sprite do jogador passa a ser o sprite_idle
			stop() //o jogador deixa de se poder mexer
		}
		else // se ativardialogo for false o jogador pode se mexer
		{
			slimevel = 5
			salto = -35
		}
	}
	if(instance_exists(obj_menu)) // se o objeto obj_menu existir inmenu passa a ser verdadeiro e o jogador para
	{
		inmenu = true
		stop()
	}
	if(keyboard_check_pressed(vk_escape) && inmenu == true) // se se pressionar a tecla escape e a variável inmenu for verdadeira executa-se o seguinte código 
	{
		inmenu = false // inmenu passa a ser false(não se está mais no menu)
		//o jogador pode se volta a mexer
		salto = -35 
		slimevel = 5
	}
}

//#####DEBUG#####\\
       //|\\
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
	   //|\\
//#####DEBUG#####\\
	
if(global.dead or global.gamepaused) // se o jogador estiver morto ou se o jogo estiver pausado o jogador deixa de se poder mexer
{
	sprite_index = sprite_morto
			slimevel = 0
			vely = 0
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
show_debug_message(ativardialogo)
#endregion