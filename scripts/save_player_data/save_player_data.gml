function save_player_data(dados,ficheiro)
{
	var arquivo = working_directory + ficheiro // Cria um arquivo para armazenamento dos dados do utilizador
	if(file_exists(arquivo))
	{
		var dados_json = json_stringify(dados); // Cria uma variável que armazena os dados do utilizador
		var file = file_text_open_write(arquivo); // Cria uma variável para escrita no ficheiro
		file_text_write_string(file, dados_json); // Escreve no ficheiro os dados do utilizador
		file_text_close(file); // Fecha o ficheiro de armazenamento de dados do utilizador 
	}
	else
	{
		show_debug_message("não existe ficheiro")
	}
}