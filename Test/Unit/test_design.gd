extends 'res://addons/gut/test.gd'

var Design = load('res://design.gd')

func _test_design_by_array():
	return Design.new(
		[ 
			[0, 1, 2, 3, 0, 1,],
			[0, 1, 2, 3, 0, 1,],
			[0, 1, 2, 3, 0, 1,],
			[0, 1, 2, 3, 0, 1,],
			[0, 1, 2, 3, 0, 1,],
			[0, 1, 2, 3, 0, 1,], 
		])

func _test_design_by_string():
	return Design.new(
		"012301"+
		"012301"+
		"012301"+
		"012301"+
		"012301"+
		"012301")

func test_design_as_array():
	var _design = _test_design_by_array()
	assert_not_null(_design)

func test_design_as_string():
	var _design = _test_design_by_string()
	assert_not_null(_design)

func test_design_array_and_string_are_equivalent():
	var _design1 = _test_design_by_array()
	var _design2 = _test_design_by_string()
	assert_true(_design1.equals(_design2), "Array and string designs are equivalent")

func test_design_size_not_zero():
	var _design = _test_design_by_array()
	assert_gt(0, _design.size(), "Design with size zero")

func test_design_size():
	var _design = _test_design_by_array()
	assert_eq(6, _design.size(), "Design 1 has size 6 (Dimension of rows)")

func test_design_dimensions():
	var _design = _test_design_by_array()
	assert_eq(_design.get_dimensions(), [6,6], "Design 1 has dimensions 6 by 6")

func test_design_cell_0_0():
	var _design = _test_design_by_array()
	assert_eq(_design.get_cell(0,0).get_value(), 0, "Top left cell of design 1 returns 0")

func test_design_cell_0_1():
	var _design = _test_design_by_array()
	assert_eq(_design.get_cell(0,1).get_value(), 1, "Cell (0,1) of design 1 returns 1")

func test_design_cell_5_5():
	var _design = _test_design_by_array()
	assert_eq(_design.get_cell(5,5).get_value(), 1, "Bottom right cell of design 1 returns 1")

func test_design_language():
	var _design = _test_design_by_array()
	assert_eq(_design.get_language(), [0,1,2,3], "The set of symbols used in design 1 is { 0, 1, 2, 3 }")
	
func test_design_has_designer():
	var _design = _test_design_by_array()
	assert_not_null(_design.get_designer(), "Designs have a designer")

func test_design_is_rectangular():
	var _design = _test_design_by_array()
	var rows = _design.size()
	var length_of_first_row = _design.get_row(0).size()
	for i in range(rows):
		assert_eq(_design.get_row(i).size(), length_of_first_row, "Designs are rectangular")
