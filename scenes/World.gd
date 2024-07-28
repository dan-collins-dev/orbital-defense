extends Node2D

@warning_ignore("shadowed_global_identifier")
var PlayerData = ReferenceManager.PlayerData

@onready var anims: AnimationPlayer = $Anims
@onready var game_timer: Timer = $GameTimer


func _ready() -> void:
	PlayerData.connect("game_over", _on_game_over)


func _on_game_over() -> void:
	get_tree().call_deferred("change_scene_to_file", "res://scenes/GameOver.tscn")


