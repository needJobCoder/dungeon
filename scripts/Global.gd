extends Node2D



# Player stuff
var warrior = {
	"texture":"res://Assets/Tiles/tile_0087.png"
}

var villager = {
	"texture":"res://Assets/Tiles/tile_0085.png"
}

var wizard = {
	"texture":"res://Assets/Tiles/tile_0086.png"
}


var classes :Dictionary = {
		"warrior": warrior,
		"villager":villager,
		"wizard":wizard,
		
}

#weapon stuff 

var sword : Dictionary = {
	"texture":"res://Assets/Tiles/tile_0104.png"
}

var weaponClasses : Dictionary = {
		"sword" : sword,	
}

#Picakble Objects

var healthPotion = {
	"itemName":"healthPotion",
	"itemCount":1,
	"isStackable":true,
	"itemTexture":"res://Assets/Tiles/tile_0115.png"
}

var pickableObjects = {
	"healthPotion":healthPotion
}

#mouseHold
var mouseitemName :String = ""
var mouseitemCount : int = 0
var mouseitemTexture : String = "res://Assets/UI/PNG/green_button00.png"
var mouseisStackable : bool = false
var mousefromID : int = 0
var mouseIsEmpty :bool = true

func _ready():
	pass

func _physics_process(delta):
	pass
