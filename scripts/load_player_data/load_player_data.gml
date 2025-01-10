function load_player_data() 
{
    show_debug_message("Função load_player_data chamada");

    // Inicializa player_data com valores padrão, caso ainda não tenha sido inicializado
    if (!variable_global_exists("player_data"))
	{
        player_data = {
			nivel: rm_nivel1,
            vida: 3,
            pontos: 0,
            posicao:
			{
				_x: x,
				_y: y
			}, // Posição padrão com dois valores
            slime_atual: 0
        };
    }

    // Verifica se o arquivo existe
    if (file_exists("player_data.json")) 
	{
        var file = file_text_open_read("player_data.json");
        var json_string = file_text_read_string(file);
        file_text_close(file);

        var loaded_data = json_decode(json_string);

        // Verifica se a estrutura carregada é válida
        if (is_struct(loaded_data)) {
            if (!is_undefined(loaded_data.vida)) 
			{
                player_data.vida = real(loaded_data.vida);
            }
            if (!is_undefined(loaded_data.pontos)) 
			{
                player_data.pontos = real(loaded_data.pontos);
            }
            if (is_array(loaded_data.posicao) && array_length(loaded_data.posicao) == 2) 
			{
                player_data.posicao = loaded_data.posicao;
            } 
			else 
			{
                player_data.posicao = [0, 0];
            }
            if (!is_undefined(loaded_data.slime_atual)) 
			{
                player_data.slime_atual = real(loaded_data.slime_atual);
            }
        } 
		else 
		{
            show_debug_message("Erro: O arquivo JSON não contém uma estrutura válida.");
        }
    } 
	else 
	{
        // Se o arquivo não for encontrado, use valores padrão
        show_debug_message("Arquivo player_data.json não encontrado. Usando valores padrão.");
        player_data = {
			nivel: rm_nivel1,
            vida: 3,
            pontos: 0,
            posicao:
			{
				_x: x,
				_y: y
			}, // Posição padrão com dois valores
            slime_atual: 0
        };
    }

    // Depois de carregar ou inicializar, verifica se a estrutura está válida
    show_debug_message("player_data carregado: " + string(player_data));
}
