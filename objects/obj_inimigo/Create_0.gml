grv = 0.5
movex = 0
vely = 0
dis_from_player = 0
my_dir = 0
state = ENEMYSTATES.IDLE
pode_mudar = false
opcao = 0
count1 = 0
count2 = 0
pode_atacar = true

enum ENEMYSTATES
{
	IDLE,
	ALERT,
	ATTACKING,
	HIT,
	DEAD
}