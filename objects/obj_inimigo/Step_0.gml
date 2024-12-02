var _mapats = layer_tilemap_get_id("Tiles_2")

state = ENEMYSTATES.IDLE
grv = 2
vely = 0
movex = 0
switch(state)
{
case ENEMYSTATES.IDLE:
#region
if(!collision_circle(x,y,192,obj_playerchecker,false,false))
{
	var _opcao = choose(0,1)
	
	if(_opcao == 0)
	{
		time_source1 = time_source_create(time_source_game, 10, time_source_units_seconds, function()
		{
			movex += 1
			
		},[], -1)
		time_source_start(time_source1)
	}
	else if(_opcao == 1)
	{
		time_source2 = time_source_create(time_source_game, 10, time_source_units_seconds, function()
		{
			movex -= 1
			
		},[], -1)
		time_source_start(time_source2)
	}
}
//verificação de proximidade
if(collision_circle(x,y,192,obj_playerchecker,false,false))
{
	state = ENEMYSTATES.ALERT
}

if(place_meeting(x,y+2,_mapats))
{
	vely = 0
}
else if(vely < 1)
{
	vely += 1
	vely = vely + grv
}
#endregion

case ENEMYSTATES.ALERT:
#region
if(place_meeting(x,y+2,_mapats))
{
	vely = 0
}
else if(vely < 1)
{
	vely += 1
	vely = vely + grv
}

dis_from_player = point_direction(x,y,obj_playerchecker.x,obj_playerchecker.y)

if(dis_from_player > 110)
{
	my_dir = point_direction(x,y,obj_playerchecker.x + 60,obj_playerchecker.y)
}
else if (dis_from_player < 110)
{
	my_dir = point_direction(x,y,obj_playerchecker.x - 30,obj_playerchecker.y)
}

movex = lengthdir_x(1.5,my_dir)

if(place_meeting(x,y+2,_mapats))
{
	vely = 0
}
else if(vely < 1)
{
	vely += 1
}
move_and_collide(movex,vely,_mapats)

x += movex

if(!collision_circle(x,y,192,obj_playerchecker,false,false))
{
	state = ENEMYSTATES.IDLE
}
if(collision_circle(x,y,112,obj_playerchecker,false,false))
{
	state = ENEMYSTATES.ATTACKING
}
if(place_meeting(x,y,obj_playerchecker) && keyboard_check_pressed(ord("E")))
{
	state = ENEMYSTATES.HIT
}
#endregion
case ENEMYSTATES.ATTACKING:
#region
if(place_meeting(x,y,obj_playerchecker) && global.vida > 0)
	{
		time_source3 = time_source_create(time_source_game, 1/60, time_source_units_seconds, function()
		{
			global.vida -= 1
		},[], -1)
		time_source_start(time_source3)
		
	}
	else
	{
		global.vida = global.vida
	}
if(!collision_circle(x,y,112,obj_playerchecker,false,false))
{
	state = ENEMYSTATES.ALERT
}
	//attack sprite
#endregion
case ENEMYSTATES.HIT:
#region
	//hit sprite
#endregion
case ENEMYSTATES.DEAD:
#region
	//death sprite
#endregion
}
