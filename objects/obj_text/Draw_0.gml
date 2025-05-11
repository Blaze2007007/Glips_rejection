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
		
		//Character on the left 
		text_x_offset[p] = 224
		portrait_x_offset[p] = 32
		
		//Character on the right
		if(speaker_side[p]  == -1)
		{
			text_x_offset[p] = 32
			portrait_x_offset[p] = 608
		}
		//No character(center the textbox)
		if(speaker_sprite[p] == noone)
		{
			text_x_offset[p] = 128
		}
		
		
		//setting individual characters and finding where the lines of text should break
		for(var c = 0; c < text_length[p];c++)
		{
			var _char_pos = c+1;
			
			//store individual characters in the "char" array
			char[c,p] = string_char_at(text[p],_char_pos)
			
			//get current width of the line
			var txt_up_to_char = string_copy(text[p],1,_char_pos)
			var _current_txt_w = string_width(txt_up_to_char) - string_width(char[c,p])
			
			//get the last free space
			if(char[c,p] == " "){	last_free_space = _char_pos + 1}
			
			//get the line breaks
			if(_current_txt_w - line_break_offset[p] > line_width)
			{
				line_break_pos[ line_break_num[p] , p] = last_free_space
				line_break_num[p]++
				var _txt_up_to_space = string_copy(text[p],1,last_free_space)
				var _last_free_space_string = string_char_at(text[p],last_free_space)
				line_break_offset[p] = string_width(_txt_up_to_space) - string_width(_last_free_space_string)
			}

		}
		//getting each characters coordinates
		for(var c = 0; c < text_length[p];c++)
		{
			var _char_pos = c+1
			var _txt_x = textbox_x + text_x_offset[p] + border
			var _txt_y = textbox_y + border
			var txt_up_to_char = string_copy(text[p],1,_char_pos)
			var _current_txt_w = string_width(txt_up_to_char) - string_width(char[c,p])
			var _txt_line = 0
			
			//Compensate for string breaks
			for(var lb = 0; lb < line_break_num[p];lb++)
			{
				//if the current looping character is after a line break
				if(_char_pos >= line_break_pos[lb,p])
				{
					var _str_copy = string_copy(text[p],line_break_pos[lb,p],_char_pos-line_break_pos[lb,p])
					_current_txt_w = string_width(_str_copy)
					
					//record the "line" this character should be in
					_txt_line = lb + 1
				}
			}
			
			//Add to the x and y coordinate based on the new info
			char_x[c,p] = _txt_x + _current_txt_w + 100
			char_y[c,p] = _txt_y + _txt_line*line_space
			
		}
		
	}
}

//---------------------------------------typing the text----------------------------------------\\
if(text_pause_timer <= 0)
{
	if(draw_char < text_length[page])
	{
		draw_char += global.text_speed
		draw_char = clamp(draw_char,0,text_length[page])
		var _check_char = string_char_at(text[page],draw_char)
		if(_check_char == "." or _check_char == "?")
		{
			text_pause_timer = text_pause_time
		}
	}
}
else
{
	text_pause_timer--
}

//---------------------------------------flip through pages-------------------------------------\\

if(accept_key)
{
	//if the typing is done we can go to the next page
	if(draw_char == text_length[page])
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
	if(page == page_number - 1)
	{
		instance_destroy()
	}
}


//-------------------------------------draw the textbox-----------------------------------------\\

var txtb_x = textbox_x + text_x_offset[page]
var txtb_y = textbox_y
txtb_img += txtb_img_speed
txtb_spr_w = sprite_get_width(txtb_spr[page]);
txtb_spr_h = sprite_get_height(txtb_spr[page]);

//draw the speaker
if(speaker_sprite[page] != noone)
{
	sprite_index = speaker_sprite[page]
	if(draw_char == text_length[page])
	{
		image_index = 0
	}
	var speaker_x = textbox_x + portrait_x_offset[page]
	if(speaker_side[page] == -1)
	{
		speaker_x += sprite_width
	}
	//draw the speaker
	draw_sprite_ext(txtb_spr[page],txtb_img,textbox_x + portrait_x_offset[page],textbox_y,sprite_width/txtb_spr_w,sprite_width/txtb_spr_h,0,c_white,1)
	draw_sprite_ext(sprite_index,image_index,speaker_x,textbox_y,speaker_side[page],1,0,c_white,1)
}

//back of the textbox
draw_sprite_ext(txtb_spr[page],txtb_img,txtb_x,txtb_y,textbox_width/txtb_spr_w,textbox_height/txtb_spr_h,0,c_white,1)

//-------------------------------------------options--------------------------------------------\\

if(draw_char == text_length[page])
{
	//option selection
	option_pos += (keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up))
	option_pos += (keyboard_check_pressed(ord("S")) - keyboard_check_pressed(ord("W")))
	option_pos += keyboard_check_pressed(vk_tab)
	if(keyboard_check_pressed(vk_tab) && option_pos > option_number - 1)
	{
		option_pos = 0
	}
	option_pos = clamp(option_pos,0,option_number - 1)
	
	
	//draw the options
	var op_space = 35
	var op_border = 4
	for(var op = 0; op < option_number; op ++)
	{
		//draw the option boxes
		var _o_w = string_width(option[op]) + op_border * 2
		
		//-------------|sprite|sub_i|--| x |--------------------------| y |--------------------------|xscale|------------|yscale|---|rotate|color|alpha|
		//-----------------|-----|-------|----|-------------------------|-------------------------------|-------------------|------------|----|----|----\\
		//-----------------v-----v-------v----v-------------------------v-------------------------------v-------------------v------------v----v----v----\\
		draw_sprite_ext(txtb_spr[page],txtb_img,txtb_x + 16,txtb_y - op_space * option_number + op_space*op,_o_w/txtb_spr_w,(op_space)/txtb_spr_h,0,c_white,1)
		
		//the arrow
		if(option_pos == op)
		{
			draw_sprite(spr_esc_op,0,txtb_x, txtb_y - op_space * option_number + op_space*op+14)
		}
		
		//the option text
		draw_text(txtb_x+16 + op_border, txtb_y - op_space*option_number + op_space*op-2,option[op])
	}
}

//draw the text
for(var c = 0; c < draw_char; c++)
{
	//the text
	draw_text(char_x[c,page],char_y[c,page],char[c,page])
}

