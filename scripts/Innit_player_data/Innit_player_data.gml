function Innit_player_data()
{
	show_debug_message("innit")
    return {
        nivel: "rm_nivel1",
        vida: int64(3),
        pontos: int64(0),
        posicao: {
            _x: int64(194),
            _y: int64(446)
        },
		slime_atual: int64(0),
		numero_niveis: int64(0)
    };
}