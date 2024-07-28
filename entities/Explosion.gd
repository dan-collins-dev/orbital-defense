extends Node2D

@onready var explode_sound: AudioStreamPlayer = $ExplodeSound

func _ready() -> void:
	explode_sound.play()

func _on_anims_animation_finished(anim_name: StringName) -> void:
	queue_free()
