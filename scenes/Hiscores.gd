extends Control

var ScoreRow = preload("res://scenes/ui-components/ScoreRow.tscn")
@onready var score_container: VBoxContainer = $ScoreContainer
@onready var request_manager: Node = $RequestManager

var PersistantData = ReferenceManager.PersitantData

var score_data: Dictionary
var sorted_scores: Array = []

func _ready() -> void:
	#request_manager.connect("request_complete", _on_request_complete)
	#RequestManager.get_hiscores()
	request_manager.get_hiscores()


#func _on_request_complete(data) -> void:
	#score_data = data
	#print("=--------------------------")
	#for entry in score_data.data:
		#sorted_scores.push_front([entry.player_name, entry.score])
	#sorted_scores.sort_custom(func(a, b): return int(a[1]) > int(b[1]))
#
	#var index = 1
	#for entry in sorted_scores:
		#var new_score = ScoreRow.instantiate()
		#score_container.add_child(new_score)
		#new_score.player_name.text = entry[0] 
		#new_score.rank.text = "%s" % index
		#index += 1


func _on_request_manager_request_complete(data: Array, rank: int) -> void:
	var index: int = 0
	print(data.size())
	
	for entry in data:
		var new_score = ScoreRow.instantiate()
		score_container.add_child(new_score)
		new_score.player_name.text = entry[0]
		if entry[0] == PersistantData.player_name:
			new_score.rank.text = "%s" % (rank + 1)
			new_score.score.text = "%s" % data[index][1]
		else: 
			new_score.rank.text = "%s" % (index + 1)
			new_score.score.text = "%s" % data[index][1]
		index += 1
	
	print(index)
	for i in range(20 - data.size()):
		var new_score = ScoreRow.instantiate()
		score_container.add_child(new_score)
		new_score.player_name.text = "AAA"

		new_score.rank.text = "%s" % (index + 1)
		new_score.score.text = "%s" % 0
		index += 1
