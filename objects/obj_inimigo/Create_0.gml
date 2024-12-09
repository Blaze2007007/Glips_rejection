grv = 0.5
movex = 0
vely = 0
dis_from_player = 0
my_dir = 0
state = ENEMYSTATES.IDLE
pode_mudar = true
opcao = 0
attacking = false

enum ENEMYSTATES
{
	IDLE,
	ALERT,
	ATTACKING,
	HIT,
	DEAD
}