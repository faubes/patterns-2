class_name Guess extends Design

func _init(arg=null):
	if arg is Design:
		grid = arg.grid
	else:
		assert(false, "guess needs a design!")
	
func get_cell(v:Vector2):
	return grid.get_cell(v)

func validate():
	for i in range(grid.get_dimensions()[0]):
		for j in range(grid.get_dimensions()[1]):
			if grid.guessed(Vector2(i,j)) != true:
				return false
	return true

func load_guess_array(arr:Array):
	for i in range(arr.size()):
		for j in range(arr[0].size()):
			grid.guess(Vector2(i,j), arr[i][j])

func clear():
	load_guess_array(Grid.empty_array(get_dimensions()))

func probe(v:Vector2):
	return grid.get_cell(v).probe()

func probed(v:Vector2):
	return grid.get_cell(v).probed()

func guess(v:Vector2, value):
	return grid.get_cell(v).guess(value)

func guessed(v:Vector2) -> bool:
	return grid.get_cell(v).guessed()

func get_dimensions() -> Vector2:
	return grid.get_dimensions()

func score(v:Vector2):
	return grid.score(v)

func score_all():
	var score = 0
	for i in range(grid.get_dimensions().x):
		for j in range(grid.get_dimensions().y):
			var v := Vector2(i,j)
			var cell_score = grid.score(v)
			if cell_score:
				score += cell_score
	return score
