extends Button

var Gridcell = load('res://Scripts/Core/gridcell.gd')

var cell:Gridcell
var position : Vector2


export var MIN_BUTTON_SIZE = 45


# Called when the obj constructed
func _init(c:Gridcell=null):
	print("Added new button")
	if c:
		cell = c
	rect_min_size = Vector2(MIN_BUTTON_SIZE, MIN_BUTTON_SIZE)
