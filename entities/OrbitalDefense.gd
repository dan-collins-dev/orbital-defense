extends Node2D

var PersistantData = ReferenceManager.PersitantData
var Projectile = preload("res://entities/Projectile.tscn")

@onready var muzzle: Node2D = $Satellite/Muzzle
@onready var cool_down_timer: Timer = $CoolDownTimer

@export var move_speed: float = 200.0
var can_fire: bool = true

func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_right"):
		rotation_degrees += move_speed * delta
	
	if Input.is_action_pressed("ui_left"):
		rotation_degrees -= move_speed * delta
		
	if Input.is_action_just_pressed("ui_accept"):
		if can_fire:
			can_fire = false
			cool_down_timer.start()
			var p = Projectile.instantiate()
			p.position = muzzle.global_position
			p.direction = p.position
			p.rotation_degrees = rotation_degrees
			get_parent().add_child(p)
			


func _on_cool_down_timer_timeout() -> void:
	can_fire = true
