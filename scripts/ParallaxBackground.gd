extends "res://scripts/services/ParallaxService.gd"

var direction = Vector2(1,0)

func _ready():
	print("-> CARREGANDO PARALLAX")
	change_parallax_layers(GameData.playerTheme)


func _process(_delta):
	var parallax = $Parallax
	parallax.scroll_offset -= direction
	if GameData.gameTheme != GameData.playerTheme:
		change_parallax_layers(GameData.playerTheme)
		GameData.gameTheme = GameData.playerTheme

func change_parallax_layers(themeId):
	var nLayers = 0
	while nLayers < 5:
		var layerImg : Sprite = get_node("Parallax/ParallaxLayer" + str(nLayers) + "/" + str(nLayers))
		var newImgPath = "res://assets/backgrounds/" + str(themeId) + "/bg_" + str(nLayers) + ".png"
		layerImg.texture = load(newImgPath)
		layerImg.centered = false
		nLayers += 1
	
