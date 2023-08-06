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

func _ready():
	pass

func _physics_process(delta):
	pass
