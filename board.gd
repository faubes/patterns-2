extends Node

onready var board : MarginContainer
onready var grid : GridContainer
onready var button = load("res://PatternButton.gd")

export var SIZE = 6
var COLS = SIZE


# primitive serialization
func _save():
	var data := {
		"size" : SIZE }
	for e in get_tree().get_nodes_in_group("Persist"):
		if (e.position != null):
			data[e.position] = e.text
	return data

#untested; needs work	
func _load(data):
	if (grid != null):
		grid.free()
	if (board != null):
		board.free()
	
	board = MarginContainer.new()
	grid = GridContainer.new()
	grid.columns = SIZE
	for i in data:		
		var b = button.new()
		b.add_to_group("Persist")
		b.text = i.text
		grid.add_child(b)	
	
func get_by_row_col(i, j):
	assert(SIZE>0 and i >= 0 and j >= 0 and i < SIZE and j < SIZE)
	return grid.get_child(i*SIZE + j)


func _ready():
	board = MarginContainer.new()
	grid = GridContainer.new()
	grid.columns = SIZE
	board.add_child(grid)
	get_parent().add_child(board)
	
	grid.rect_size = 0.5 * get_viewport().size
	print(get_viewport().size)
	board.set_position(Vector2.ZERO)
	board.rect_size = 0.5 * get_viewport().size
#	board.anchor_left = 0.5
	board.anchor_right = 1
#	board.anchor_top = 0.5
	board.anchor_bottom = 1
	board.margin_left = 20
	board.margin_right = -20
	board.margin_top = 20
	board.margin_bottom = -20
	
	for i in range(SIZE):
		for j in range(SIZE):
			var b = button.new()
			b.add_to_group("Persist")
			b.text = str(i) + " " + str(j)
			b.position = Vector2(i,j)
			grid.add_child(b)
