if(instance_exists(obj_slime_pai))
{
	global.player_data = load_player_data(arquivo_dados)
	global.player_data.vida = int64(global.vida)
	global.player_data.pontos = int64(global.pontos)
	global.player_data.posicao._x = int64(obj_slime_pai.x)
	global.player_data.posicao._y = int64(obj_slime_pai.y)
	global.player_data.slime_atual = int64(global.slime)
}