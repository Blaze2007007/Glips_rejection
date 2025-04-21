grv = 0.5 // Gravidade
velx = 0 // Velocidade horizontal
vely = 0  // Velocidade vertical
slimevel = 5; // Velocidade do slime
salto = -35; // Esta variável serve para guarda o valor que permite ao slime "saltar"
ativardialogo = true // Esta variável é usada para verificar diálogos
mapats = layer_tilemap_get_id("Tiles_2") // Definir colisões do mapa
direcao = 0 // Variável que armazena a direção do jogador
count = 0
_stop = false
attaking = false
direita = false
esquerda = false

sprite_index = spr_slimenormal

sprite_idle = spr_slimenormal
sprite_ataque = spr_slimenormal_ataque_direita
sprite_morto = spr_slimenormal_morto
sprite_moving =	spr_slimenormal_direita

player_hp = global.vida
player_pontos = global.pontos
player_slime = global.slime

enum STATES
{
	IDLE,
	MOVING,
	MENU,
	ATTACKING,
	HIT,
	DEAD
}
arquivo_dados = "jogador_dados.json";

state = STATES.IDLE

inmenu = false
//true = direita e false = esquerda
last_dir = 1
dano = 5
