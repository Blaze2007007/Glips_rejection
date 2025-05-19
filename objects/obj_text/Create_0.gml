//low depth so the object shows on top of everything
depth = -999

//Textbox parameters
textbox_width = 544
textbox_height = 160
border = 20
line_space = 30
line_width =  textbox_width - border * 2
txtb_spr[0] = spr_caixa_de_dialogo_1
txtb_img = 0
txtb_img_speed = 6/60

//The text
page = 0
page_number = 0
text[0] = ""
text_length[0] = string_length(text[0])

char[0,0]= ""
char_x[0,0] = 0
char_y[0,0] = 0
draw_char = 0

global.text_speed = 1
setup = false
text_font = f_Text
//Options
option[0] = ""
option_link_id[0] = -1
option_pos = 0
option_number = 0

//addicional variables
text_x_offset[0] = 0
accept_key = keyboard_check_pressed(vk_space)

textbox_x = camera_get_view_x(view_camera[0])
textbox_y = camera_get_view_y(view_camera[0]) + 320

txtb_spr_w = sprite_get_width(txtb_spr[page])
txtb_spr_h = sprite_get_height(txtb_spr[page])

acabou_de_falar = false

//effects
scr_set_default_for_text()
last_free_space = 0
text_pause_timer = 0
text_pause_time = 20