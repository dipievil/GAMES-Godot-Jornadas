
var saveFile = File.new()
var path = "."
var data = ""

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func save_file(json):
	print("Salvando arquivo")
	var file = saveFile.New()
	file.open(path, file.WRITE)
	file.store_line(to_json(json))
	file.close()
