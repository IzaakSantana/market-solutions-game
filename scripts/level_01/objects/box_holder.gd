extends RigidBody2D

var number_generator = RandomNumberGenerator.new()
var min_weight = 3
var max_weight = 4
@export var weight = number_generator.randi_range(min_weight, max_weight)
var mouse_in = false
var being_held = false
var box_respawn_pos: Vector2

func _ready():
	$Marker.modulate = GlobalVariables.random_box_color()
	$Weight.text = str(weight) + " Kg"
	box_respawn_pos = get_node("../BoxRespawn").position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed('left_click') and mouse_in:

		if can_hold_box():
			freeze = true
			GlobalVariables.box_held = true
			being_held = true

		if being_held:
			dragging_cursor()
			
			position = get_global_mouse_position()

	if Input.is_action_just_released("left_click"):
		
		freeze = false
		GlobalVariables.box_held = false
		being_held = false
		pointing_cursor()


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
	

#func _on_screen_exited():
#	freeze = true
#	position = box_respawn_pos
#	freeze = false
	
