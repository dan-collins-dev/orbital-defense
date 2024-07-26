extends Node2D

var shape: PackedVector2Array = [
	Vector2(-1, -3),
	Vector2(1, -3),
	Vector2(1, -1),
	Vector2(2, 0),
	Vector2(5, 0),
	Vector2(4, 1),
	Vector2(2, 1),
	Vector2(1, 2),
	Vector2(-1, 2),
	Vector2(-2, 1),
	Vector2(-4, 1),
	Vector2(-5, 0),
	Vector2(-2, 0),
	Vector2(-1, -1),
	Vector2(-1, -3)
]

@export_group("Shape Settings")
@export var body_rect_pos: Vector2 = Vector2(-2.5, -2.5)
@export var body_rect_size: Vector2 = Vector2(5, 5)
@export var body_color: Color

@export var wing_rect_pos: Vector2 = Vector2(-5, -0.5)
@export var wing_rect_size: Vector2 = Vector2(10, 1)
@export var wing_color: Color

@onready var hurtbox_collider: CollisionPolygon2D = $Hurtbox/CollisionPolygon2D
@onready var muzzle: Node2D = $Muzzle


func _ready() -> void:
	hurtbox_collider.polygon = shape


func _draw() -> void:
	draw_rect(Rect2(wing_rect_pos, wing_rect_size), Color.WHITE)
	draw_rect(Rect2(body_rect_pos, body_rect_size), Color.PURPLE)
