global.vida = 3 // Vida do jogador
global.pontos = 0 // Pontos do jogador
global.gamepaused = false // Variável utilizada para a verificação da pausa do jogo
global.slime = 0 // Determina qual o slime(personagem) a ser usado
global.troca = false // Boolean para verificar se já se podem trocar os personagens
global.dead = false // Boolean para verificação da morte
global.player_data = 0 // Definição da variável global para armazenamento dos dados do jogador

arquivo_dados = "jogador_dados.json"; // criação de variável com o nome do arquivo que armazena os dados do jogador

ficheiro = file_text_open_read(arquivo_dados) // definição de variável para abertura do ficheiro com os dados do jogador para asseguir se ler
player_data = file_text_read_string(ficheiro) // definição de variável que lê o ficheiro aberto previamente e guarda os dados

global.player_data = Init_player_data() // Atribuição de valores iniciais do jogador

count = 0 // definição de temporizador