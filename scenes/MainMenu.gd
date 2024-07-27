extends Control


func _on_button_button_down() -> void:
	ReferenceManager.PlayerData = PlayerData.new()
	get_tree().change_scene_to_file("res://scenes/World.tscn")
