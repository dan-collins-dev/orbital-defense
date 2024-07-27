extends TextureProgressBar

@warning_ignore("shadowed_global_identifier")
var PlayerData = ReferenceManager.PlayerData

func _ready() -> void:
	if PlayerData:
		max_value = PlayerData.planet_health
		value = PlayerData.planet_health
		PlayerData.connect("planet_health_changed", _on_planet_health_changed)

func _on_planet_health_changed(amount: int) -> void:
	value = amount


