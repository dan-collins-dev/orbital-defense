extends Node

var PersistantData = ReferenceManager.PersitantData
@export var id: String = ""

signal request_complete(data: Array, rank: int)

func _ready() -> void:
	pass
	#get_hiscores()

func get_hiscores() -> void:
	var http_request = HTTPRequest.new()
	add_child(http_request)
	http_request.request_completed.connect(self._on_get_request_completed)
	
	var error = http_request.request("http://localhost:6500/api/scores/%s" % [id])
	if error != OK:
		push_error("An error occurred in the HTTP request.")


func post_hiscore(player_name: String, score: int) -> void:
	var http_request = HTTPRequest.new()
	add_child(http_request)
	http_request.request_completed.connect(self._on_post_request_completed)
	var headers = ["Content-Type: application/json"]
	var data = {
		"player_name": PersistantData.player_name,
		"score": PersistantData.score,
	}
	var body = JSON.new().stringify(data)
	var error = http_request.request("http://localhost:6500/api/scores/%s" % [id], 
				headers, HTTPClient.METHOD_POST, body)
	if error != OK:
		push_error("An error occurred in the HTTP request.")


func format_response(res_data: Dictionary) -> void:
	# Sort scores so that they display from highest to lowest
	var sorted_scores: Array = []
	sorted_scores.push_front([PersistantData.player_name, str(PersistantData.score)])
	for entry in res_data.data:
		sorted_scores.push_front([entry.player_name, entry.score])
	sorted_scores.sort_custom(func(a, b): return int(a[1]) > int(b[1]))
	
	# get the player's overall rank
	var rank = get_rank(sorted_scores)
	
	# If player rank is in top 20, remove remaining scores
	var final_scores: Array = []
	if rank < 20:
		final_scores = sorted_scores.slice(0, 20)
	
	# If player isn't in the top 20, keep 19 highest scores, cut the rest
	# and add the player's score
	elif rank >= 20:
		final_scores = sorted_scores.slice(0, 19)
		final_scores.push_back([PersistantData.player_name, PersistantData.score])
	
	emit_signal("request_complete", final_scores, rank)


func get_rank(scores: Array) -> int:
	var rank: int = 0
	for i in range(scores.size()):
		if scores[i][0] == PersistantData.player_name:
			rank = i

	return rank

func _on_get_request_completed(result, response_code, headers, body) -> void:
	var json = JSON.new()
	json.parse(body.get_string_from_utf8())
	var response = json.get_data()
	print("==== Get Response =====")
	format_response(response)
	#print(retrieved_scores)
	#emit_signal("request_complete", response)


func _on_post_request_completed(result, response_code, headers, body) -> void:
	var json = JSON.new()
	json.parse(body.get_string_from_utf8())
	var response = json.get_data()
	print("==== Post Response =====")
	print(response)
