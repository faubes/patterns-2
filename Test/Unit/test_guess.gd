extends 'res://addons/gut/test.gd'

var Guess = load('res://Scripts/Core/guess.gd')
var Design = load('res://Scripts/Core/design/gd')

var _design:Design
var _guess:Guess

func _init():
	_design = Design.new(
		[ 
			[0, 1, 2, 3, 0, 1,],
			[0, 1, 2, 3, 0, 1,],
			[0, 1, 2, 3, 0, 1,],
			[0, 1, 2, 3, 0, 1,],
			[0, 1, 2, 3, 0, 1,],
			[0, 1, 2, 3, 0, 1,], 
		])
	_guess = Guess.new(_design)

# a guess is associated to a design
func test_guess_has_a_design():
	assert_eq(_guess.get_design(), _design, "")

# guess matches dimensions of design
func test_guess_dimension_same_as_design():
	assert_eq(_guess.get_design().get_dimensions(), _design.get_dimensions(), "Guess and design have same dimensions")

# guesser can request correct symbol from design
func test_guess_request_cell():
	assert_eq(_guess.request_cell([0,0]), 0, "Guesser can sample symbols from design")

# guesser cannot guess on a requested cell
func test_guess_cannot_guess_requested_cell():
	_init()
	_guess.request_cell([0,0])	
	assert_false(_guess.guess([0,0], 1), "Guesser cannot guess a requested cell")

# guess can be incomplete; need to request or fill every cell
func test_guess_empty_incomplete():
	var _incomplete_guess = Guess.new(_design)
	assert_false(_incomplete_guess.validate(), "Empty guess is not valid")	
	
func test_guess_partial_incomplete():
	var _incomplete_guess = Guess.new(_design)
	_incomplete_guess.guess([0, 0], 1) # guess that cell 0,0 has symbol 1
	assert_false(_incomplete_guess.validate(), "Partial guess is not valid")

func test_guess_incomplete():
	var _incomplete_guess = Guess.new(_design, 
			[[null, 1, 2, 3, 0, 1,],
			[0, 1, 2, 3, 0, 1,],
			[0, 1, 2, 3, 0, 1,],
			[0, 1, 2, 3, 0, 1,],
			[null, 1, 2, 3, 0, 1,],
			[0, 1, 2, 3, 0, 1,],]
	)
	assert_false(_incomplete_guess.validate(), "Partial guess is not valid")

# a complete guess can be validated and scored
func test_guess_complete():
	var _complete_guess = Guess.new(_design, 
			[[0, 1, 2, 3, 0, 1,],
			[0, 1, 2, 3, 0, 1,],
			[0, 1, 2, 3, 0, 1,],
			[0, 1, 2, 3, 0, 1,],
			[0, 1, 2, 3, 0, 1,],
			[0, 1, 2, 3, 0, 1,],]
	)
	assert_true(_complete_guess.validate(), "Complete guess is valid")

# special character to indicate known cell (player asked designer)
