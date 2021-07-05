extends 'res://addons/gut/test.gd'

var Language = load('res://Scripts/Core/language.gd')

func test_language_size():
	var _lang = Language.new("ab")
	assert_gt(_lang.size(), 1, "Lang requires at least 2 symbols")
	
func test_language_well_defined():
	var _lang = Language.new(["A", "B", "C"])
	assert_not_null(_lang, "Constructed language 1")
	assert_eq(_lang.size(), 3, "Language 1 has three elements")
	assert_eq(_lang.get_symbol(0), "A", "Languages are indexable")

func test_language_equivalence():
	var _lang1 = Language.new(["A", "B", "C"])
	var _lang2 = Language.new(["B", "C", "A"])
	assert_true(_lang1._equals(_lang2), "Languages permutations are equivalent")

func test_language_is_a_set():
	var _lang1 = Language.new(["A", "B", "C", "A"])
	var _lang2 = Language.new(["A", "B", "C"])
	assert_true(_lang1._equals(_lang2), "Language symbols are unique")


