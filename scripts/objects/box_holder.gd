extends Node2D

var mouse_in = false

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed('left_click') and mouse_in:
		position = get_global_mouse_position()


func _on_mouse_entered():
	mouse_in = true


func _on_mouse_exited():
	mouse_in = false
