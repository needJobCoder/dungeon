extends CharacterBody2D

#signals
signal sendPickableObjectData(itemName : String, itemCount: int, isStackable, pickableObjectRef : StaticBody2D, itemTexture: String)

var SPEED = 50
var LERP_FACTOR = 0.7
var ATTACK_ANIM_SPEED = 2

@onready var playerAnimationPlayer : AnimationPlayer = $AnimationPlayer
@onready var weapon : CharacterBody2D = $weapon
@onready var weaponAnimationPlayer : AnimationPlayer
@onready var playerAnimationPlayer2 : AnimationPlayer = $AnimationPlayer2
@onready var playerSprite : Sprite2D = $Sprite2D
@onready var weaponSprite : Sprite2D 
var lookingLeft = false

var state : Dictionary = {
	"isMoving":isMoving(),
	"isAttacking":false
}

enum direction {
	up, down, left, right
}	

var lookingState = direction.right


func _ready():
	testSignal()
	playerAnimationPlayer.speed_scale = ATTACK_ANIM_SPEED
	playerAnimationPlayer.play("RESET")
	getWeaponAnimationPlayer()
	assignWeaponSprite()
	
func _physics_process(delta):
	move()
	move_and_slide()
	handleAttackAnimation()
	handleMoveAnimation(velocity)
	

func getWeaponAnimationPlayer():
	for child in weapon.get_children():
		if child is AnimationPlayer:
			weaponAnimationPlayer = child
			
func move():
	var inputVector : Vector2 = Vector2.ZERO
	if Input.is_action_pressed("ui_up"):
		inputVector = Vector2(0, -SPEED)
		lookingState = direction.up
	if Input.is_action_pressed("ui_down"):
		inputVector = Vector2(0, SPEED)
		lookingState = direction.down
	if Input.is_action_pressed("ui_right"):
		inputVector = Vector2(SPEED, 0)
		lookingLeft = false
		playerSprite.flip_h = false
		lookingState = direction.right
	if Input.is_action_pressed("ui_left"):
		lookingState = direction.left
		inputVector = Vector2(-SPEED, 0)
		playerSprite.flip_h = true
		lookingLeft = true
		
	inputVector = lerp(velocity, inputVector, LERP_FACTOR)
	velocity = inputVector
	

func handleAttackAnimation():
	if Input.is_action_just_pressed("Space"):
		weapon.z_index = 1
		if lookingState == direction.left:
			playerAnimationPlayer.play("attackLeft")
		elif lookingState == direction.right:
			playerAnimationPlayer.play("attackRight")
		elif lookingState == direction.up:
			playerAnimationPlayer.play("attackUp")
		elif lookingState == direction.down:
			playerAnimationPlayer.play("attackDown")
	

func _on_animation_player_animation_finished(anim_name):
	if anim_name == "attackRight" or anim_name == "attackLeft" or anim_name == "attackUp" or anim_name == "attackDown":
		playerAnimationPlayer.play("RESET")
		weapon.z_index = -1
		state.isAttacking = false
		
func handleMoveAnimation(velocity : Vector2):
	if velocity.x != 0 or velocity.y != 0:
		playerAnimationPlayer2.play("move2")
	else:
		playerAnimationPlayer2.stop()
	

func assignWeaponSprite():
	for child in weapon.get_children():
		if child is Sprite2D:
			weaponSprite = child

func playAttackWhileMoving():
	playerAnimationPlayer.get
		
func isMoving():
	if velocity.x ==0 or velocity.y ==0:
		return false
	elif velocity.x != 0 or velocity.y != 0:
		return true

func _on_animation_player_animation_started(anim_name):
	if anim_name == "attackRight" or anim_name == "attackLeft":
		state.isAttacking = true


func _on_animation_player_2_animation_finished(anim_name):
	pass



func _on_area_2d_body_entered(body):
	if body is StaticBody2D:
		if body.input_pickable == true:
			print("signal sent")
			emit_signal("sendPickableObjectData", body.itemName, body.itemCount, body.isStackable, body, body.itemTexture)

func getPickableData(itemName, itemCount, isStackable, body, itemTexture):
	print(itemName, itemCount, isStackable, body, itemTexture)
		
func testSignal():
	sendPickableObjectData.connect(getPickableData)
	

