extends Node2D

@warning_ignore("shadowed_global_identifier")
var PlayerData = ReferenceManager.PlayerData
var Projectile = preload("res://entities/Projectile.tscn")

@onready var muzzle: Node2D = $Satellite/Muzzle
@onready var cool_down_timer: Timer = $CoolDownTimer
@onready var laser_sound: AudioStreamPlayer = $LaserSound

@export var move_speed: float = 200.0
var can_fire: bool = true

func _process(delta: float) -> void:
	if Input.is_action_pressed("right"):
		rotation_degrees += move_speed * delta
	
	if Input.is_action_pressed("left"):
		rotation_degrees -= move_speed * delta
		
	if Input.is_action_just_pressed("shoot"):
		if can_fire:
			laser_sound.play()
			can_fire = false
			cool_down_timer.start()
			var p = Projectile.instantiate()
			p.position = muzzle.global_position
			p.direction = p.position
			p.rotation_degrees = rotation_degrees
			get_parent().add_child(p)
			


func _on_cool_down_timer_timeout() -> void:
	can_fire = true
