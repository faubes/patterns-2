extends 'res://addons/gut/test.gd'

var Guess = load('res://Scripts/Core/guess.gd')
var Design = load('res://Scripts/Core/design.gd')


static func _test_design():
	return Design.new(
		[ 
			[65, 66, 67, 68, 65, 66,],
			[65, 66, 67, 68, 65, 66,],
			[65, 66, 67, 68, 65, 66,],
			[65, 66, 67, 68, 65, 66,],
			[65, 66, 67, 68, 65, 66,],
			[65, 66, 67, 68, 65, 66,],
		])

# guess matches dimensions of design
func test_guess_dimension_same_as_design():
	var design = _test_design()
	var guess = Guess.new(design)
	assert_eq(guess.get_dimensions(), design.get_dimensions(), "Guess and design have same dimensions")

# guesser can request correct symbol from design
func test_guess_request_cell():
	var design = _test_design()
	var guess = Guess.new(design)
	assert_eq(guess.probe([0,0]), "A", "Guesser can sample symbols from design")

# guesser cannot guess on a requested cell
func test_guess_cannot_guess_requested_cell():
	var design = _test_design()
	var guess = Guess.new(design)
	guess.probe([0,0])
	assert_false(guess.guess([0,0], 1), "Guesser cannot guess a probed cell")

# guess can be incomplete; need to request or fill every cell
func test_guess_empty_incomplete():
	var design = _test_design()
	var guess = Guess.new(design)
	guess.get_cell(0,0).value = null
	assert_false(guess.validate(), "Empty guess is not valid")	
	
func test_guess_partial_incomplete():
	var design = _test_design()
	var guess = Guess.new(design)
	guess.guess([0,0], 1) # guess that cell 0,0 has symbol 1
	assert_false(guess.validate(), "Partial guess is not valid")

func test_guess_incomplete():
	var design = _test_design()
	var guess = Guess.new(design)
	guess.load_guess_array([
			[null, "B", "C", "D", "A", "B",],
			["A", "B", "C", "D", "A", "B",],
			["A", "B", "C", "D", "A", "B",],
			["A", "B", "C", "D", "A", "B",],
			[null, "B", "C", "D", "A", "B",],
			["A", "B", "C", "D", "A", "B",],
			])
	assert_false(guess.guessed([0,0]), "Value of guess for cell (0,0) should be null")
	assert_true(guess.guessed([0,1]), "Value of guess for cell (0,1) should be B")
	assert_false(guess.validate(), "Partial guess is not valid")

# a complete guess can be validated and scored
func test_guess_complete():
	var design = _test_design()
	var _complete_guess = Guess.new(design)
	_complete_guess.load_guess_array([
			["A", "B", "C", "D", "A", "B",],
			["A", "B", "C", "D", "A", "B",],
			["A", "B", "C", "D", "A", "B",],
			["A", "B", "C", "D", "A", "B",],
			["A", "B", "C", "D", "A", "B",],
			["A", "B", "C", "D", "A", "B",],
			])
	assert_true(_complete_guess.validate(), "Complete guess is valid")
	assert_eq(_complete_guess.score(), 36, "Perfect guess scores 36")

# special character to indicate known cell (player asked designer)
# get number of probed cells (checked where player asked designer for truth)

# get number of correct guesses

# get number of incorrect guesses

# get score

# can only guess a design once

