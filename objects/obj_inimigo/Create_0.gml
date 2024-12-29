grv = 0.5 // Gravidade
movex = 0 // Movimento horizontal
vely = 0  // Velocidade vertical
dis_from_player = 0 // Distancia do jogador (usada para verificações)
my_dir = 0 // Direção do inimigo
state = ENEMYSTATES.IDLE // Definir a variável "state" como um dos estados do enumerador "ENEMYSTATES"
pode_mudar = false // Definir a variável "pode_mudar" como false (usada para definir se o inimigo pode ou não mudar a sua direção)
opcao = 0 // Opção(do programa) usada para definir a direção do inimigo  
count1 = 0 // 1º temporizador (usado para contar o tempo entre as mudanças de direção do inimigo)
count2 = 0 // 2º temporizador (usado para contar o tempo até ao proximo ataque do inimgo)
count3 = 0 // 3º temporizador (usado para contar o tempo até à morte do inimigo)
pode_atacar = true // Definir a variável "pode_atacar" como true (usada para definir se o inimigo pode ou não atacar o jogador, neste caso pode)
sprite_idle = spr_hollow_r // Definir o sprite "Idle" do inimigo
global.vida_inimigo = enemy_hp // Definir vida do inimigo para verificações nos ataques
facing = 0
dir = 0
global.count = 0

enum ENEMYSTATES // Definir o enumerador com todos os estados do inimigo
{
	IDLE,      // Mover numa direção aleatória ou ficar parado
	ALERT,     // Perseguir o jogador
	ATTACKING, // Atacar o jogador
	HIT,	   // Ser atacado pelo jogador
	DEAD	   // Morrer
}