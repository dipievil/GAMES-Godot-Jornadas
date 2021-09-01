extends Node2D

var PlayerService = load("res://scripts/PlayerService.gd")

onready var dialog = $PopupDialog
onready var themeMenu : MenuButton = $PopupDialog/VBoxContainer/ThemeOptions/HBox/ThemeMenuButton

var theme : Dictionary = {}

var options_player_theme = ""

func _init():
	print("Carregou menu")
	theme = {"s1":"Medieval","s2":"Fazenda","s3":"Viking"}


func _ready():
	print("Abriu menu")
	pass


func load_player_theme():
	var playerService = PlayerService.new()	
	var infoData = playerService.load_player_data("player")
	return infoData["player_style"]


func _on_btnSalvar_pressed():
	pass # Replace with function body.


func _on_btnCancelar_pressed():
	dialog.visible = false
	pass # Replace with function body.


func _on_PopupDialog_about_to_show():
	print("--> CARREGANDO MENU DE CONFIG")
	#load dados user
	options_player_theme = load_player_theme()
	print(options_player_theme)
	var popup_menu : PopupMenu = $PopupDialog/VBoxContainer/ThemeOptions/HBox/ThemeMenuButton/ThemeMenu
	
	print(str(theme.size()))
	
	for i in range(0, theme.size()):
		var keys = theme.keys()
		popup_menu.add_item(theme[keys[i]],i,0)

	popup_menu.set_item_checked(int(options_player_theme[1]),true)


func _on_ThemeMenu_about_to_show():
	print("--> CARREGANDO MENU DE CONFIG AO MOSTRAR")
	#load dados user
	options_player_theme = load_player_theme()
	print(options_player_theme)
	var popup_menu : PopupMenu = $PopupDialog/VBoxContainer/ThemeOptions/HBox/ThemeMenuButton/ThemeMenu
	
	print(str(theme.size()))
	
	for i in range(0, theme.size()):
		var keys = theme.keys()
		popup_menu.add_item(theme[keys[i]],i,0)

	popup_menu.set_item_checked(int(options_player_theme[1]),true)
