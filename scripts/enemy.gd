extends CharacterBody2D

@onready var navAgent : NavigationAgent2D = $NavigationAgent2D

var SPEED = 30

func _physics_process(delta):
	navigate()
	
func navigate():
	navAgent.target_position = get_global_mouse_position()
	var direction : Vector2 = navAgent.get_next_path_position() - self.global_position
	
	velocity = direction.normalized() * SPEED
	print(velocity)
	move_and_slide()
	
