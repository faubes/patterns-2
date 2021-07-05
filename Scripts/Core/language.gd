extends Object
class_name Language

var symbol_set_:Array

func _init(symbols=null):
	symbol_set_ = []
	var array:Array = [] # temp array for dirty input
	if symbols == null or symbols.empty():
		print("New empty language")
		return
	if symbols is String:
		for i in range(symbols.length()):
			array.append(symbols[i])
	elif symbols is Array:
		for i in range(symbols.size()):
			if typeof(symbols[i]) == TYPE_INT: # assume unicode if int input
				array.append(char(symbols[i]))
			elif typeof(symbols[i]) == TYPE_STRING:
				array.append(symbols[i])
			
	for i in range(array.size()):
		if (i == 0 or symbol_set_.find(array[i]) == -1): # only add uniques
			symbol_set_.append(array[i]) # new symbol
	symbol_set_.sort()

func _equals(other:Language):
	if size() != other.size():
		return false
	for i in range(symbol_set_.size()):
		if (symbol_set_[i] != other.get_symbol(i)):
			return false
	return true

func size():
	return symbol_set_.size()
	
func get_symbol(i:int):
	assert(i>= 0 and i < size())
	return symbol_set_[i]

func get_symbols():
	return symbol_set_
