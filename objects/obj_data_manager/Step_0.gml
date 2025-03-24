if(instance_exists(obj_slime_pai))
{
 	global.player_data.vida = int64(global.vida)
 	global.player_data.pontos = int64(global.pontos)
 	global.player_data.posicao._x = int64(obj_slime_pai.x)
	global.player_data.posicao._y = int64(obj_slime_pai.y)
	global.player_data.slime = int64(global.slime)
	save_player_data(global.player_data,arquivo_dados)
}
load_player_data(arquivo_dados)