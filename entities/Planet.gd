extends Node2D

@warning_ignore("shadowed_global_identifier")
var PlayerData = ReferenceManager.PlayerData

@export_group("Shape Settings")
@export var radius: float = 10.0
@export var color: Color

@onready var hurtbox_collider: CollisionShape2D = $Hurtbox/CollisionShape2D

func _ready() -> void:
	hurtbox_collider.shape.radius = radius

func _draw() -> void:
	draw_circle(position, radius, color)


func _on_hurtbox_area_entered(area: Area2D) -> void:
	PlayerData.planet_health -= area.get_parent().damage
