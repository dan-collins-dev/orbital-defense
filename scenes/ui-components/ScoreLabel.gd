extends Label

@warning_ignore("shadowed_global_identifier")
var PlayerData = ReferenceManager.PlayerData

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	PlayerData.connect("score_changed", _on_score_changed)


func _on_score_changed(score) -> void:
	text = "Score: %s" % PlayerData.score
