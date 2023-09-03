extends Node

signal game_ended

var boxes = []
var markers = []

func _ready():
	boxes = get_tree().get_nodes_in_group("boxes")
	markers = get_tree().get_nodes_in_group("markers")
	


func _process(delta):
	if Input.is_action_just_pressed("restart"):
		GlobalVariables._randomize_box_colors()
		get_tree().reload_current_scene()


func _on_boxes_ordered():
	if markers.all(check_markers):
		end_game()


func check_markers(marker):
	return marker.has_right_boxes


func end_game():
	game_ended.emit()
	$GUI.visible = true
