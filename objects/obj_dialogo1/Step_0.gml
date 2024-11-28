if(keyboard_check_pressed(vk_space) && !instance_exists(obj_limite))
{
image_index = image_index + 1
if(obj_dialogo1.image_index == 6 && keyboard_check_pressed(vk_space))
{
	instance_destroy(obj_dialogo1)
	instance_destroy(obj_slimepegajoso)
}
else
{
image_index = image_index
}
}