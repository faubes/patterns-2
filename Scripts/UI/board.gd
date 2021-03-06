extends Node

onready var board : MarginContainer
onready var grid : GridContainer
onready var button = load("res://Scripts/UI/PatternButton.gd")

var Design = load('res://Scripts/Core/design.gd')
var design : Design

func _init(_d : Design):
	design = _d
	
func _ready():
	board = MarginContainer.new()
	grid = GridContainer.new()
	grid.set_columns(design.get_default_dimensions().y)
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
	
	if design.get_dimensions():
		for i in range(design.get_dimensions().x):
			for j in range(design.get_dimensions().y):
				var b = button.new()
				b.add_to_group("Persist")
				b.text = ""
				b.position = Vector2(i,j)
				grid.add_child(b)
