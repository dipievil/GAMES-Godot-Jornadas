extends Node2D

var Context = preload("res://scripts/DataService.gd")

onready var _soundtrack = $AudioStreamPlayer2D

const path_player_container = "LayerMid/UI/Screen/MarginContainer/MainGame/PlayerInfoLine/PlayerInfoContainer"
const path_next_screen = "res://scenes/MainMenu.tscn"

func _ready():
	print("-> CENA INICIAL")
	load_player_data()


func _process(_delta):
	
	if _soundtrack.playing == false:
		_soundtrack.play()


func load_player_data():
	var lblPlayerName = get_node(path_player_container + "/NameContainer/HBoxContainer/lblPlayerName")
	var lblCoins = get_node(path_player_container + "/NameContainer/HBoxContainer/lblCoins")
	var barXp : ProgressBar = get_node(path_player_container + "/XPCenterContainer/HBoxContainer/XPBar")
	var barLife : ProgressBar  = get_node(path_player_container + "/LifeCenterContainer2/HBoxContainer/PlayerLifeBar")
		
	var context = Context.new()	
	var infoData = context.load_data("player")
		
	lblPlayerName.text = infoData["player_name"] + ", " + infoData["player_title"]
	lblCoins.text = infoData["coins"]
	barXp.value = int(infoData["XP"])
	barXp.max_value = int(infoData["max_xp"])
	barLife.value = int(infoData["health"])
	barLife.max_value = int(infoData["max_health"])
	

#configbutton
func _on_TextureButton_pressed():
	pass # Replace with function body.


func _on_btnConfig_pressed():
	print("--> ABRIR CONFIG")	
	var btnMenu = get_node("LayerHUD/TopMenu/ConfigArea/ConfigMenu/PopupDialog")
	btnMenu.popup()


func _on_btnJornadas_pressed():
	print("--> ABRIR JORNADAS")


func _on_btnMercador_pressed():
	print("--> ABRIR MERCADOR")


func _on_btnDuelo_pressed():
	print("--> ABRIR DUELO")


func _on_btnBack_pressed():
	#get_parent().add_child(next_screen)
	var _e = get_tree().change_scene(path_next_screen)	
	queue_free()


func _on_btnInventario_pressed():
	var btnMenu = get_node("LayerHUD/TopMenu/InventoryArea/Inventory/Popup")
	btnMenu.popup()

