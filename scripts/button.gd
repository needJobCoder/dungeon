extends TextureButton

signal onPressed(itemName: String, itemCount: int, isStackable : bool, itemTexture: String, fromId: int)

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
	emit_signal("onPressed",itemName, itemCount, isStackable, itemTexture, id)
	manageMouseInventory()
func assignItemTexture():
	var loadTexture = load(itemTexture)
	textureRect.texture = loadTexture
	if isEmpty:
		textureRect.texture = load("res://Assets/UI/PNG/blue_cross.png")
	
func manageMouseInventory():
	if Global.mouseIsEmpty and isEmpty:
		print("mouse and button empty")
	elif !Global.mouseIsEmpty and isEmpty == true:
		print("mouse is not empty and button is empty")
		print(" !Global.mouseIsEmpty and isEmpty == true")
		itemName = Global.mouseitemName
		itemCount = Global.mouseitemCount
		itemTexture = Global.mouseitemTexture
		isStackable = Global.mouseisStackable
		isEmpty = false
		
		Global.mouseIsEmpty = true
		Global.mousefromID = -1
		Global.mouseitemName = ""
		Global.mouseitemCount = 0
		Global.mouseitemTexture = ""
		Global.mouseisStackable = false
		Global.mouseIsEmpty = true
	elif Global.mouseIsEmpty and !isEmpty:
		print("mouse is empty and button is not empty")
		Global.mousefromID = id
		Global.mouseitemName = itemName
		Global.mouseitemCount = itemCount
		Global.mouseitemTexture = itemTexture
		Global.mouseisStackable = isStackable
		Global.mouseIsEmpty = false
		
		isEmpty = true
		itemName = ""
		itemCount = 0
		itemTexture = ""
		isStackable = false
	elif !Global.mouseIsEmpty and !isEmpty:
		if Global.mouseitemName == itemName:
			itemCount += Global.mouseitemCount
			Global.mouseIsEmpty = true 
			Global.mouseitemCount = 0
			Global.mouseitemName = ""
			Global.mouseitemTexture = ""
			Global.mouseisStackable = false
