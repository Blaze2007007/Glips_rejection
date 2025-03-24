// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Init_player_data()
{
	return 
	{
		vida: int64(3),
	    pontos: int64(0),
	    posicao:
			{
	            _x: int64(200),
	            _y: int64(420)
	        },
	    slime: int64(0),
		niv1: false,
		niv2: false,
		niv3: false
	}
}