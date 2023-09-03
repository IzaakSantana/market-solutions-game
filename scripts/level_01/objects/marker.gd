extends Node2D

signal boxes_ordered

@export var color = "white"
var boxes = []
var has_right_boxes = false
var check_var = true


func _process(delta):
	if check_var and has_right_boxes:
		boxes_ordered.emit()
		check_var = false


func _on_body_entered(body):
	if body.is_in_group("boxes") and boxes.size() < 4:
		
		boxes.append(body)
		body.new_pos.x = global_position.x
		body.new_pos.y = body.global_position.y
		body.change_state = true
	
	if boxes.size() == 4:
		
		has_right_boxes = boxes.all(check_boxes)



func _on_body_exited(body):
	boxes.erase(body)
	
	if has_right_boxes:
		has_right_boxes = false


func check_boxes(box):
	
	return box.color == color

