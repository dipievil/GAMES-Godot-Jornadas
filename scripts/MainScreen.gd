extends Node2D

var Context = load("res://scripts/globals/Context.gd")

onready var soundtrack = $AudioStreamPlayer2D

const path_player_container = "LayerMid/UI/Screen/MarginContainer/MainGame/PlayerInfoLine/PlayerInfoContainer"
const path_next_screen = "res://scenes/MainMenu.tscn"

func _ready():
	print("-> CENA INICIAL")
	load_player_data()
	change_soundtrack()
	var context = Context.new()

func _process(_delta):
	
	if soundtrack.playing == false:
		soundtrack.play()


func load_player_data():
	var lblPlayerName = get_node(path_player_container + "/NameContainer/HBoxContainer/lblPlayerName")
	var lblCoins = get_node(path_player_container + "/NameContainer/HBoxContainer/lblCoins")
	var barXp : ProgressBar = get_node(path_player_container + "/XPCenterContainer/HBoxContainer/XPBar")
	var barLife : ProgressBar  = get_node(path_player_container + "/LifeCenterContainer2/HBoxContainer/PlayerLifeBar")
	
	lblPlayerName.text = GameData.playerName + ", " + GameData.playerTitle
	lblCoins.text = GameData.playerCoins
	barXp.value = GameData.playerXp
	barXp.max_value = GameData.playerMaxXp
	barLife.value = GameData.playerHp
	barLife.max_value = GameData.playerMaxHp


func change_soundtrack():
	var speech_player = soundtrack
	var audio_file = "res://assets/sfx/bg_"+GameData.playerTheme+".wav"
	print("--> SOUNDTRACK = "+audio_file)
	if File.new().file_exists(audio_file):
		var sfx = load(audio_file)
		speech_player.stream = sfx


func _on_btnJornadas_pressed():
	print("--> ABRIR JORNADAS")


func _on_btnMercador_pressed():
	print("--> ABRIR MERCADOR")


func _on_btnDuelo_pressed():
	print("--> ABRIR DUELO")


func _on_btnBack_pressed():
	var _e = get_tree().change_scene(path_next_screen)	
	queue_free()


func _on_btnInventario_pressed():
	var btnMenu = get_node("LayerHUD/TopMenu/InventoryArea/Inventory/Popup")
	btnMenu.popup()

func _on_btnConfig_pressed():
	print("Tema atual: "+GameData.playerTheme)
	if GameData.playerTheme == "s1":
		GameData.playerTheme = "s2"
	else:
		GameData.playerTheme = "s1"
	
	print("Novo Tema: "+GameData.playerTheme)
	
	var context = Context.new()	
	var infoData = parse_json(context.load_data("player"))	
	infoData["player_style"] = GameData.playerTheme
	context.save_data(infoData,"player")
	
	
