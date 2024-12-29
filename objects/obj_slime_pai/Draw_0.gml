draw_self(); // Desenhar o objeto

draw_set_color(c_red); // Definir a cor de desenho como vermelho
if(keyboard_check(ord("G"))) // Se se precionar a tecla G desenha-se um retangulo para verificações de colisões e sprites
draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, false);

draw_text(x,y - 80,global.slime) // Escrever o personagem atual

draw_text(x,y-50,global.vida) // Escrever a vida do obj_slime_pai