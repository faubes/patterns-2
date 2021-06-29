extends Control

var B := load("res://board.gd")
var P := load("res://palette.gd")

func _ready():
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
	var board_node = B.new()
	screen.add_child(board_node)	
	var test = board_node._save()
	print(test)
	var palette_node = P.new()
	screen.add_child(palette_node)
	
func on_select_char(_event):
	pass
	
