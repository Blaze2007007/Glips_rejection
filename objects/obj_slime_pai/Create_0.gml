grv = 0.5
velx = 0
vely = 0
slimevel = 5;
salto = -35;
nochao = false
ativardialogo = true
target_delta = 1/60
trocavel = false
ataque = 0
direcao = 0
global.gamepaused = false
facing = 0

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
//true = direita e false = esquerda
last_dir = false
dano = 5
