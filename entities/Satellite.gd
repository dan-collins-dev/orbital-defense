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

@onready var hurtbox_collider: CollisionPolygon2D = $Hurtbox/CollisionPolygon2D
@onready var muzzle: Node2D = $Muzzle


func _ready() -> void:
	hurtbox_collider.polygon = shape


func _process(delta: float) -> void:
	queue_redraw()


func _draw() -> void:
	draw_polyline(shape, Color.WHITE, .25)
