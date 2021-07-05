extends 'res://addons/gut/test.gd'

var Design = load('res://Scripts/Core/design.gd')

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
	var design = _test_design_by_array()
	assert_not_null(design)

func test_design_as_string():
	var design = _test_design_by_string()
	assert_not_null(design)

func test_design_array_and_string_are_equivalent():
	var _design1 = _test_design_by_array()
	var _design2 = _test_design_by_string()
	assert_true(_design1.equals(_design2), "Array and string designs are equivalent")

func test_design_size_not_zero():
	var design = _test_design_by_array()
	assert_gt(0, design.size(), "Design with size zero")

func test_design_size():
	var design = _test_design_by_array()
	assert_eq(6, design.size(), "Design 1 has size 6 (Dimension of rows)")

func test_design_dimensions():
	var design = _test_design_by_array()
	assert_eq(design.get_dimensions(), [6,6], "Design 1 has dimensions 6 by 6")

func test_design_dimensions_match_design():
	var design = _test_design_by_array()
	var _dime
func test_design_cell_0_0():
	var design = _test_design_by_array()
	assert_eq(design.get_cell(0,0).get_value(), 0, "Top left cell of design 1 returns 0")

func test_design_cell_0_1():
	var design = _test_design_by_array()
	assert_eq(design.get_cell(0,1).get_value(), 1, "Cell (0,1) of design 1 returns 1")

func test_design_cell_5_5():
	var design = _test_design_by_array()
	assert_eq(design.get_cell(5,5).get_value(), 1, "Bottom right cell of design 1 returns 1")

func test_design_language():
	var design = _test_design_by_array()
	assert_eq(design.get_language(), [0,1,2,3], "The set of symbols used in design 1 is { 0, 1, 2, 3 }")
	
func test_design_has_designer():
	var design = _test_design_by_array()
	assert_true(design.get_designer() is String, "Designs have a designer")
	
func test_design_has_unique_id():
	var design1 = _test_design_by_array()
	var design2 = _test_design_by_array()
	assert_ne(design1.get_id(), design2.get_id(), "Designs have a unique id")

func test_design_is_rectangular():
	var design = _test_design_by_array()
	var rows = design.size()
	var length_of_first_row = design.get_row(0).size()
	for i in range(rows):
		assert_eq(design.get_row(i).size(), length_of_first_row, "Designs are rectangular")

# a design must be complete to pass validation
func test_design_with_null_entry():
	var incomplete_design = Design.new([
			[0, 1, 2, 3, 0, 1,],
			[0, 1, 2, 3, 0, 1,],
			[0, 1, 2, null, 0, 1,],
			[0, 1, 2, 3, 0, 1,],
			[0, 1, 2, 3, 0, 1,],
			[0, 1, 2, 3, 0, 1,], 
	])
	assert_false(incomplete_design.validate(), "Design must be complete")

func test_design_save_and_load():
	var design = _test_design_by_array()
	var filename = design.save()
	var design2 = Design.new().load(filename)
	assert_eq(design, design2, "Designs are the same after save and reload")
