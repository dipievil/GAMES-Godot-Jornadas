var loadingServices = load("res://scripts/LoadingServices.gd")

func _ready():
	loadingServices = loadingServices.New()
	print("-> CARREGANDO COMPANY")
	SetNextScreen(preload("res://scenes/LoadingPlayer.tscn"))
	resource_name = "company"
	$HTTPRequestCompany.request(api_url+resource_name)
		
func _on_HTTPRequest_request_completed(_result, response_code, _headers, body):
	if(ValidateConnection(response_code)):
		SaveLocalGame(body.get_string_from_utf8())
		GotoNextScreen()
	else:
		print("Error connecting to server :" + str(response_code))
		return
