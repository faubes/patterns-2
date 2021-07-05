class_name Gridcell
extends Object

var probed = false
var value = null
var guess = null

func _init(arg=null):
	if typeof(arg) == TYPE_INT:
		value = char(arg)
	elif arg is String:
		assert(arg.length() == 1)
		value = arg
	else:
		value = null

func empty():
	return value == null

func guessed():
	return guess != null

func get_value():
	return value

func get_guess():
	return guess

func probed():
	return probed

func probe():
	if (probed == false):
		probed = true
	return get_value()

func score():
	if probed:
		return 0
	if value != null and guess != null:
		if guess == value:
			return 1
		else:
			return -1
	else:
		return null
	
func guess(arg):
	if probed():
		return false
	if arg is String and arg.length() == 1:
		guess = arg
		return true
	elif typeof(arg) == TYPE_INT:
		guess = char(arg)
		return true
	else:
		return false
		
func equals(other:Gridcell):
	return value == other.get_value() and guess == other.get_guess() and probed == other.probed()

func to_string() -> String:
	return var2str(value) + " " + var2str(guess) + " " + var2str(probed)
