extends Panel

var default_texture = preload("res://assets/backgrounds/inventory/item_slot_default_background.png")
var empty_texture = preload("res://assets/backgrounds/inventory/item_slot_empty_background.png")

var default_style: StyleBoxTexture = null
var empty_style: StyleBoxTexture = null

var ItemClass = preload("res://scenes/Item.tscn")
var item = null

func _ready():
	default_style = StyleBoxTexture.new()
	empty_style = StyleBoxTexture.new()
	default_style.texture = default_texture
	empty_style.texture = empty_texture
	
	if randi() % 2 == 0:
		item = ItemClass.instance(PackedScene.GEN_EDIT_STATE_INSTANCE)
		add_child(item)
		
	refresh_style()

func refresh_style():
	if item == null:
		set('custom_styles/panel', empty_style)
	else:
		set('custom_styles/panel', default_style)

func pickFromSlot():
	remove_child(item)
	#find_parent("UserInterface").add_child(item)
	var inventoryNode = find_parent("Inventory")
	inventoryNode.add_child(item)
	item = null
	refresh_style()
	
func putIntoSlot(new_item):
	item = new_item
	item.position = Vector2(0, 0)
	#find_parent("UserInterface").remove_child(item)
	var inventoryNode = find_parent("Inventory")
	inventoryNode.remove_child(item)	
	add_child(item)
	refresh_style()
