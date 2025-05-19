function load_player_data(arquivo, mensagem)
{
    // Se o ficheiro existir, tentamos ler os dados
    if (file_exists(arquivo)) 
    {
        var filer = file_text_open_read(arquivo);
        var dados_jsonr = file_text_read_string(filer);
        file_text_close(filer);

        if (mensagem)
        {
            show_debug_message(dados_jsonr);
        }

        // Se o ficheiro estiver vazio, cria-se conteúdo novo
        if (dados_jsonr == "")
        {
            var dados_jsonw = json_stringify(Init_player_data());
            var filew = file_text_open_write(arquivo);
            file_text_write_string(filew, dados_jsonw);
            file_text_close(filew);

            // Reabrir para leitura dos dados criados
            filer = file_text_open_read(arquivo);
            dados_jsonr = file_text_read_string(filer);
            file_text_close(filer);
        }

        return json_parse(dados_jsonr);
    } 
    else 
    {
        // Se o ficheiro não existir, criamos novo com dados padrão
        var dados_iniciais = json_stringify(Init_player_data());
        var filew = file_text_open_write(arquivo);
        file_text_write_string(filew, dados_iniciais);
        file_text_close(filew);

        return json_parse(dados_iniciais);
    }
}
