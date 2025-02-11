global.vida = 3 // Vida do jogador
global.pontos = 0 // Pontos do jogador
global.gamepaused = false // Variável utilizada para a verificação da pausa do jogo
global.slime = 0 // Determina qual o slime(personagem) a ser usado
global.player_data = 
{
	vida: int64(0),
	nivel: "rm_level1",
    pontos_atuais: int64(0),
    posicao: {
            _x: int64(200),
            _y: int64(420)
        },
    slime: int64(0),
	numero_niveis: int64(0),
	niv1: false,
	niv2: false,
	niv3: false,
}

arquivo_dados = "jogador_dados.json";