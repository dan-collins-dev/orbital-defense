extends Node2D

@export_group("Shape Settings")
@export var rect_pos: Vector2 = Vector2(-0.5, -2.5)
@export var rect_size: Vector2 = Vector2(1, 5)
@export var color: Color

@export_group("Stat Settings")
@export var damage: int = 1
@export var speed: float = 3.0

@onready var hitbox: Area2D = $Hitbox
@onready var laser_sound: AudioStreamPlayer = $LaserSound

var direction = Vector2(1, 1)


func _physics_process(delta: float) -> void:
	position += direction * speed * delta


func _draw() -> void:
	draw_rect(Rect2(rect_pos, rect_size), color)


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()


func _on_hitbox_area_entered(area: Area2D) -> void:
	queue_free()
