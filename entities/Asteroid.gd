extends Node2D

var PlayerData = ReferenceManager.PlayerData

@export_group("Shape Settings")
@export var radius: float = 0
@export var color: Color

@export_group("Stat Settings")
@export var health: int = 0
@export var damage: int = 0
@export var speed: float = 0.1

@onready var hitbox_collider: CollisionShape2D = $Hitbox/CollisionShape2D
@onready var hitbox_radius: float = $Hitbox/CollisionShape2D.shape.radius
@onready var hurtbox_collider: CollisionShape2D = $Hurtbox/CollisionShape2D

var direction: Vector2 = Vector2.ZERO


func _ready() -> void:
	hurtbox_collider.shape.radius = radius + 2
	hitbox_collider.shape.radius = radius
	var target = get_tree().get_root().find_child("Planet", true, false)
	if target:
		direction = target.global_position - global_position


func _physics_process(delta: float) -> void:
	position += direction * speed * delta
	

func _draw() -> void:
	draw_circle(Vector2(0, 0), radius, color)


func take_damage(amount: int) -> void:
	health -= amount
	if health <= 0:
		PlayerData.score += 100
		queue_free()

	
func _on_hitbox_area_entered(area: Area2D) -> void:
	match area.get_parent().name:
		
		"Planet":
			PlayerData.planet_health -= damage
			queue_free()
			
		"Satellite":
			PlayerData.ship_health -= damage
			queue_free()


func _on_hurtbox_area_entered(area: Area2D) -> void:
	var dmg = area.get_parent().damage
	take_damage(dmg)
