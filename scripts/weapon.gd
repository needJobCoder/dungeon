extends CharacterBody2D

@onready var Global = get_node("/root/Global")
@onready var weaponSprite = $Sprite2D
func _ready():
	weaponSprite.texture = null

func _physics_process(delta):
	pass
	
