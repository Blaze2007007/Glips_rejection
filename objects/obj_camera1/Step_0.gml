xto = obj_playerchecker.x
yto = obj_playerchecker.y
camera_set_view_pos(view_camera[0],x-(cam_l*0.5),y-(cam_a*0.5))
	
x += (xto-x) / 15
y += (yto-y) / 15