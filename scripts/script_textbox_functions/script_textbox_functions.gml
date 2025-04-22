/// @param _text
function script_text(_text)
{
	// esta função serve para facilitar o processo de criação de páginas para os dialogos
	text[page_number] = _text // o texto(text) a ser escrito na página(page_number) é a variável _text
	page_number ++ // depois de se escrever o texto na página passa-se para a próxima página
}


/// @param _option
/// @param link_id
function script_option(_option,link_id)
{
	//esta função serve para facilitar o processo de criação de opções de dialogo
	//exemplo de conversa->Paulo-"Gostas de gatos?"
	option[option_number] = _option //opção/texto escolhida/o(ex:chavier-"SIM!")
	option_link_id[option_number] = link_id //link/dialogo onde essa opção te leva(ex:Paulo-"TAMBÉM EU!")
	option_number ++ // incrementar a variável option_number para guardar mais opções
}

/// @param _text_id
function create_textbox(_text_id)
{
	// esta função serve para criar caixa de texto para dialogo
	with(instance_create_depth(x,y,depth,obj_text))//ao criar a caixa de texto (obj_text)
		{
			script_game_text(_text_id)//adiciona a essa caixa o seu respetivo texto
		}
}