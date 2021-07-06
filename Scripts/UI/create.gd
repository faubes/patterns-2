extends Control

var B := load("res://Scripts/UI/board.gd")
var P := load("res://Scripts/UI/palette.gd")
var Design = load("res://Scripts/Core/design.gd")
var Language = load("res://Scripts/Core/language.gd")

var design
var palette
var board
func _ready():
	
	design = Design.new()
	
	var screen = MarginContainer.new()
	screen.anchor_top = 0.5
	screen.anchor_bottom = 0.5
	screen.anchor_right = 0.5
	screen.anchor_left = 0.5
	screen.margin_top = 0.1*get_viewport_rect().size.y
	screen.margin_left = 0.1*get_viewport_rect().size.x
	#screen.margin_bottom = 0.2*get_viewport_rect().size.y
	#screen.margin_right = 0.2*get_viewport_rect().size.x
	add_child(screen)
	board = B.new(design)
	screen.add_child(board)	
	#var test = board._save()
	#print(test)
	palette = P.new(design.get_language())
	screen.add_child(palette)
	
func on_select_char(_event):
	print(_event.to_string())
	
