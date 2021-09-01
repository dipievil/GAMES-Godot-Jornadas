extends Node

var Context = load("res://scripts/DataService.gd")

func load_theme_id():
	var context = Context.new()	
	var infoData = context.load_data("player")
	return infoData["player_style"]

func change_parallax_layers(themeId):
	var nLayers = 0
	while nLayers < 5:
		var layerImg : Sprite = get_node("Parallax/ParallaxLayer" + str(nLayers) + "/" + str(nLayers))
		var newImgPath = "res://assets/backgrounds/" + str(themeId) + "/bg_" + str(nLayers) + ".png"
		change_sprite_texture(layerImg,newImgPath)
		nLayers += 1

func change_sprite_texture(sprite : Sprite, resource_path : String):
	sprite.texture = load(resource_path)
	var scale = Vector2(2.656,2.656)
	sprite.set_scale(scale)
	sprite.centered = false
