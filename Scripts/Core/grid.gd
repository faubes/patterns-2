extends Object
class_name Grid

var GridCell = load('res://Scripts/Core/gridcell.gd')

var gridMap = {} # use a hashmap; easier to import/export
var m : int # dimensions of grid
var n : int

static func empty_array(m : int, n : int):
	var arr = []
	arr.resize(m)
	for i in range(m):
		arr[i] = []
		arr[i].resize(n)
	return arr

func _init(arr:Array=[]):
	if !arr.empty():
		m = arr.size()
		assert(m > 0, "Init grid with empty array")
		n = arr[0].size()
		assert (n > 0, "Init grid with 1d array?")
		
		for i in range(m):
			assert(arr[i].size() == n, "Init grid with malformed array")
			for j in range(n):
				var key:String = coord_key(i,j)
				if arr[i][j] != null:
					gridMap[key] = GridCell.new(arr[i][j])
				else:
					gridMap[key] = GridCell.new()
	
func well_defined():
	if m < 2 or n < 2:
		return false
	if gridMap.size() != m * n:
		return false
	for i in range(m):
		for j in range(n):
			if gridMap[coord_key(i,j)] == null:
				return false
	return true

func set_dimensions(arr:Array):
	assert(arr.size() == 2, "grids are 2d")
	m = arr[0]
	n = arr[1]

func load(map:Dictionary):
	gridMap = map

func coord_key(i : int, j : int) -> String:
	return str(i) + "," + str(j)

func get_cell(i : int, j : int):
	return gridMap[coord_key(i,j)]

func get_cell_by_key(key : String):
	return gridMap[key]

func get_dimensions():
	return [m, n]
	
func equals(other:Grid):
	if get_dimensions() != other.get_dimensions():
		return false
	for i in range(m):
		for j in range(n):
			if !get_cell(i,j).equals(other.get_cell(i,j)):
				return false
	return true

func filled():
	for i in range(m):
		for j in range(n):
			if get_cell(i,j).get_value() == null:
				return false
	return true
