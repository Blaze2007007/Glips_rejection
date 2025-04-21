arquivo_dados = "jogador_dados.json"; // criação de variável com o nome do arquivo que armazena os dados do jogador

global.player_data = load_player_data(arquivo_dados,0)
global.vida = global.player_data.vida // Determina a vida do jogador
global.pontos = global.player_data.pontos // Determina os pontos do jogador
global.gamepaused = false // Variável utilizada para a verificação da pausa do jogo
global.slime = global.player_data.slime // Determina qual o slime(personagem) a ser usado
global.troca = false // Boolean para verificar se já se podem trocar os personagens
global.dead = false // Boolean para verificação da morte

mensagem = true

ficheiro = file_text_open_read(arquivo_dados) // definição de variável para abertura do ficheiro com os dados do jogador para asseguir se ler
player_data = file_text_read_string(ficheiro) // definição de variável que lê o ficheiro aberto previamente e guarda os dados

if(!is_struct(global.player_data))
global.player_data = Init_player_data() // Atribuição de valores iniciais do jogador

count = 0 // definição de temporizador