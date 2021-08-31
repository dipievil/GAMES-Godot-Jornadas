
var file_path = "user://"

func save_all():
	save_file(load_data("player"),"player")
	save_file(load_data("theme"),"theme")
	save_file(load_data("company"),"company")

func save_data(jsonData,resource_name):
	var file_name = str(file_path) + "DATA_" + str(resource_name) + ".sav"
	save_file(jsonData,file_name)

func load_data(resource_name):
	var file_name = str(file_path) + "DATA_" + str(resource_name) + ".sav"
	return load_file(file_name)

func save_file(data,file_name):
	var file = File.new()
	file.open(file_name, File.WRITE)
	file.store_line(to_json(data))
	file.close()

func load_file(file_name):
	var file = File.new()
	file.open(file_name, File.READ)
	var content = file.get_as_text()	
	file.close()
	return parse_json(JSON.parse(content).result)
