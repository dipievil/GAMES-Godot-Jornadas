extends Node2D

var Context = preload("res://scripts/DataService.gd")
var api_url = "http://demo8395397.mockable.io/"
var next_screen = ""
var resource_name = ""	

func GotoNextScreen():
	get_parent().add_child(next_screen.instance())
	queue_free()

func ValidateConnection(code):
	if(code == 200):
		return true
	else:
		print("Error connecting to server :" + str(code))
		return false

func SaveLocalGame(jsonData):
		var context = Context.new()
		context.save_data(jsonData, resource_name)
