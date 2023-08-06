extends CharacterBody2D

var playerTexture : Resource = load("res://Assets/Tiles/tile_0085.png")
@onready var playerAnimationPlayer : AnimationPlayer = $AnimationPlayer



func _ready():
	pass
	
func _physics_process(delta):
	if Input.is_action_just_pressed("ui_down"):
		playerAnimationPlayer.play("move")
