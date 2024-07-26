extends TextureProgressBar

var PersistantData = ReferenceManager.PersitantData

func _ready() -> void:
	if PersistantData:
		max_value = PersistantData.planet_health
		value = PersistantData.planet_health
		PersistantData.connect("planet_health_changed", _on_planet_health_changed)

func _on_planet_health_changed(amount: int) -> void:
	value = amount


