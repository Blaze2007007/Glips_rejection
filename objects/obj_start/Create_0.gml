arquivo = working_directory + "jogador_dados.json"
file = file_text_open_read(arquivo); // Abre o ficheiro para leitura do mesmo
dados_json = file_text_read_string(file); // Lê e armazena os dados do ficheiro aberto previamente

global.opcao_escolhida = 0
aumentar = false
image_xscale = 1.5
image_yscale = 1.5

if(dados_json = "")
global.started = false