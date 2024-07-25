extends Node2D


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_right"):
		rotation_degrees += 100 * delta
	
	if Input.is_action_pressed("ui_left"):
		rotation_degrees -= 100 * delta
