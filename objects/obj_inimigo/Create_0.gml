grv = 0.5
movex = 0
vely = 0
dis_from_player = 0
my_dir = 0
state = ENEMYSTATES.IDLE
pode_atacar = true
pode_mudar = true
timer = 180
opcao = 0
alarm[0] = 90
alarm[1] = 90

enum ENEMYSTATES
{
	IDLE,
	ALERT,
	ATTACKING,
	HIT,
	DEAD
}