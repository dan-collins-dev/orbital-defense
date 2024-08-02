extends Control

@onready var cursor_positions: Control = $CursorPositions
@onready var cursor_index: int = 0
@onready var positions = []
@onready var cursor_sound: AudioStreamPlayer = $CursorSound

func _ready() -> void:
	for node in cursor_positions.get_children():
		positions.append(node)
	cursor_positions.get_child(0)


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("accept"):
		set_process_unhandled_input(false)
	
	if event.is_action_pressed("down"):
		if positions[cursor_index] == positions.back():
			cursor_sound.play()
			positions[cursor_index].hide()
			cursor_index = 0
			positions[cursor_index].show()
		
		else:
			cursor_sound.play()
			positions[cursor_index].hide()
			cursor_index += 1
			positions[cursor_index].show()
		
	if event.is_action_pressed("up"):
		if positions[cursor_index] == positions.front():
			cursor_sound.play()
			positions[cursor_index].hide()
			cursor_index = positions.size() - 1
			positions[cursor_index].show()
		
		else:
			cursor_sound.play()
			positions[cursor_index].hide()
			cursor_index -= 1
			positions[cursor_index].show()
	
	if event.is_action_pressed("accept"):
		match cursor_index:
			
			0:
				ReferenceManager.PlayerData = PlayerData.new()
				RequestManager.PlayerData = ReferenceManager.PlayerData
				get_tree().change_scene_to_file("res://scenes/World.tscn")
			
			1:
				get_tree().change_scene_to_file("res://scenes/Controls.tscn")
			
			2:
				get_tree().quit()
