function Nineslice_stretched()
{
	////@desc Nineslice_stretched(sprite,x1,y1,x2,y2,index)
	////@arb sprite
	////@arb x1 left
	////@arb y1 top
	////@arb x2 right
	////@arb y2 bottom
	////@arb index image index
	var _size = sprite_get_width(argument0) / 3;
	var _x1 = argument1;
	var _y1 = argument2;
	var _x2= argument3;
	var _y2 = argument4;
	var _index = argument5;
	var _W = _x2 - _x1;
	var _H = _y2 - _y1;
	
	// MIDDLE
	draw_sprite_part_ext(argument0,_index,_size, _size, 1, 1,_x1+_size,_y1+_size,_W-(_size*2),_H-(_size*2),c_white,1);
	
	//EDGES
	//left edge
	draw_sprite_part_ext(argument0,_index,0,_size,_size,1,_x1,_y1+_size,1,_H-(_size*2),c_white,1)
	//right edge
	draw_sprite_part_ext(argument0,_index,_size*2,_size,_size,1,_x1+_W-_size,_y1+_size,1,_H-(_size*2),c_white,1)
	//top edge
	draw_sprite_part_ext(argument0,_index,_size,0,1,_size,_x1 +_size,_y1+_H-(_size),_W-(_size*2),1,c_white,1)
	//bottom edge
	draw_sprite_part_ext(argument0,_index,_size,_size*2,1,_size,_x1+_size,_y1,_W-(_size*2),1,c_white,1)
	
	////////////##///////////////
	// CORNERS
	//top left
	draw_sprite_part(argument0,_index,0,0,_size,_size,_x1,_y1+_H-_size)
	//top right
	draw_sprite_part(argument0,_index,_size*2,0,_size,_size,_x1+_W-_size,_y1+_H-_size)
	//bottom left
	draw_sprite_part(argument0,_index,0,_size*2,_size,_size,_x1,_y1)
	//bottom right
	draw_sprite_part(argument0,_index,_size*2,_size*2,_size,_size,_x1+_W-_size,_y1)
	////////////##///////////////
}