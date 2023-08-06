extends CanvasLayer

@onready var gridContainer : GridContainer = $Control2/PanelContainer/GridContainer

var buttonScene : PackedScene =  load("res://scenes/button.tscn")
var LIMIT = 12

func _ready():
	var index = 0
	for iterate in LIMIT:
		var instance = buttonScene.instantiate()
		instance.id = index
		gridContainer.add_child(instance)
		if index == 0:
			instance.isSelected = true
		index+=1
