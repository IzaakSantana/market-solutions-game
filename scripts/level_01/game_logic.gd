extends Node

var boxes = []
var markers = []

func _ready():
	boxes = get_tree().get_nodes_in_group("boxes")
	markers = get_tree().get_nodes_in_group("markers")
	
	for marker in markers:
		marker.boxes_ordered.connect(_on_boxes_ordered)


func _process(delta):
	pass


func _on_boxes_ordered():
	print('boxes ordered')
	if markers.all(check_markers):
		boxes.any(paint_boxes)


func paint_boxes(box):
	print("painting boxes")
	box.get_node("Marker").modulate = Color(1, 1, 1)


func check_markers(marker):
	return marker.has_right_boxes
