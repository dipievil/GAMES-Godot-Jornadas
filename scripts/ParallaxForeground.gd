extends "res://scripts/services/ParallaxService.gd"

var direction = Vector2(1,0)

func _ready():
	var layerImg : Sprite = get_node("FrontArea/ParallaxLayer/Sprite")
	var newImgPath = "res://assets/backgrounds/" + str(GameData.playerTheme) + "/fg.png"
	change_sprite_texture(layerImg,newImgPath)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var parallaxFront = get_child(0)
	parallaxFront.scroll_offset -= direction

	
