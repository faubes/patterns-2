extends 'res://addons/gut/test.gd'

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

func test_design_as_array():
	var design = _test_design()
	assert_not_null(design)

func test_design_dimensions():
	var design = _test_design()
	assert_eq(design.get_dimensions(), [6,6], "Design 1 has dimensions 6 by 6")

func test_design_symbols():
	var design = _test_design()
	assert_eq(design.get_symbols_used(), ["A","B","C","D"], "The set of symbols used in design 1 is { A, B, C, D }")
	
func test_design_has_designer():
	var design = _test_design()
	design.set_designer_name("Joe")
	assert_eq(design.get_designer_name(), "Joe", "Designs have a designer")
	
#func test_design_has_unique_id():
	#var design1 = _test_design()
	#var design2 = _test_design()
	#assert_ne(design1.get_id(), design2.get_id(), "Designs have a unique id")

func test_design_well_defined():
	var design = _test_design()
	assert_true(design.well_defined(), "Designs are rectangular")

# a design must be complete to pass validation
func test_design_with_null_entry():
	var incomplete_design = _test_design()
	incomplete_design.get_cell(0,0).value = null
	assert_false(incomplete_design.validate(), "Design must be complete")

func test_design_save_and_load():
	var design = _test_design()
	var filename = design.save() # let's have Design::save() return the filename
	var design2 = Design.new().load(filename)
	assert_true(design.equals(design2), "Designs are the same after save and reload")

# the symbols used in the design are the same as those in the language
# and the symbols in the language appear at least once in the design
func test_design_and_language_coherence():
	var design = _test_design()
	var symbols = design.get_language().get_symbols()
	assert_eq(symbols, design.get_symbols_used(), "Symbols used must match language")
	var found = true
	for i in range(symbols.size()):
		if -1 == design.get_symbols_used().find(symbols[i]):
			found = false
			break
	assert_true(found, "Every symbol in language is used")

# number of possible designs
# let s be the number of symbols
# and g the number of grid cells
# then there are ? possible designs
