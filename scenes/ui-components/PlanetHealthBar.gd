extends TextureProgressBar

@warning_ignore("shadowed_global_identifier")
var PlayerData = ReferenceManager.PlayerData

@onready var label: Label = $Label
var max_health

func _ready() -> void:
	if PlayerData:
		max_value = PlayerData.planet_health
		value = PlayerData.planet_health
		max_health = max_value
		label.text = "Planet: %s/%s" % [value, max_value]
		PlayerData.connect("planet_health_changed", _on_planet_health_changed)

func _on_planet_health_changed(amount: int) -> void:
	value = amount
	label.text = "Planet: %s/%s" % [value, max_value]
	


