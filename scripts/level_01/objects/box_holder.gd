extends RigidBody2D

var number_generator = RandomNumberGenerator.new()
var min_weight = 3
var max_weight = 4

var mouse_in = false
var being_held = false
var change_state = false
var stopped = true
var box_respawn_pos: Vector2
var new_pos: Vector2
var random_color_data = {}

@export var weight = number_generator.randi_range(min_weight, max_weight)
@export var color = "white"

func _ready():
	random_color_data = GlobalVariables.random_box_color()
	color = random_color_data.name
	$Marker.modulate = random_color_data.color
	$Weight.text = str(weight) + " Kg"
	mass = weight
	box_respawn_pos = get_node("../BoxRespawn").position
	
	get_parent().game_ended.connect(_on_game_ended)
	



func _process(delta):

	if Input.is_action_pressed('left_click') and mouse_in:

		if can_hold_box():
			freeze = true
			collision_layer = 2
			z_index = 1
			GlobalVariables.box_held = true
			being_held = true

		if being_held:
			dragging_cursor()
			
			position = get_global_mouse_position()

	if Input.is_action_just_released("left_click"):
		freeze = false
		collision_layer = 1
		z_index = 0
		GlobalVariables.box_held = false
		being_held = false
		
		
		pointing_cursor()


func _integrate_forces(state):
	if change_state:
		state.transform = Transform2D(0.0, new_pos)
		change_state = false



func defult_cursor():
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)


func pointing_cursor():
	Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)
	
	
func dragging_cursor():
	Input.set_default_cursor_shape(Input.CURSOR_DRAG)


func can_hold_box():
	return !GlobalVariables.box_held


func _on_mouse_entered():
	mouse_in = true
	pointing_cursor()


func _on_mouse_exited():
	mouse_in = false
	defult_cursor()
	

func _on_screen_exited():
	new_pos.x = box_respawn_pos.x
	new_pos.y = box_respawn_pos.y
	change_state = true
	

func _on_game_ended():
	input_pickable = false
