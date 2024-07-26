extends Node2D

var Asteroid = preload("res://entities/Asteroid.tscn")
var can_spawn: bool = false
@onready var spawn_delay: Timer = $SpawnDelay
@onready var initial_delay: Timer = $InitialDelay

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	initial_delay.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if can_spawn:
		can_spawn = false
		spawn_delay.start()
		var a = Asteroid.instantiate()
		a.global_position = global_position
		get_parent().add_child(a)


func _on_spawn_delay_timeout() -> void:
	can_spawn = true


func _on_initial_delay_timeout() -> void:
	can_spawn = true
