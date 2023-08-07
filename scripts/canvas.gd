extends CanvasLayer

var ITEM_LIMIT = 100
var LIMIT = 12

@onready var gridContainer : GridContainer = $Control2/PanelContainer/GridContainer
@onready var player : CharacterBody2D
@onready var mouseTextureRect : TextureRect = $mouseTextureRect
var buttonScene : PackedScene =  load("res://scenes/button.tscn")



#mouse values


func _ready():
	player = get_parent().get_node("player")
	instantiateButtons()
	findPlayer()
	connectSignal()


func assignTextureRectPosition():
	mouseTextureRect.global_position = Global.get_global_mouse_position()
	mouseTextureRect.global_position.x += 600
	mouseTextureRect.global_position.y += 300
	mouseTextureRect.texture = load(Global.mouseitemTexture)

func _physics_process(delta):
	assignTextureRectPosition()

func onButtonPressed(itemName : String, itemCount: int, isStackable: bool, itemTexture:String, id : int):
	pass
	

func instantiateButtons():
	var index = 0
	for iterate in LIMIT:
		var instance = buttonScene.instantiate()
		instance.connect("onPressed", onButtonPressed)
		instance.id = index
		gridContainer.add_child(instance)
		if index == 0:
			instance.isSelected = true
		index+=1
		
func findPlayer():
	pass
func getDataFromSignal(itemName : String, itemCount: int, isStackable, pickableObjectRef : StaticBody2D, itemTexture: String):
	assignDataToInventory(itemName, itemCount, isStackable,pickableObjectRef, itemTexture)
	
	
func connectSignal():
	player.connect("sendPickableObjectData", getDataFromSignal)
	print("isConnected " + str(is_connected("sendPickableObjectData", getDataFromSignal)))

#@export var isEmpty: bool = true
#@export var itemName : String = ""
#@export var itemCount : int = 0
#@export var isStackable : bool = false
#@export var isSelected : bool = false
#@export var id : int = 0


func assignDataToInventory(itemName, itemCount, isStackable, pickableObjectRef, itemTexture):
	var getEmptySlot  = null
	var filledSlot  = null 
	for child in gridContainer.get_children():
		if child.isEmpty:
			getEmptySlot = child
		
		if child.isEmpty == false and child.itemName == itemName and isStackable == true and child.itemCount < ITEM_LIMIT:
			filledSlot = child
	
	print("getEmptySlot" + str(getEmptySlot.id))
	
	if filledSlot != null:
		filledSlot.itemCount += itemCount
	elif getEmptySlot !=null:
		getEmptySlot.itemName = itemName
		getEmptySlot.itemCount += itemCount
		getEmptySlot.isStackable = isStackable
		getEmptySlot.itemTexture = itemTexture
		getEmptySlot.isEmpty = false
		
	print(getEmptySlot)
	pickableObjectRef.queue_free()
