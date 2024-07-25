extends Node2D

@export_group("Shape Settings")
@export var center: Vector2 = Vector2(0, 0)
@export var radius: float = 10.0
@export var color: Color

@export_group("Stats")
@export var max_health: int = 10
@export var current_health: int = 10

@onready var hurtbox_collider: CollisionShape2D = $Hurtbox/CollisionShape2D

func _ready() -> void:
	hurtbox_collider.shape.radius = radius
	hurtbox_collider.position = position

func _draw() -> void:
	draw_circle(position, radius, color)


func _on_hurtbox_area_entered(area: Area2D) -> void:
	# TODO: Take Damage
	pass
