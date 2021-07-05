extends Object
class_name Guess

var Grid = load('res://Scripts/Core/grid.gd')
var Gridcell = load('res://Scripts/Core/gridcell.gd')
var Design = load('res://Scripts/Core/design.gd')

var guessGrid:Grid
var design:Design

func _init(arg=null):
	if arg is Design:
		design = arg
		guessGrid = arg.grid
	else:
		assert(false, "guess needs a design!")
	
func get_cell(i : int, j : int):
	return guessGrid.get_cell(i, j)

func validate():
	for i in range(guessGrid.get_dimensions()[0]):
		for j in range(guessGrid.get_dimensions()[1]):
			if guessGrid.get_cell(i,j).guessed() != true:
				return false
	return true

func load_guess_array(arr:Array):
	for i in range(arr.size()):
		for j in range(arr[0].size()):
			guessGrid.get_cell(i,j).guess = arr[i][j]

func probe(coord:Array):
	assert(coord.size() == 2)
	return guessGrid.get_cell(coord[0], coord[1]).probe()

func guess(coord:Array, value):
	assert(coord.size() == 2)
	return guessGrid.get_cell(coord[0], coord[1]).guess(value)

func get_dimensions():
	return guessGrid.get_dimensions()
	
func score():
	var score = 0
	for i in range(guessGrid.get_dimensions()[0]):
		for j in range(guessGrid.get_dimensions()[1]):
			if guessGrid.get_cell(i,j).score():
				score += guessGrid.get_cell(i,j).score()
	return score

