grv = 0.5
velx = 0
vely = 0
slimevel = 5;
salto = -35;
nochao = false
ativardialogo = true
_mapats = layer_tilemap_get_id("Tiles_2")
trocavel = false
ataque = 0
direcao = 0
global.gamepaused = false
facing = 0
global.slime = 0

sprite_idle = spr_slimenormal
sprite_ataque = spr_slimenormal_ataque_direita
sprite_morto = spr_slimenormal_morto
sprite_moving =	spr_slimenormal_direita

enum STATES
{
	IDLE,
	MOVING,
	MENU,
	CLIMBING,
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