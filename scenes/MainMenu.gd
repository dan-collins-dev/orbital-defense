extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_button_down() -> void:
	ReferenceManager.PersitantData = PersitantData.new()
	ReferenceManager.PersitantData.player_name = "Apple"
	get_tree().change_scene_to_file("res://scenes/Hiscores.tscn")
