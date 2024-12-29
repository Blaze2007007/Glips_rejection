grv = 0.5 // Gravidade
velx = 0 // Velocidade horizontal
vely = 0  // Velocidade vertical
slimevel = 5; // Velocidade do slime
salto = -35; // Esta variável serve para guarda o valor que permite ao slime "saltar"
ativardialogo = true // Esta variável é usada para verificar diálogos
mapats = layer_tilemap_get_id("Tiles_2") // Definir colisões do mapa
direcao = 0 // Variável que armazena a direção do jogador
global.gamepaused = false // Variável utilizada para a verificação da pausa do jogo
global.slime = 0 // Determina qual o slime(personagem) a ser usado
count = 0

animation_active = false

sprite_index = spr_slimenormal

sprite_idle = spr_slimenormal
sprite_ataque = spr_slimenormal_ataque_direita
sprite_morto = spr_slimenormal_morto
sprite_moving =	spr_slimenormal_direita

enum STATES
{
	IDLE,
	MOVING,
	MENU,
	ATTACKING,
	HIT,
	DEAD
}

state = STATES.IDLE

inmenu = false
global.vida = 3
global.pontos = 0
//true = direita e false = esquerda
last_dir = false
dano = 5

player_data = {
	nivel: 0,
	vida: 3,
	pontos: 0,
	posicao: [0, 0], // Posição padrão com dois valores
	slime_atual: 0
};
		
load_player_data()