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
	
	if not $BackgroundMusic.playing:
		$BackgroundMusic.play()


func _on_boxes_ordered():
	if markers.all(check_markers):
		print("game ended")
		end_game()


func check_markers(marker):
	print("checking markers")
	return marker.has_right_boxes


func end_game():
	game_ended.emit()
	$Clapping.play()
	$GUI.visible = true
