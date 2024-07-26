extends Label

var PersistantData = ReferenceManager.PersitantData

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	PersistantData.connect("score_changed", _on_score_changed)


func _on_score_changed(score) -> void:
	text = "Score: %s" % PersistantData.score
