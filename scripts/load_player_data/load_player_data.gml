function load_player_data(arquivo) 
{
	//Se o ficheiro existir crião-se duas variáveis temporarias para leitura do ficheiro
     if (file_exists(arquivo)) {
        var file = file_text_open_read(arquivo); // Abre o ficheiro para leitura do mesmo
        var dados_json = file_text_read_string(file); // Lê e armazena os dados do ficheiro aberto previamente
        file_text_close(file); // Feicha o ficheiro depois de o ler
		show_debug_message(dados_json) // Mostra uma mensagem com os dados recolhidos do ficheiro
        return json_parse(dados_json); // Retorna a struct carregada
    } 
	else // Se o ficheiro não existir mostra-se uma mensagem a avisar que o mesmo não foi encontrado 
	{
        show_message("Arquivo JSON não encontrado!");
        return null; // Retorna null se o arquivo não existir
    }
}