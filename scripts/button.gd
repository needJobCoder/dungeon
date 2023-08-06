extends TextureButton


@onready var textureRect = $TextureRect
@onready var richTextLabel : RichTextLabel = $RichTextLabel
@export var isEmpty: bool = true
@export var itemName : String = ""
@export var itemCount : int = 0
@export var isStackable : bool = false
@export var isSelected : bool = false
@export var id : int = 0
@export var itemTexture : String = "res://Assets/UI/PNG/blue_cross.png"

var selectedButtonTexture :Texture =  load("res://Assets/UI/PNG/red_button00.png")

var buttonProperties = {
	"isEmpty": isEmpty,
	"itemName": itemName,
	"itemCount":itemCount,
	"isStackable":isStackable,
	"isSelected":isSelected,
	"id": id,
	"itemTexture":itemTexture
}

func _ready():
	pass

func _physics_process(delta):
	assignItemTexture()
	richTextLabel.text = str(itemCount)
	
func printEverything():
	print(buttonProperties)


func _on_pressed():
	buttonProperties = {
	"isEmpty": isEmpty,
	"itemName": itemName,
	"itemCount":itemCount,
	"isStackable":isStackable,
	"isSelected":isSelected,
	"id": id,
	"itemTexture":itemTexture
}
	printEverything()

func assignItemTexture():
	var loadTexture = load(itemTexture)
	textureRect.texture = loadTexture
	
