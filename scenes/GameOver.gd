extends Control

@warning_ignore("shadowed_global_identifier")
var PlayerData = ReferenceManager.PlayerData

@onready var title: Label = $Title
@onready var score: Label = $Score
@onready var line_edit: LineEdit = $LineEdit
@onready var text_sound: AudioStreamPlayer = $TextSound

func _ready() -> void:
	get_tree().paused = false
	if PlayerData:
		score.text = str(PlayerData.score)
	line_edit.grab_focus()


func _on_line_edit_text_submitted(new_text: String) -> void:
	PlayerData.player_name = new_text
	get_tree().change_scene_to_file("res://scenes/Hiscores.tscn")


func _on_line_edit_text_changed(new_text: String) -> void:
	text_sound.play()
