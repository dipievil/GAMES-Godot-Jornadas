extends "res://scripts/Loading.gd"

func _ready():
	print("-> CARREGANDO PLAYER")
	resource_name = "player"
	next_screen = preload("res://scenes/LoadingTheme.tscn")	
	$HTTPRequestPlayer.request(api_url+resource_name)	

func _on_HTTPRequestPlayer_request_completed(_result, response_code, _headers, body):
	if(ValidateConnection(response_code)):
		SaveLocalGame(body.get_string_from_utf8())
		GotoNextScreen()
	else:
		print("Error connecting to server :" + str(response_code))
		return
