if(instance_exists(obj_slime_pai))
{
	xto = obj_slime_pai.x
	yto = obj_slime_pai.y
	camera_set_view_pos(view_camera[0],x-(cam_l*0.5),y-(cam_a*0.5))
		
	x += (xto-x) / 15
	y += (yto-y) / 15
}
