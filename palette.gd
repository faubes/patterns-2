extends Node

onready var palette : MarginContainer
onready var l : ItemList

# Called when the node enters the scene tree for the first time.
func _ready():
	palette = MarginContainer.new()

	print(get_viewport().size)
	palette.set_position(Vector2.ZERO)
	palette.rect_size = 0.25 * get_viewport().size
	palette.anchor_left = 0.8
	palette.anchor_right = 0.8
	palette.anchor_top = 0.8
	palette.anchor_bottom = 0.2
	#palette.margin_left = 20
	palette.margin_right = 50
	#palette.margin_top = 20
	#palette.margin_bottom = -20
	
	l = ItemList.new()
	l.rect_size = 0.3 * get_viewport().size
	l.add_item("A")
	l.add_item("B")
	l.add_item("C")
	l.add_item("D")
	l.add_item("E")
	l.set_size(Vector2(150,150))
	
	palette.add_child(l)
	print(palette)
	add_child(palette)
	print("Adding palette")


func add_to_palette(s : String):
	l.add_item(s)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
