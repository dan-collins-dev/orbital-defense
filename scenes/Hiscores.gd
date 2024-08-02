extends Control

var ScoreRow = preload("res://scenes/ui-components/ScoreRow.tscn")
@onready var score_container: VBoxContainer = $ScoreContainer

@warning_ignore("shadowed_global_identifier")
var PlayerData = ReferenceManager.PlayerData

var score_data: Dictionary
var sorted_scores: Array = []

func _ready() -> void:
	set_process_unhandled_input(false)
	if RequestManager.id != "":
		RequestManager.connect("request_complete", _on_request_complete)
		RequestManager.post_hiscore(PlayerData.player_name, PlayerData.score)


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("accept"):
		ReferenceManager.PlayerData = null
		get_tree().change_scene_to_file("res://scenes/MainMenu.tscn")
	

func _on_request_complete(data: Array, rank: int) -> void:
	var index: int = 0
	
	for entry in data:
		var new_score = ScoreRow.instantiate()
		score_container.add_child(new_score)
		new_score.player_name.text = entry[0]
		if entry[0] == PlayerData.player_name:
			new_score.rank.text = "%s" % (rank + 1)
			new_score.score.text = "%s" % data[index][1]
		else: 
			new_score.rank.text = "%s" % (index + 1)
			new_score.score.text = "%s" % data[index][1]
		index += 1
	
	for i in range(20 - data.size()):
		var new_score = ScoreRow.instantiate()
		score_container.add_child(new_score)
		new_score.player_name.text = "AAA"
		new_score.rank.text = "%s" % (index + 1)
		new_score.score.text = "%s" % 0
		index += 1


func _on_input_delay_timeout() -> void:
	set_process_unhandled_input(true)
	$MainMenu.show()
