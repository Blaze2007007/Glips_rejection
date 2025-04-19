// Função separada (Script) para corrigir colisões
function correcao_de_colisoes(colisao) {
    for (var _i = 0; _i < 1000; _i++) {
        if (!place_meeting(x + _i, y, colisao)) { x += _i; break; }
        if (!place_meeting(x - _i, y, colisao)) { x -= _i; break; }
        if (!place_meeting(x, y - _i, colisao)) { y -= _i; break; }
        if (!place_meeting(x, y + _i, colisao)) { y += _i; break; }
        if (!place_meeting(x + _i, y - _i, colisao)) { x += _i; y -= _i; break; }
        if (!place_meeting(x - _i, y - _i, colisao)) { x -= _i; y -= _i; break; }
        if (!place_meeting(x + _i, y + _i, colisao)) { x += _i; y += _i; break; }
        if (!place_meeting(x - _i, y + _i, colisao)) { x -= _i; y += _i; break; }
    }
}