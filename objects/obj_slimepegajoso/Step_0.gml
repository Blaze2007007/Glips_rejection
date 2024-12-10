switch(state)
{
	case STATES.CLIMBING:
		#region
			if(place_meeting(x,y,obj_parede) && _direita)
			{
				y -= 1
			}
			else
			{
				state = STATES.IDLE
			}
		#endregion
}
if(!instance_exists(obj_dialogo1))
{
	ativardialogo = false
}
if(ativardialogo == true)
{
	sprite_index = spr_slimepegajoso
	slimevel = 0
	salto = 0
}
else
{
	slimevel = 5
	salto = -35
}
event_inherited();

