class_name PersitantData
extends Resource

var player_name: String = "Dan"
var score: int = 25000 : set = set_score
var max_health: int = 3 : set = set_max_health
var current_health = 3 : set = set_current_health

func set_score(amount: int) -> void:
	score = amount
	# TODO: emit signal for UI to listen to

func set_max_health(amount: int) -> void:
	max_health = amount
	
func set_current_health(amount: int) -> void:
	current_health = amount
	if current_health <= 0:
		# TODO: emit signal for a game over
		pass
