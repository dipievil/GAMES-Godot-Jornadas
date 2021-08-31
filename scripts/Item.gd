extends Node2D

func _ready():
	if randi() % 2 == 0:
		$TextureRect.texture = load("res://assets/icons/equipment/iron_sword.png")
	else:
		$TextureRect.texture = load("res://assets/icons/equipment/tree_branch.png")
