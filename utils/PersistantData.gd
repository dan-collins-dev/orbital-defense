class_name PersitantData
extends Resource

signal score_changed(score)
signal ship_health_changed(health)
signal planet_health_changed(health)
signal ship_death
signal planet_death
signal game_over

var player_name: String = ""
var score: int = 0 : set = set_score
var ship_health: int = 3 : set = set_ship_health
var planet_health: int = 10 : set = set_planet_health

func set_score(amount: int) -> void:
	score = amount
	emit_signal("score_changed", score)

func set_ship_health(amount: int) -> void:
	ship_health = amount
	emit_signal("ship_health_changed", ship_health)
	if ship_health <= 0:
		emit_signal("ship_death")
	
func set_planet_health(amount: int) -> void:
	planet_health = amount
	emit_signal("planet_health_changed", planet_health)
	if planet_health <= 0:
		emit_signal("planet_death")
