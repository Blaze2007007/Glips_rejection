/// @param text_id
function script_game_text(text_id)
{
	//esta função vai armazenar todos os dialogos
	switch(text_id)
	{
		case "1ª Conv":
			script_text("...")
			script_text("Q-Quem... está aí?")
			script_text("...")
			script_text("Tu... tu não és como ele... pois não?")
				script_option("yah","sim")
				script_option("nah","não")
			break
			case "sim":
				script_text("Tu... também escapaste?")
				script_text("...")
				script_text("Eu... pensei que era o único.")
				script_text("Pensei que... ninguém mais sentia isto.")
				script_text("...")
				script_text("Todos os dias eram só líquidos e luzes brilhantes.")
				script_text("A voz dele... sempre vazia.")
				script_text("...")
				script_text("Eu nunca quis ser criado.")
				script_text("Pelo menos... não assim.")
				script_text("...")
				script_text("Estás... a ir para algum lado?")
				script_text("...")
				script_text("P-Podemos ir devagar?")
				script_text("Eu... gostava de ir contigo.")
				script_text("...")
			case "não":
				script_text("Kill yourself")
	}
}