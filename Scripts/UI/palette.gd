extends Node

onready var palette : VSplitContainer
onready var controlContainer : HSplitContainer
onready var list : ItemList
onready var addSymbolLineEdit : LineEdit
onready var addButton : Button
onready var removeButton : Button

var Language = load('res://Scripts/Core/language.gd')

var lang : Language

func _init(_l : Language):
	lang = _l

# Called when the node enters the scene tree for the first time.
func _ready():
	
	palette = VSplitContainer.new()
	controlContainer = HSplitContainer.new()
	print(get_viewport().size)
	palette.set_position(Vector2(get_viewport().size.x * 0.75, get_viewport().size.y * 0.25))
	palette.rect_size = 0.25 * get_viewport().size
	
	list = ItemList.new()
	#list.rect_size = 0.3 * get_viewport().size
	list.set_size(Vector2(150,150))
	
	_load_symbols()
	
	palette.add_child(list)
	
	addSymbolLineEdit = LineEdit.new()
	
	addButton = Button.new()
	addButton.text = "+"
	addButton.connect("pressed", self, "_onAddButtonPressed")
	removeButton = Button.new()
	removeButton.text = "-"
	removeButton.connect("pressed", self, "_onRemoveButtonPressed")
	
	#print(palette)

	palette.add_child(list)
	palette.add_child(addSymbolLineEdit)
	controlContainer.add_child(addButton)
	controlContainer.add_child(removeButton)
	palette.add_child(controlContainer)
	
	print("Adding palette")
	add_child(palette)

func _load_symbols():
	if lang:
		for item in lang.get_symbols():
			add_to_palette(item)

func _onAddButtonPressed():
	var s = addSymbolLineEdit.text
	if (s.length() == 1):
		add_to_palette(s)

func _onRemoveButtonPressed():
	pass

func add_to_palette(s : String):
	list.add_item(s)
