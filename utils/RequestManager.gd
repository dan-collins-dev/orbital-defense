extends Node

@export var api_key: String = ""


func get_hiscores() -> void:
	var http_request = HTTPRequest.new()
	add_child(http_request)
	http_request.request_completed.connect(self._on_get_request_completed)
	
	var error = http_request.request("http://localhost:6500/api/scores/%s" % [api_key])
	if error != OK:
		push_error("An error occurred in the HTTP request.")


func post_hiscore(player_name: String, score: int ) -> void:
	var http_request = HTTPRequest.new()
	add_child(http_request)
	http_request.request_completed.connect(self._on_post_request_completed)
	var headers = ["Content-Type: application/json"]
	var data = {
		"player_name": player_name,
		"score": score,
	}
	var body = JSON.new().stringify(data)
	var error = http_request.request("http://localhost:6500/api/scores/%s" % [api_key], 
				headers, HTTPClient.METHOD_POST, body)
	if error != OK:
		push_error("An error occurred in the HTTP request.")


func _on_get_request_completed(result, response_code, headers, body):
	var json = JSON.new()
	json.parse(body.get_string_from_utf8())
	var response = json.get_data()
	print("==== Get Response =====")
	print(response)

func _on_post_request_completed(result, response_code, headers, body):
	var json = JSON.new()
	json.parse(body.get_string_from_utf8())
	var response = json.get_data()
	print("==== Post Response =====")
	print(response)
