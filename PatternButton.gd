extends Button

var position : Vector2
export var MIN_SIZE = 25

enum state {
	blank = 0,
	filled = 1,
}



# Called when the obj constructed
func _init():
	print("Added new button")
	rect_min_size = Vector2(MIN_SIZE, MIN_SIZE)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
