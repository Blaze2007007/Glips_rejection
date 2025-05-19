// Obtém o ID do tilemap da camada "Tiles_2" para uso nas colisões
var _mapats = layer_tilemap_get_id("Tiles_2");

// Inicializa variáveis de gravidade, velocidade vertical e movimento horizontal
grv = 2;
vely = 0;
movex = 0;

// Se o jogo estiver pausado, cancela o movimento e sai do script
if (global.gamepaused) {
    movex = 0;
    return;
}

// Estrutura switch para controlar os comportamentos com base no estado do inimigo
switch (state) {

    case ENEMYSTATES.IDLE:
        // Estado de espera/repouso do inimigo
        count1++; // Contador para alterar o comportamento com o tempo

        // Controla se pode mudar de direção/ação
        if (pode_mudar) {
            pode_mudar = false;
            opcao = round(irandom(2)); // Escolhe uma opção aleatória: 0, 1 ou 2
        } else if (count1 == 120) {
            count1 = 0;
            pode_mudar = true;
        }

        // Sub-switch para tratar as diferentes opções de comportamento
        switch (opcao) {
            case 0: // Anda para a esquerda
                if (enemy_id == 1) {
                    sprite_index = spr_boomba_direita;
                    image_xscale = -1.5;
                }
                movex = -2;
                break;
            case 1: // Anda para a direita
                if (enemy_id == 1) {
                    sprite_index = spr_boomba_direita;
                    image_xscale = 1.5;
                }
                movex = 2;
                break;
            case 2: // Fica parado (idle)
                if (enemy_id == 1 && movex == 0) {
                    sprite_index = sprite_ini_idle;
                }
                movex = 0;
                break;
        }

        // Aplica movimento horizontal
        x += movex;

        // Altera o sprite se não for inimigo do tipo 1
        if (enemy_id != 1) {
            sprite_index = sprite_ini_moving;
        }

        // Verifica se está no chão para aplicar gravidade
        if (place_meeting(x, y + 2, _mapats)) {
            vely = 0;
            if (collision_rectangle(bbox_left - 10, y + 10, bbox_right + 10, y, _mapats, false, false)) {
                vely = -50 * grv; // Salta
            }
        } else {
            vely += 1 + grv; // Cai
        }

        // Aplica movimento vertical
        y += vely;

        // Corrige colisões com o chão
        correcao_de_colisoes(_mapats);

        // Muda para estado ALERT se o jogador estiver próximo
        if (collision_circle(x, y, 224, obj_slime_pai, false, false)) {
            state = ENEMYSTATES.ALERT;
        }
        break;

    case ENEMYSTATES.ALERT:
        // Estado de alerta, o inimigo persegue o jogador
        if (!(alarm_get(0) > 0)) { // Verifica se o alarme 0 está ativo
            if (!collision_circle(x, y, 224, obj_slime_pai, false, false)) {
                state = ENEMYSTATES.IDLE; // Perde o jogador de vista
                break;
            }

            // Direção em que deve mover para se aproximar do jogador
            var dist = point_direction(x, y, obj_slime_pai.x, obj_slime_pai.y);
            if (dist > 90) {
                my_dir = point_direction(x, y, obj_slime_pai.x + 50, obj_slime_pai.y);
                facing = 1;
                if (enemy_id == 1) image_xscale = -1.5;
            } else {
                my_dir = point_direction(x, y, obj_slime_pai.x - 50, obj_slime_pai.y);
                facing = -1;
                if (enemy_id == 1) image_xscale = 1.5;
            }

            // Movimento em direção ao jogador
            movex = lengthdir_x(3, my_dir);
            x += movex;

            // Física vertical e saltos
            if (place_meeting(x, y + 2, _mapats)) {
                vely = 0;
                if (collision_rectangle(bbox_left - 20, y + 10, bbox_right + 20, y, _mapats, false, false)) {
                    vely = -50 * grv;
                }
            } else {
                vely += grv;
            }

            y += 1 + vely;
            correcao_de_colisoes(_mapats);
            sprite_index = sprite_ini_moving;

            // Se estiver muito próximo do jogador, entra em modo ataque
            if (collision_circle(x, y, 32, obj_slime_pai, false, false)) {
                state = ENEMYSTATES.ATTACKING;
                if (enemy_id == 1) alarm_set(0, 90);
                attaking = true;
            } else {
                attaking = false;
            }

            // Se o jogador pressionar "E" próximo ao inimigo, entra em estado de HIT
            if (collision_circle(x, y, 64, obj_slime_pai, false, false) && keyboard_check_pressed(ord("E"))) {
                state = ENEMYSTATES.HIT;
            }
        } else if (enemy_id == 1) {
            // Inimigo em "tempo de espera" entre ataques
            movex = 0;
            sprite_index = sprite_ini_ataque;
        }
        break;

    case ENEMYSTATES.ATTACKING:
        // Estado de ataque ativo
        count2++;

        if (count2 == 90) {
            count2 = 0;
            // Verifica se o inimigo ainda pode atacar
            attaking = collision_circle(x, y, 32, obj_slime_pai, false, false);
            pode_atacar = !global.dead;
        }

        if (attaking && pode_atacar && global.vida > 0 && !global.dead) {
            image_index = 0;
            sprite_index = sprite_ini_ataque;
            image_speed = 1;

            // Animação de ataque
            if (image_index < image_number - 1) {
                sprite_index = sprite_ini_ataque;
            } else if (!attaking) {
                sprite_index = sprite_ini_idle;
            }

            // Causa dano ao jogador
            if (!global.gamepaused) {
                global.vida -= enemy_damage;
            }

            count2 = 0;
            pode_atacar = false;
        } else {
            sprite_index = sprite_ini_idle;
            state = ENEMYSTATES.IDLE;
        }

        // Pode ser atingido pelo jogador durante o ataque
        if (collision_circle(x, y, 64, obj_slime_pai, false, false) && keyboard_check_pressed(ord("E"))) {
            state = ENEMYSTATES.HIT;
        }

        // Se o jogador fugir, volta ao modo ALERT
        if (!place_meeting(x, y, obj_slime_pai)) {
            state = ENEMYSTATES.ALERT;
        }

        sprite_index = sprite_ini_ataque;
        break;

    case ENEMYSTATES.HIT:
        // Estado em que o inimigo está a ser atacado
        if (!collision_circle(x, y, 64, obj_slime_pai, false, false)) {
            state = ENEMYSTATES.ALERT;
        }

        if (collision_circle(x, y, 64, obj_slime_pai, false, false) && keyboard_check_pressed(ord("E")) && !global.dead) {
            global.vida_inimigo--; // Diminui a vida do inimigo
        }

        if (global.vida_inimigo == 0) {
            state = ENEMYSTATES.DEAD;
        }
        break;

    case ENEMYSTATES.DEAD:
        // Estado de morte
        if (global.vida_inimigo == 0) {
            // Marca inimigo como morto, dependendo do ID
            if (ini_id == 1) global.ini1_morto = true;
            if (ini_id == 2) global.ini2_morto = true;
            if (ini_id == 3) global.ini3_morto = true;

            instance_destroy(self); // Destroi o inimigo

            // Cria objetos de drop ao morrer
            for (var _i = 0; _i < enemy_drops; _i++) {
                var _random_pos = irandom(100);
                var _esc_dir = choose(0, 1);
                if (_esc_dir == 0) _random_pos = sign(_random_pos);
                instance_create_depth(x + _random_pos, y, depth, obj_drop);
            }
        } else {
            state = ENEMYSTATES.IDLE;
        }
        break;
}
