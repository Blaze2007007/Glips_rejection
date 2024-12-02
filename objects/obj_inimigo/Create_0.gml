grv = 0.5
movex = 0
vely = 0
dis_from_player = 0
my_dir = 0
state = ENEMYSTATES.IDLE
time_source1 = 0
time_source2 = 0
time_source3 = 0

enum ENEMYSTATES
{
	IDLE,
	ALERT,
	ATTACKING,
	HIT,
	DEAD
}