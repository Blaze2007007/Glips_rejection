Nineslice_stretched(spr_caixa_de_dialogo,x1,y1,x2,y2,background)
draw_set_font(f_Text)
draw_set_halign(fa_center)
draw_set_valign(fa_top)
draw_set_color(c_black)


var _print = string_copy(default_message,1,text_progress)

draw_text((x1+x2)/2,y2+ 8, _print)
draw_set_color(c_white)
draw_text((x1+x2)/2,y2+ 7, _print)
