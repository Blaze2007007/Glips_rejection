grv = 0.5
velx = 0
vely = 0
slimevel = 5;
salto = -35;
nochao = false
ativardialogo = true
target_delta = 1/60
trocavel = false
inmenu = false

enum STATES_2
{
	IDLE,
	MOVING,
	CLIMBING,
	MENU
}

state = STATES_2.IDLE

actual_delta = delta_time/1000000
delta_multiplier = actual_delta/target_delta

global.vida = 3
global.pontos = 0