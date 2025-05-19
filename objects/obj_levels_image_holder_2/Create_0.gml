arquivo = working_directory + "jogador_dados.json"
file = file_text_open_read(arquivo); // Abre o ficheiro para leitura do mesmo
dados_json = file_text_read_string(file); // Lê e armazena os dados do ficheiro aberto previamente

aumentar = false

if(!global.player_data.niv3)
ativa = false
else
ativa = true

niv3 = global.player_data.niv3