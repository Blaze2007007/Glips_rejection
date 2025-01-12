function Innit_player_data()
{
	show_debug_message("innit")
    return {
        nivel: "rm_inicio",
        vida: int64(3),
        pontos: int64(0),
        posicao: {
            _x: int64(x),
            _y: int64(y)
        },
		slime_atual: int64(0),
		numero_niveis: int64(0)
    };
}