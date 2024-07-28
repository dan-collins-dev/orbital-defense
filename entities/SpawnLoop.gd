extends Node2D

@export var move_speed: float = 50.0
var game_timer: Timer

func _ready() -> void:
	game_timer = get_tree().get_root().find_child("GameTimer", true, false)
	game_timer.connect("increase_difficulty",  _on_increase_difficulty)

func _physics_process(delta: float) -> void:
	rotation_degrees -= move_speed * delta


func _on_increase_difficulty():
	move_speed += 5
