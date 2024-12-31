x1 = Resolution_W/2 // left
y1 = Resolution_H + 30 // top 
x2 = Resolution_W/2 // right
y2 = (Resolution_H/Resolution_H) - 30 // bottom

global.text_speed = .75

x1_target = Resolution_W/Resolution_W + 30
x2_target = Resolution_W - 30

lerp_progress = 0
text_progress = 0

default_message = "Default message text"
background = 0