extends Node2D

var PersitantData = ReferenceManager.PersitantData
@export var radius: float = 0
@onready var anims: AnimationPlayer = $Animations

func _ready() -> void:
	PersitantData.connect("planet_death", _on_planet_death)

func _physics_process(delta: float) -> void:
	queue_redraw()

func _draw() -> void:
	draw_circle(Vector2.ZERO, radius, Color.RED)


func _on_planet_death() -> void:
	get_tree().paused = true
	anims.play("grow")


func _on_animations_animation_finished(anim_name: StringName) -> void:
	match anim_name:
		"grow":
			for e in get_tree().get_nodes_in_group("entities"):
				e.hide()
			anims.play("shrink")
		
		"shrink":
			PersitantData.emit_signal("game_over")
