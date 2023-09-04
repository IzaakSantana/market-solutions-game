extends Node2D

signal boxes_ordered

@export var color = "white"
var boxes = []
var has_right_boxes = false
var check_var = true


func _process(delta):
	if check_var and has_right_boxes:
		print("emiting signal")
		boxes_ordered.emit()
		check_var = false


func _on_body_entered(body):
	if body.is_in_group("boxes") and boxes.size() < 4:
		
		boxes.append(body)
		body.new_pos.x = global_position.x
		body.new_pos.y = body.global_position.y
		body.change_state = true
		print(body.color + " box added to " + name)
	
	if boxes.size() == 4:
		
		has_right_boxes = check_boxes()



func _on_body_exited(body):
	print("box removed from " + name)
	boxes.erase(body)
	
	if has_right_boxes:
		has_right_boxes = false


func check_boxes():
	print("checking boxes")
	var color_matches = boxes.all(check_color)
	var weight_ordered = is_weight_ordered()
	
	if color_matches and weight_ordered:
		print("all match")
		
	return color_matches and weight_ordered


func check_color(box):
	print("checking color")
	return box.color == color


func is_weight_ordered():
	print("checking weight")
	var previous_weight = boxes[0].weight
	var count = 0
	
	for box in boxes:
		if box.weight > previous_weight:
			count += 1

		previous_weight = box.weight
	
	return not count > 0 # If count > 0 returns false
