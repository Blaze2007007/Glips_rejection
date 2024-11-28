if(instance_exists(obj_slime))
{
	view_visible[0] = true
	view_visible[1] = false
	xto = obj_slime.x
	yto = obj_slime.y
	camera_set_view_pos(view_camera[0],x-(cam_l*0.5),y-(cam_a*0.5))
	
	x += (xto-x) / 15
	y += (yto-y) / 15
}
else if(instance_exists(obj_slimepegajoso))
{
	view_visible[0] = false
	view_visible[1] = true
	xto = obj_slimepegajoso.x
	yto = obj_slimepegajoso.y
	camera_set_view_pos(view_camera[1],x-(cam_l*0.5),y-(cam_a*0.5))
	
	x += (xto-x) / 15
	y += (yto-y) / 15
}