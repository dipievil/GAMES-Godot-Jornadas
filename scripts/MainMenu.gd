extends Control

var Context = load("res://scripts/DataService.gd")
var Utils = preload("res://scripts/UtilService.gd")

const loading = preload("res://scenes/LoadingCompany.tscn")

export var path = "."

func _ready():
	print("-> CENA PRINCIPAL")
	# request.connect("request_completed",self,"_on_request_completed")
	
func _process(_delta):
	pass

func _on_Button_pressed():
	get_parent().add_child(loading.instance())
	queue_free()


func _on_btnExit_pressed():
	var context = Context.new()
	context.save_all()	
	get_tree().quit()
