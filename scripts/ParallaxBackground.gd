extends "res://scripts/ParallaxService.gd"

#var Context = load("res://scripts/DataService.gd")

var direction = Vector2(1,0)

func _ready():
	print("-> CARREGANDO PARALLAX")
	
	var themeId = load_theme_id()
	change_parallax_layers(themeId)	

func _process(_delta):
	var parallax = $Parallax
	parallax.scroll_offset -= direction
	

func change_parallax_layers(themeId):
	var nLayers = 0
	while nLayers < 5:
		var layerImg : Sprite = get_node("Parallax/ParallaxLayer" + str(nLayers) + "/" + str(nLayers))
		var newImgPath = "res://assets/backgrounds/" + str(themeId) + "/bg_" + str(nLayers) + ".png"
		layerImg.texture = load(newImgPath)
		layerImg.centered = false
		nLayers += 1
	
