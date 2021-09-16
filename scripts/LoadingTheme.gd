extends "res://scripts/services/LoadingService.gd"

func _ready():
	print("-> CARREGANDO TEMAS")
	resource_name = "theme"
	next_screen = preload("res://scenes/MainScreen.tscn")	
	$HTTPRequestTheme.request(api_url+resource_name)
	
func _on_HTTPRequestTheme_request_completed(_result, response_code, _headers, body):
	if(ValidateConnection(response_code)):
		SaveLocalGame(body.get_string_from_utf8())
		GotoNextScreen()
	else:
		print("Error connecting to server :" + str(response_code))
		return
		
	
