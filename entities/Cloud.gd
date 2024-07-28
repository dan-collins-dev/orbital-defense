extends Node2D

@export var radius: float = 3
@onready var anims: AnimationPlayer = $"../Anims"

func _ready() -> void:
	anims.play("explode")


func _physics_process(delta: float) -> void:
	queue_redraw()

func _draw() -> void:
	draw_circle(Vector2.ZERO, radius, Color.WHITE_SMOKE)
