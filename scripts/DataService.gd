
var file_path = "user://"

func save_all():
	pass
	#TODO: Add save remotely
	#
	# Add a global save to the API host


func save_data(jsonData,resource_name):
	var file_name = get_file_name_by_resource(resource_name)
	save_file(jsonData,file_name)

func load_data(resource_name):
	var file_name = get_file_name_by_resource(resource_name)
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

func get_file_name_by_resource(resource_name):
	return str(file_path) + "DATA_" + str(resource_name) + ".sav"
