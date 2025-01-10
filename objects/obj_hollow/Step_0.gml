event_inherited();

var _enemy_hp = enemy_hp
var _enemy_drops = enemy_drops
var _enemy_damage = enemy_damage

if(place_meeting(x,y,obj_hollow))
{
	instance_destroy(obj_hollow)
	instance_create_layer(x,y,layer,obj_hollow)
	_enemy_damage *= 1.5
	_enemy_hp *= 1.5
	_enemy_drops += 5
	obj_hollow.image_xscale += 0.5
	obj_hollow.image_yscale  += 0.5
}
enemy_drops = _enemy_drops
enemy_damage = _enemy_damage
enemy_hp = _enemy_drops