extends Node2D

@warning_ignore("shadowed_global_identifier")
var PersitantData = ReferenceManager.PersitantData

@onready var anims: AnimationPlayer = $Anims


func _ready() -> void:
	PersitantData.connect("game_over", _on_game_over)


func _on_game_over() -> void:
	get_tree().call_deferred("change_scene_to_file", "res://scenes/MainMenu.tscn")
