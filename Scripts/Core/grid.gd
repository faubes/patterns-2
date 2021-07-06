extends Object
class_name Grid

var GridCell = load('res://Scripts/Core/gridcell.gd')

var gridMap = {} # use a hashmap; easier to import/export
var dimensions:Vector2

static func empty_array(dim:Vector2):
	var arr = []
	var m = dim.x
	var n = dim.y
	arr.resize(m)
	for i in range(m):
		arr[i] = []
		arr[i].resize(n)
	return arr

func _init(arr:Array=[]):
	if !arr.empty():
		dimensions = _infer_2d_dimensions(arr)
		
		for i in range(dimensions.x):
			assert(arr[i].size() == dimensions.y, "Init grid with malformed array")
			for j in range(dimensions.y):
				var key:Vector2 = coord_key(i,j)
				if arr[i][j] != null:
					gridMap[key] = GridCell.new(arr[i][j])
				else:
					gridMap[key] = GridCell.new()
	
func _infer_2d_dimensions(arr:Array=[]) -> Vector2:
	var d := Vector2.ZERO
	d.x = arr.size()
	assert(d.x > 0, "Init grid with empty array")
	d.y = arr[0].size()
	assert (d.y > 0, "Init grid with 1d array?")
	return d
		
func well_defined():
	if dimensions.x < 2 or dimensions.y < 2:
		assert(false, "Grid too small")
		return false
	if gridMap.size() != dimensions.x * dimensions.y:
		assert(false, "Grid not well defined: incorrect number of cells")
		return false 
	for i in range(dimensions.x):
		for j in range(dimensions.y):
			if gridMap[Vector2(i,j)] == null:
				return false
	return true

func set_dimensions(d:Vector2):
	dimensions = d
	
func load(map:Dictionary):
	gridMap = map

func coord_key(i : int, j : int) -> Vector2:
	return Vector2(i,j)

func get_cell(v:Vector2):
	return gridMap[v]

func get_value(v:Vector2):
	return gridMap[v].get_value()

func guess(v:Vector2, val):
	return gridMap[v].guess(val)

func guessed(v:Vector2):
	return gridMap[v].guessed()

func score(v:Vector2):
	return gridMap[v].score()

func get_dimensions() -> Vector2:
	return dimensions
	
func equals(other:Grid):
	if get_dimensions() != other.get_dimensions():
		return false
	for i in range(dimensions.x):
		for j in range(dimensions.y):
			if !get_cell(Vector2(i,j)).equals(other.get_cell(Vector2(i,j))):
				return false
	return true

func filled():
	for i in range(dimensions.x):
		for j in range(dimensions.y):
			if get_cell(Vector2(i,j)).get_value() == null:
				return false
	return true
