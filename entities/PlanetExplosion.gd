extends Node2D

@warning_ignore("shadowed_global_identifier")
var PlayerData = ReferenceManager.PlayerData

@export var radius: float = 0
@onready var anims: AnimationPlayer = $Animations

func _ready() -> void:
	PlayerData.connect("planet_death", _on_planet_death)
	PlayerData.connect("ship_death", _on_ship_death)

func _physics_process(delta: float) -> void:
	queue_redraw()

func _draw() -> void:
	draw_circle(Vector2.ZERO, radius, Color.RED)


func _on_planet_death() -> void:
	get_tree().paused = true
	anims.play("grow")

func _on_ship_death() -> void:
	get_tree().paused = true
	anims.play("grow")


func _on_animations_animation_finished(anim_name: StringName) -> void:
	match anim_name:
		"grow":
			for e in get_tree().get_nodes_in_group("entities"):
				e.hide()
			anims.play("shrink")
		
		"shrink":
			PlayerData.emit_signal("game_over")
