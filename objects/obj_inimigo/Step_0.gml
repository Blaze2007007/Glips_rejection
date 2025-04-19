var _mapats = layer_tilemap_get_id("Tiles_2"); // Definir colisões do mapa

grv = 2;
vely = 0;
movex = 0;

if (global.gamepaused) {
    movex = 0;
    return;
}

switch (state) {
    case ENEMYSTATES.IDLE:
        // Estado IDLE
        count1++;

        if (pode_mudar) {
            pode_mudar = false;
            opcao = round(irandom(2));
        } else if (count1 == 120) {
            count1 = 0;
            pode_mudar = true;
        }

        switch (opcao) {
            case 0:
                movex = -2;
                break;
            case 1:
                movex = 2;
                break;
            case 2:
                movex = 0;
                break;
        }

        x += movex;
        sprite_index = sprite_ini_moving;

        if (place_meeting(x, y + 2, _mapats)) {
            vely = 0;
            if (collision_rectangle(bbox_left - 10, y + 10, bbox_right + 10, y, _mapats, false, false)) {
                vely = -50 * grv;
            }
        } else {
            vely += 1 + grv;
        }

        y += vely;
        correcao_de_colisoes(_mapats);

        if (collision_circle(x, y, 224, obj_slime_pai, false, false)) {
            state = ENEMYSTATES.ALERT;
        }
        break;

    case ENEMYSTATES.ALERT:
        // Estado ALERT
        if (!collision_circle(x, y, 224, obj_slime_pai, false, false)) {
            state = ENEMYSTATES.IDLE;
            break;
        }

        var dist = point_direction(x, y, obj_slime_pai.x, obj_slime_pai.y);
        if (dist > 90) {
            my_dir = point_direction(x, y, obj_slime_pai.x + 50, obj_slime_pai.y);
            facing = 1;
        } else {
            my_dir = point_direction(x, y, obj_slime_pai.x - 50, obj_slime_pai.y);
            facing = -1;
        }

        movex = lengthdir_x(3, my_dir);
        x += movex;

        if (place_meeting(x, y + 2, _mapats)) {
            vely = 0;
            if (collision_rectangle(bbox_left - 20, y + 10, bbox_right + 20, y, _mapats, false, false)) {
                vely = -50 * grv;
            }
        } else {
            vely += 1 + grv;
        }

        y += vely;
        correcao_de_colisoes(_mapats);
        sprite_index = sprite_ini_moving;

        if (collision_circle(x, y, 32, obj_slime_pai, false, false)) {
            state = ENEMYSTATES.ATTACKING;
            attaking = true;
        } else {
            attaking = false;
        }

        if (collision_circle(x, y, 64, obj_slime_pai, false, false) && keyboard_check_pressed(ord("E"))) {
            state = ENEMYSTATES.HIT;
        }
        break;

    case ENEMYSTATES.ATTACKING:
        // Estado ATTACKING
        count2++;

        if (count2 == 180) {
            count2 = 0;
            pode_atacar = true;
        }

        if (attaking && pode_atacar && global.vida > 0) {
            sprite_index = sprite_ini_ataque;
            image_speed = 1;

            if (image_index < image_number - 1) {
                sprite_index = sprite_ini_ataque;
            } else {
                sprite_index = sprite_ini_idle;
                attaking = false;
            }

            if (!global.gamepaused) {
                global.vida -= enemy_damage;
                attaking = false;
            }

            pode_atacar = false;
            count2 = 0;
        } else {
            sprite_index = sprite_ini_idle;
        }

        if (collision_circle(x, y, 64, obj_slime_pai, false, false) && keyboard_check_pressed(ord("E"))) {
            state = ENEMYSTATES.HIT;
        }

        if (!place_meeting(x, y, obj_slime_pai)) {
            state = ENEMYSTATES.ALERT;
        }

        sprite_index = sprite_ini_ataque;
        break;

    case ENEMYSTATES.HIT:
        // Estado HIT
        if (!collision_circle(x, y, 64, obj_slime_pai, false, false)) {
            state = ENEMYSTATES.ALERT;
        }

        if (collision_circle(x, y, 64, obj_slime_pai, false, false) && keyboard_check_pressed(ord("E")) && !global.dead) {
            global.vida_inimigo--;
        }

        if (global.vida_inimigo == 0) {
            state = ENEMYSTATES.DEAD;
        }
        break;

    case ENEMYSTATES.DEAD:
        // Estado DEAD
        if (global.vida_inimigo == 0) {
            if (enemy_id == 0) {
                instance_destroy(self);
                for (var _i = 0; _i < enemy_drops; _i++) {
                    var _random_pos = irandom(100);
                    var _esc_dir = choose(0, 1);
                    if (_esc_dir == 0) {
                        _random_pos = sign(_random_pos);
                    }
                    instance_create_depth(x + _random_pos, y, depth, obj_drop);
                }
            } else if (enemy_id == 1) {
                instance_destroy(self);
                for (var _i = 0; _i < enemy_drops; _i++) {
                    var _random_pos = irandom(100);
                    var _esc_dir = choose(0, 1);
                    if (_esc_dir == 0) {
                        _random_pos = sign(_random_pos);
                    }
                    instance_create_depth(x + _random_pos, y - 60, depth, obj_drop);
                }
            }
        } else {
            state = ENEMYSTATES.IDLE;
        }
        break;
}
