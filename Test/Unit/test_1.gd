extends 'res://addons/gut/test.gd'

var Board = load('res://board.gd')
var Design = load('res://design.gd')

func test_board_size():
	var _board = Board.new()
	assert_gt(0, _board.size(), "Board with size zero")
	
func test_click_top_left_cell():
	var _board = Board.new()
	assert_not_null(_board.get_cell(0,0).get_value(), "Top left cell value returns null")

# 6 by 6
# encoded with integers
# number of symbols available in language
func test_design():
	var num_symbols = 4
	var size = 6
	var _design = Design.new(6, 4,
		{ {0, 1, 2, 3, 0, 1,},
			{0, 1, 2, 3, 0, 1,},
			{0, 1, 2, 3, 0, 1,},
			{0, 1, 2, 3, 0, 1,},
			{0, 1, 2, 3, 0, 1,},
			{0, 1, 2, 3, 0, 1,}, }		
	)

func test_guess():
	# need design
	# and guess
	#some evaluation func that compares guess to design and returns score
	
