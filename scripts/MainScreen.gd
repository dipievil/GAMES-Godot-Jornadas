extends Node2D

var playerTheme = "s1"

var Context = preload("res://scripts/DataService.gd")

onready var soundtrack = $AudioStreamPlayer2D

const path_player_container = "LayerMid/UI/Screen/MarginContainer/MainGame/PlayerInfoLine/PlayerInfoContainer"
const path_next_screen = "res://scenes/MainMenu.tscn"

func _ready():
	print("-> CENA INICIAL")
	load_player_data()
	change_soundtrack()

func _process(_delta):
	
	if soundtrack.playing == false:
		soundtrack.play()


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
	playerTheme = str(infoData["player_style"])
	
	
func change_soundtrack():
	var speech_player = soundtrack
	var audio_file = "res://assets/sfx/bg_"+playerTheme+".wav"
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
	
	print("Player Tema: "+playerTheme)
	if playerTheme == "s1":
		playerTheme = "s2"
	else:
		playerTheme = "s1"
	
	print("Player Tema: "+playerTheme)
	
	var context = Context.new()	
	var infoData = context.load_data("player")
	infoData["player_style"] = playerTheme
	context.save_data(infoData,"player")
	var parallaxScene = load("res://scenes/ParallaxBackground.tscn")
	
	var newParallax = parallaxScene.instance()
	$LayerBack.remove_child(get_node("LayerBack/ScrollBackground"))
	$LayerBack.add_child(newParallax)
	
	# .change_scene(get_tree().get_root().get_child(get_tree().get_root().get_child_count() -1))
	
