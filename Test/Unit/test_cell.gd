extends 'res://addons/gut/test.gd'

var GridCell = load('res://Scripts/Core/gridcell.gd')
#var GuessCell = load('res://Scripts/Core/GridCell.gd')

func _test_cell():
	return GridCell.new()


func _test_design():
	return Design.new(
		[ 
			[65, 66, 67, null, 65, 66,],
			[65, 66, 67, 68, 65, 66,],
			[65, 66, 67, 68, 65, 66,],
			[65, 66, 67, 68, 65, 66,],
			[65, 66, 67, 68, 65, 66,],
			[65, 66, 67, 68, 65, 66,],
		])

# states of the cells is: undecided (null) or one of the symbols
# states of cells for guesser is: undecided (null), probed or guessed
func test_new_cell():
	var cell = _test_cell()
	assert_true(cell.empty(), "New cell is empty")

func test_probe_cell():
	var cell = _test_cell()
	cell.probe()
	assert_true(cell.probed(), "GridCell is probed")

func test_guess_cell():
	var cell = _test_cell()
	cell.guess("A")
	assert_eq(cell.get_guess(), "A", "GridCell contains a guess")
	assert_true(cell.guessed(), "Cell has been guessed")

func _test_empty_cell_in_design():
	var design = _test_design()
	assert_true(design.empty(Vector2(0,3)), "Empty cell")

func _test_not_empty_cell_in_design():
	var design = _test_design()
	assert_false(design.empty(Vector2(0,0)), "Filled cell")

func test_design_cell_0_0():
	var design = _test_design()
	assert_eq(design.get_value(Vector2(0,0)), char(65), "Top left cell of design 1 returns A")

func test_design_cell_5_5():
	var design = _test_design()
	assert_eq(design.get_value(Vector2(5,5)), char(66), "Bottom right cell of design 1 returns B")

func test_cannot_guess_probed_cell():
	var design = _test_design()
	var guess = Guess.new(design)
	assert_eq(guess.probe(Vector2(0,0)), "A", "Probe cell (0,0) returns symbol A")
	assert_false(guess.guess(Vector2(0,0), design.get_symbols_used()[0]), "Cannot guess a probed cell")
	
func test_can_guess_empty_cell():
	var design = _test_design()
	var guess = Guess.new(design)
	guess.guess(Vector2(0,0), "A")
	assert_true(guess.guessed(Vector2(0,0)), "Can guess a cell")

func test_can_score_cell():
	var design = _test_design()
	var guess = Guess.new(design)
	guess.probe(Vector2(0,0))
	guess.guess(Vector2(0,1), "B")
	guess.guess(Vector2(0,2), "B")
	assert_eq(guess.score(Vector2(0,0)), 0, "No points for probed cells")
	assert_eq(guess.score(Vector2(0,1)), 1, "One point for correct guess")
	assert_eq(guess.score(Vector2(0,2)), -1, "Minus one point for incorrect guess")
	assert_null(guess.score(Vector2(0,3)), "Score returns null if no guess")
	
	
