extends Node2D

@export var move_speed: float = 200.0


func _physics_process(delta: float) -> void:
	rotation_degrees -= move_speed * delta
