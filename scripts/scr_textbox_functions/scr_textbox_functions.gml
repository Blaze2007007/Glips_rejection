function scr_set_default_for_text()
{
	line_break_pos[0,page_number] = 999
	line_break_num[page_number] = 0
	line_break_offset[page_number] = 0
	
	txtb_spr[page_number] = spr_caixa_de_dialogo_1
	speaker_sprite[page_number] = noone
	speaker_side[page_number] = 1
}





/// @param _text
/// @param [character]
/// @param [side]
function scr_text(_text)
{
	scr_set_default_for_text()
	// esta função serve para facilitar o processo de criação de páginas para os dialogos
	text[page_number] = _text // o texto(text) a ser escrito na página(page_number) é a variável _text
	
	//get character info
	if(argument_count > 1)
	{
		switch(argument[1])
		{
			//slime normal
			case "slimenormal-afirmacao":
			speaker_sprite[page_number] = spr_normal_afirmacao
			txtb_spr[page_number] = spr_caixa_de_dialogo_1
			break
			
			case "slimenormal-triste":
			speaker_sprite[page_number] = spr_normal_triste
			txtb_spr[page_number] = spr_caixa_de_dialogo_1
			break
			
			//slime pegajoso
			case "slimepegajoso-afirmacao":
			speaker_sprite[page_number] = spr_pegajoso_afirmacao
			txtb_spr[page_number] = spr_caixa_de_dialogo_2
			break
			
			case "slimepegajoso-triste":
			speaker_sprite[page_number] = spr_pegajoso_triste
			txtb_spr[page_number] = spr_caixa_de_dialogo_2
			break
		}
		
		//side the character is on
		if(argument_count > 2)
		{
			speaker_side[page_number] = argument[2]
		}
	}
	
	
	
	page_number ++ // depois de se escrever o texto na página passa-se para a próxima página
}






/// @param _option
/// @param link_id
function scr_option(_option,link_id)
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
			scr_game_text(_text_id)//adiciona a essa caixa o seu respetivo texto
		}
}