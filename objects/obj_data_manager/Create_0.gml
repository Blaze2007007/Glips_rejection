global.vida = 3 // Vida do jogador
global.pontos = 0 // Pontos do jogador
global.gamepaused = false // Variável utilizada para a verificação da pausa do jogo
global.slime = 0 // Determina qual o slime(personagem) a ser usado
global.troca = false
global.dead = false
global.player_data = 0

arquivo_dados = "jogador_dados.json";

var _ficheiro = file_text_open_read(arquivo_dados)
temp_player_data = file_text_read_string(_ficheiro)

global.player_data = Init_player_data()