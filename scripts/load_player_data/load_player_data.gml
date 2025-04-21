function load_player_data(arquivo,mensagem) 
{
	//Se o ficheiro existir crião-se duas variáveis temporarias para leitura do ficheiro
     if (file_exists(arquivo)) {
        var filer = file_text_open_read(arquivo); // Abre o ficheiro para leitura do mesmo
        var dados_jsonr = file_text_read_string(filer); // Lê e armazena os dados do ficheiro aberto previamente
        file_text_close(filer); // Feicha o ficheiro depois de o ler
		if(mensagem)
		{
			show_debug_message(dados_jsonr) // Mostra uma mensagem com os dados recolhidos do ficheiro
		}
		if(dados_jsonr = "")
		{
			var dados_jsonw = json_stringify(Init_player_data())
			var filew = file_text_open_write(arquivo); // Cria uma variável para escrita no ficheiro
			file_text_write_string(filew, dados_jsonw); // Escreve no ficheiro os dados do utilizador
			file_text_close(filew);
			filer = file_text_open_read(arquivo); // Abre o ficheiro para leitura do mesmo
			dados_jsonr = file_text_read_string(filer); // Lê e armazena os dados do ficheiro aberto previamente
			file_text_close(filer);
			
		}
        return json_parse(dados_jsonr); // Retorna a struct carregada
    } 
	else // Se o ficheiro não existir mostra-se uma mensagem a avisar que o mesmo não foi encontrado 
	{
        show_message("Arquivo JSON não encontrado!");
        return null; // Retorna null se o arquivo não existir
    }
}