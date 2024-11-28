function trocadeslimes()
{
	slimes = array_create(3)
	slimes[0] = obj_slime
	slimes[1] = obj_slimepegajoso
	slimes[2] = obj_slimemoldavel
	if(keyboard_check_pressed(ord("C")))
	{
		instance_activate_all()
		if(instance_exists(obj_slime))
		{
			instance_change(slimes[1],true)
		}
		else if(instance_exists(obj_slimepegajoso) && !instance_exists(obj_limite))
		{
			instance_change(slimes[0],true)
		}
		
	}
}