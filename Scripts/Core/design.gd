class_name Design extends Object

var Grid = load('res://Scripts/Core/grid.gd')
var Gridcell = load('res://Scripts/Core/gridcell.gd')
var Language = load('res://Scripts/Core/language.gd')

var grid:Grid
var language:Language
var id:String
var count = 0
var designer_name:String
var designer_id:String

func _init(arg=null):
	if arg is Array:
		grid = Grid.new(arg)
	elif arg == null:
		grid = Grid.new()
	_infer_language()
	id = _new_id()	

func _infer_language():
	language = Language.new(get_symbols_used())

func _new_id():
	var new_id = str(count)
	count = count + 1
	return new_id

func get_symbols_used():
	var arr = []
	for i in range(grid.get_dimensions()[0]):
		for j in range(grid.get_dimensions()[1]):
			var val = grid.get_value(Vector2(i,j))
			if (val and -1 == arr.find(val)):
				arr.append(val)
	return arr

func get_cell(v:Vector2) -> Gridcell:
	return grid.get_cell(v)

func get_value(v:Vector2):
	return grid.get_cell(v).get_value()

func empty(v:Vector2):
	return grid.get_cell(v).empty()

func get_dimensions() -> Vector2:
	return grid.get_dimensions()

func get_default_dimensions() -> Vector2:
	return Vector2(grid.DEFAULT_SIZE, grid.DEFAULT_SIZE)

func get_language():
	return language

func validate():
	if !grid.well_defined():
		return false
	elif !grid.filled():
		return false
	else:
		return true
	
func equals(other:Design):
	if grid and other:
		return grid.equals(other.grid)
	else:
		return false

func well_defined():
	if grid:
		return grid.well_defined()
	else:
		return false

func get_id() -> String:
	return id

func save() -> String:
	var file = File.new()
	var filename:String = "user://design" + get_id() + ".dat"
	file.open(filename, File.WRITE)
	file.store_line(to_json(var2str(grid.gridMap)))
	file.store_line(var2str(grid.get_dimensions()))
	file.close()
	return filename

func load(filename) -> bool:
	var file = File.new()
	var err = file.open(filename, File.READ)
	if err == OK:
		var content = str2var(parse_json(file.get_line()))
		print(content)
		grid = Grid.new()
		grid.gridMap = content
		content = str2var(file.get_line())
		print(content)
		grid.set_dimensions(content)
		file.close()
		
		return true
	else:
		return false
		

func get_designer_name() -> String:
	return designer_name
	
func set_designer_name(s:String):
	designer_name = s
