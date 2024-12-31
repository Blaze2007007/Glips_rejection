lerp_progress = ( 1 - lerp_progress ) / 50

text_progress += global.text_speed

x1 = lerp(x1,x1_target,lerp_progress)
x2 = lerp(x2,x2_target,lerp_progress)

if(keyboard_check_pressed(vk_space))
{
	var _message_length = string_length(default_message)
	if(text_progress >= _message_length)
	{
		instance_destroy()
	}
	else
	{
		if(text_progress > 2)
		{
			text_progress = _message_length
		}
	}
}