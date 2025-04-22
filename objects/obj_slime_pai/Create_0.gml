grv = 0.5 // Gravidade
velx = 0 // Velocidade horizontal
vely = 0  // Velocidade vertical
slimevel = 5; // Velocidade do slime
salto = -35; // Esta variável serve para guarda o valor que permite ao slime "saltar"
ativardialogo = true // Esta variável é usada para verificar diálogos
mapats = layer_tilemap_get_id("Tiles_2") // Definir colisões do mapa
direcao = 0 // Variável que armazena a direção do jogador
count = 0 // Definir temporizador
_stop = false // Definir variável para verificação de colisão para paragem do jogador
attaking = false // Definir variável para verificação do ataque do jogador
direita = false // Definição de variável para verificação da direção do jogador
esquerda = false // Definição de variável para verificação da direção do jogador

sprite_index = spr_slimenormal //Definição de sprite original

sprite_idle = spr_slimenormal // Sprite idle do slime principal
sprite_ataque = spr_slimenormal_ataque_direita // Sprite de ataque do slime principal
sprite_morto = spr_slimenormal_morto // Sprite de morte do slime principal
sprite_moving =	spr_slimenormal_direita // Sprite de movimento do slime principal

player_hp = global.vida // Variável que armazena a vida do jogador
player_pontos = global.pontos // Variável que armazena os pontos do jogador
player_slime = global.slime // Variável que armazena o personagem do jogador
ini1_morto = global.ini1_morto // Variável boolean que verifica se o 1ºinimigo está morto
ini2_morto = global.ini2_morto // Variável boolean que verifica se o 2ºinimigo está morto
ini3_morto = global.ini3_morto // Variável boolean que verifica se o 3ºinimigo está morto 

enum STATES // Estados do jogador
{
	IDLE,
	MOVING,
	MENU,
	ATTACKING,
	HIT,
	DEAD
}
arquivo_dados = "jogador_dados.json"; //Variável que guarda o nome do ficheiro para armazenamento dos dados do jogador

state = STATES.IDLE //Atribuir o estado IDLE à variável que guarda os estados do jogador

inmenu = false //Definição da variável utilizada para verificar se o jogador está no menu

//true = direita e false = esquerda
last_dir = 1 //variável que armazena a ultima direção para a qual o jogador olhou

//-----------------Dialogo-------------------\\
text_id = "1ª Conv"
