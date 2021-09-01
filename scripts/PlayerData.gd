extends Node

var player_data : Dictionary = {}

var playerName setget setName, getName

func setName(new_value):
	playerName = new_value

func getName():
	return playerName
