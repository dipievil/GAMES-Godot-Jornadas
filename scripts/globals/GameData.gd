extends Node

var themes = {"s1":"Medieval","s2":"Fazenda","s3":"Viking"}

export(String) var playerTitle
export(String) var playerName
export(String) var playerCoins
export(String) var playerXp
export(String) var playerMaxXp
export(String) var playerHp
export(String) var playerMaxHp
export(String) var playerTheme
export(String) var gameTheme

	
func dataToProp(data):
	var player_data = parse_json(data)
	playerTheme = player_data["player_style"]
	playerName = player_data["player_name"]
	playerTitle = player_data["player_title"]
	playerCoins = player_data["coins"]
	playerXp = int(player_data["XP"])
	playerMaxXp = int(player_data["max_xp"])
	playerHp = int(player_data["health"])
	playerMaxHp = int(player_data["max_health"])
	playerTheme = str(player_data["player_style"])	
	gameTheme = playerTheme
