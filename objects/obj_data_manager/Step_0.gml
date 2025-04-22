if(instance_exists(obj_slime_pai)) // se o objeto obj_slime_pai existir define as variáveis do jogador e armazena-as num ficheiro
{
	// Atribuição de valores a armazenar de acordo com os valores do jogador
 	global.player_data.vida = int64(global.vida)
 	global.player_data.pontos = int64(global.pontos)
 	global.player_data.posicao._x = int64(obj_slime_pai.x)
	global.player_data.posicao._y = int64(obj_slime_pai.y)
	global.player_data.slime = int64(global.slime)
	global.player_data.ini1_morto = global.ini1_morto
	global.player_data.ini2_morto = global.ini2_morto
	global.player_data.ini3_morto = global.ini3_morto
	save_player_data(global.player_data,arquivo_dados) //Armazenar os valores anteriores no ficheiro respetivo
}
count ++ // incremento de temporizador
if(count == 180) // se o temporizador contar 3 segundos(180 frames) carregam-se os dados do jogador e o temporizador reinicia
{
	mensagem = true //Definir que será mostrada uma mensagem dos dados 
	count = 0 // reinicia a contagem
}
else // caso contrário não se mostrará a mensagem com os dados
{
	mensagem = false
}
global.player_data = load_player_data(arquivo_dados,mensagem) // Carrega os dados do ficheiro para a variável global player_data e de acordo com o código anterior mostra ou não os dados numa mensagem
