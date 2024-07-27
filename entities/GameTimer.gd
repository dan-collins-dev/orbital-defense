extends Timer

signal increase_difficulty

func _on_timeout() -> void:
	emit_signal("increase_difficulty")
