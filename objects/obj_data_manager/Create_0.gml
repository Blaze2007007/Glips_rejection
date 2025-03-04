global.vida = 3 // Vida do jogador
global.pontos = 0 // Pontos do jogador
global.gamepaused = false // Variável utilizada para a verificação da pausa do jogo
global.slime = 0 // Determina qual o slime(personagem) a ser usado
global.troca = false
global.dead = false

arquivo_dados = "jogador_dados.json";

var _ficheiro = file_text_open_read(arquivo_dados)
var _temp_player_data = file_text_read_string(_ficheiro)

if(_temp_player_data == "")
{
	global.player_data = 
	{
		vida: int64(3),
		nivel: "rm_level1",
	    pontos: int64(0),
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
}
else
{
	global.player_data = _temp_player_data
}