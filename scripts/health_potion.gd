extends StaticBody2D

#var healthPotion = {
#	"itemName":"healthPotion",
#	"itemCount":1,
#	"isStackable":true,
#}

signal sendPickableObjectData(itemName:String, itemCount : int, isStackable: bool)

@onready var Global = get_node("/root/Global")

@onready var itemName : String = Global.pickableObjects.healthPotion.itemName
@onready var itemCount : int =  Global.pickableObjects.healthPotion.itemCount
@onready var isStackable : bool = Global.pickableObjects.healthPotion.isStackable
@onready var itemTexture :String = Global.pickableObjects.healthPotion.itemTexture

func _ready():
	pass


func _on_area_2d_body_entered(body):
	pass
