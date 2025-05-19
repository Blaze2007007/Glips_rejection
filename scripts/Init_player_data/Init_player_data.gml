function Init_player_data()
{
	//Esta função tem os valores iniciais do jogador
	return 
	{ // começa com:
		vida: int64(3), // 3 corações de vida
	    pontos: int64(0), // 0 pontos
	    posicao:
			{
	            _x: int64(200), // x inicial
	            _y: int64(420) // y inicial
	        },
	    slime: int64(0), // slime 0 = primeiro slime/slime principal
		niv1: false, //variável boolean que server para verificar se o jogador já passou o primeiro nivel
		niv2: false, //variável boolean que server para verificar se o jogador já passou o segundo nivel
		niv3: false, //variável boolean que server para verificar se o jogador já passou o terceiro nivel
		ini1_morto: false, //variável boolean que server para verificar se o 1º inimigo já morreu
		ini2_morto: false, //variável boolean que server para verificar se o 2º inimigo já morreu
		ini3_morto: false, //variável boolean que server para verificar se o 3º inimigo já morreu
		conv_1: false //variável boolean que server para verificar se a 1ª conversa já acabou
	}
}