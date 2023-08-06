extends Button

@export var isEmpty: bool = true
@export var itemName : String = ""
@export var itemCount : int = 0
@export var isStackable : bool = false
@export var isSelected : bool = false
@export var id : int = 0

var selectedButtonTexture :String = "res://Assets/UI/PNG/red_button00.png"

var buttonProperties = {
	"isEmpty": isEmpty,
	"itemName": itemName,
	"itemCount":itemCount,
	"isStackable":isStackable,
	"isSelected":isSelected,
	"id": id
}

func _physics_process(delta):
	if isSelected:
		pass

func printEverything():
	print(buttonProperties)


func _on_pressed():
	buttonProperties = {
	"isEmpty": isEmpty,
	"itemName": itemName,
	"itemCount":itemCount,
	"isStackable":isStackable,
	"isSelected":isSelected,
	"id": id
}
	printEverything()
