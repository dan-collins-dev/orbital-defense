extends Node2D

@warning_ignore("shadowed_global_identifier")
var PlayerData = ReferenceManager.PlayerData

var Explosion = preload("res://entities/Explosion.tscn")

@export_group("Shape Settings")
@export var radius: float = 3
@export var color: Color

@export_group("Stat Settings")
@export var health: int = 3
@export var damage: int = 1
@export var speed: float = 0.1
@export var score: int = 100

@onready var hitbox_collider: CollisionShape2D = $Hitbox/CollisionShape2D
@onready var hurtbox_collider: CollisionShape2D = $Hurtbox/CollisionShape2D

var explosions_node: Node
var direction: Vector2 = Vector2.ZERO


func _ready() -> void:
	hurtbox_collider.shape.radius = radius + 2
	hitbox_collider.shape.radius = radius
	explosions_node = get_tree().get_root().find_child("Explosions", true, false)
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
		PlayerData.score += score
		spawn_explosion(global_position)
		queue_free()

	
func _on_hitbox_area_entered(area: Area2D) -> void:
	match area.get_parent().name:
		
		"Planet":
			PlayerData.planet_health -= damage
			hitbox_collider.set_deferred("disabled", true)
			spawn_explosion(global_position)
			queue_free()
			
		"Satellite":
			PlayerData.ship_health -= damage
			hitbox_collider.set_deferred("disabled", true)
			spawn_explosion(global_position)
			queue_free()


func _on_hurtbox_area_entered(area: Area2D) -> void:
	var dmg = area.get_parent().damage
	take_damage(dmg)


func spawn_explosion(pos: Vector2) -> void:
	var e = Explosion.instantiate()
	e.rotation_degrees = randf_range(0, 360)
	e.global_position = pos
	explosions_node.add_child(e)
	
