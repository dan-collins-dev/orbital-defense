extends Control


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("accept"):
		get_tree().change_scene_to_file("res://scenes/MainMenu.tscn")
