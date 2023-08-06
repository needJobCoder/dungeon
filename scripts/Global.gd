extends Node2D

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

func _ready():
	pass

func _physics_process(delta):
	pass
