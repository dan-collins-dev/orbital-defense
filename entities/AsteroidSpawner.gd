extends Node2D

var BigAsteroid = preload("res://entities/BigAsteroid.tscn")
var SmallAsteroid = preload("res://entities/SmallAsteroid.tscn")

@onready var spawn_delay: Timer = $SpawnDelay

var can_spawn: bool = true
var asteroids: Array = [SmallAsteroid, BigAsteroid]
var asteroids_node: Node
var game_timer: Timer
var big_speed: float = 0.05
var little_speed: float = 0.1

func _ready() -> void:
	game_timer = get_tree().get_root().find_child("GameTimer", true, false)
	game_timer.connect("increase_difficulty",  _on_increase_difficulty)
	asteroids_node = get_tree().get_root().find_child("Asteroids", true, false)
	look_at(Vector2.ZERO)


func _physics_process(delta: float) -> void:
	if can_spawn:
		can_spawn = false
		spawn_delay.start()
		var asteroid_type: PackedScene = asteroids.pick_random()
		var asteroid = asteroid_type.instantiate()
		if asteroid.name == "SmallAsteroid":
			asteroid.speed = little_speed
		else:
			asteroid.speed = big_speed
		asteroid.global_position = global_position
		asteroids_node.add_child(asteroid)
		
	

func _draw():
	draw_circle(Vector2.ZERO, 2, Color.BLANCHED_ALMOND)

func _on_spawn_delay_timeout() -> void:
	can_spawn = true


func _on_increase_difficulty():
	big_speed +=  .01
	little_speed += .02
	if spawn_delay.wait_time >= .25:
		spawn_delay.wait_time -= .1
