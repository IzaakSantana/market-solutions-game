extends Node

# General
var colors = {
	white = Color8(255, 255, 255),
	red = Color8(232, 59, 59),
	yellow = Color8(249, 194, 43),
	blue = Color8(77, 155, 230),
	green = Color8(30, 188, 115)
}

var colors_list: Array


func _ready():
	_create_colors_list()
	_randomize_box_colors()


func random_color():
	return colors_list.pick_random()
	
	
func _create_colors_list():
	for color in colors:
		colors_list.append(color)
	
	
# Level 1
var box_held = false

var box_setup = {
	colors = [
		{name = "blue", color = colors.blue},
		{name = "red" , color = colors.red}, 
		{name = "green", color = colors.green},
		{name = "yellow", color =colors.yellow}
	],
	colors_to_use = []
}


func random_box_color():

	var color_data = box_setup.colors_to_use.pop_front()
	
	return color_data


func _randomize_box_colors():
	randomize()
	
	for color in box_setup.colors:
		for i in range(4):
			box_setup.colors_to_use.append(color)
			
		box_setup.colors_to_use.shuffle()
