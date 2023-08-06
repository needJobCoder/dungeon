extends CanvasLayer

@onready var gridContainer : GridContainer = $Control2/PanelContainer/GridContainer

var buttonScene : PackedScene =  load("res://scenes/button.tscn")
var LIMIT = 12

func _ready():
	for iterate in LIMIT:
		var instance = buttonScene.instantiate(PackedScene.GEN_EDIT_STATE_MAIN_INHERITED)
		gridContainer.add_child(instance)
	
