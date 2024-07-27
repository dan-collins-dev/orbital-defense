extends Node2D

var BigAsteroid = preload("res://entities/BigAsteroid.tscn")
var SmallAsteroid = preload("res://entities/SmallAsteroid.tscn")

@onready var spawn_delay: Timer = $SpawnDelay
@onready var initial_delay: Timer = $InitialDelay

var can_spawn: bool = false
var asteroids: Array = [SmallAsteroid, BigAsteroid]


func _ready() -> void:
	initial_delay.start()
	look_at(Vector2.ZERO)


func _physics_process(delta: float) -> void:
	if can_spawn:
		can_spawn = false
		spawn_delay.start()
		var type: PackedScene = asteroids.pick_random()
		var a = type.instantiate()
		a.global_position = global_position
		get_parent().get_parent().add_child(a)
	queue_redraw()

func _draw():
	draw_circle(Vector2.ZERO, 2, Color.BLANCHED_ALMOND)

func _on_spawn_delay_timeout() -> void:
	can_spawn = true


func _on_initial_delay_timeout() -> void:
	can_spawn = true
