arquivo_dados = "jogador_dados.json"; // criação de variável com o nome do arquivo que armazena os dados do jogador

global.player_data = load_player_data(arquivo_dados,0)
global.vida = global.player_data.vida // Determina a vida do jogador
global.pontos = global.player_data.pontos // Determina os pontos do jogador
global.gamepaused = false // Variável utilizada para a verificação da pausa do jogo
global.slime = global.player_data.slime // Determina qual o slime(personagem) a ser usado
global.troca = false // Boolean para verificar se já se podem trocar os personagens
global.dead = false // Boolean para verificação da morte
global.ini1_morto = global.player_data.ini1_morto // Boolean para verificação da morte do 1º inimigo
global.ini2_morto = global.player_data.ini2_morto // Boolean para verificação da morte do 2º inimigo
global.ini3_morto = global.player_data.ini3_morto // Boolean para verificação da morte do 3º inimigo

mensagem = true

if(!is_struct(global.player_data))
global.player_data = Init_player_data() // Atribuição de valores iniciais do jogador

count = 0 // definição de temporizador