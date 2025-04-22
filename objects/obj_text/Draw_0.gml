accept_key = keyboard_check_pressed(vk_space)

textbox_x = camera_get_view_x(view_camera[0])
textbox_y = camera_get_view_y(view_camera[0]) + 320

//-----------------------------------------setup------------------------------------------------\\
if(!setup)
{
	setup = true
	draw_set_font(f_Text)
	draw_set_valign(fa_top)
	draw_set_halign(fa_left)
	
	//loop through the pages
	for(var p = 0; p < page_number; p++)
	{
		//find how many characters are on each page and store that number in the "text_length" array
		text_length[p] = string_length(text[p])
		
		//get the x position for the textbox
		text_x_offset[p] = 200
	}
}

//---------------------------------------typing the text----------------------------------------\\

if(draw_char < text_length[page])
{
	draw_char += global.text_speed
	draw_char = clamp(draw_char,0,text_length[page])
}

//---------------------------------------flip through pages-------------------------------------\\

if(accept_key)
{
	//if the typing is done we can go to the next page
	if(draw_char == text_length[page] && page == page_number - 1)
	{
		//next page
		if(page < page_number - 1)
		{
			page++
			draw_char = 0
		}
		//destroy textbox
		else
		{
			// link text for options
			if(option_number > 0)
			{
				create_textbox(option_link_id[option_pos])
			}
			
			instance_destroy()
		}
	}
	//if not done typing
	else
	{
		draw_char = text_length[page]
	}
}


//-------------------------------------draw the textbox-----------------------------------------\\

var txtb_x = textbox_x + text_x_offset[page]
var txtb_y = textbox_y
txtb_spr_w = sprite_get_width(txtb_spr)
txtb_spr_h = sprite_get_height(txtb_spr)

//back of the textbox
draw_sprite_ext(txtb_spr,0,txtb_x,txtb_y,textbox_width/txtb_spr_w,textbox_height/txtb_spr_h,0,c_white,1)


//-------------------------------------------options--------------------------------------------\\

if(draw_char == text_length[page])
{
	//option selection
	option_pos += keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up)
	option_pos = clamp(option_pos,0,option_number - 1)
	
	
	//draw the options
	var op_space = 45
	var op_border = 10
	for(var op = 0; op < option_number; op ++)
	{
		//draw the option boxes
		var _o_w = string_width(option[op]) + op_border * 2
		
		//-------------|sprite|sub_i|--| x |--------------------------| y |--------------------------|xscale|------------|yscale|---|rotate|color|alpha|
		//-----------------|-----|-------|----|-------------------------|-------------------------------|-------------------|------------|----|----|----\\
		//-----------------v-----v-------v----v-------------------------v-------------------------------v-------------------v------------v----v----v----\\
		draw_sprite_ext(txtb_spr,0,txtb_x + 16,txtb_y - op_space * option_number + op_space*op,_o_w/txtb_spr_w,(op_space)/txtb_spr_h,0,c_white,1)
		
		//the arrow
		if(option_pos == op)
		{
			draw_sprite(spr_esc_op,0,txtb_x, txtb_y - op_space * option_number + op_space*op+14)
		}
		
		//the option text
		draw_text(txtb_x+16 + op_border, txtb_y - op_space*option_number + op_space*op + 4,option[op])
	}
}

//draw the text
var _drawtext = string_copy(text[page],1,draw_char)
draw_text_ext(txtb_x + border,txtb_y + border,_drawtext,line_space,line_width)

