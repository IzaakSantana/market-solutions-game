extends Node2D

var mouse_in = false

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed('left_click') and mouse_in:
		dragging_cursor()
		position = get_global_mouse_position()
	if Input.is_action_just_released("left_click"):
		pointing_cursor()


func _on_mouse_entered():
	mouse_in = true
	pointing_cursor()


func _on_mouse_exited():
	mouse_in = false
	defult_cursor()

func defult_cursor():
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)

func pointing_cursor():
	Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)
	
func dragging_cursor():
	Input.set_default_cursor_shape(Input.CURSOR_DRAG)
