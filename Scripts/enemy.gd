extends CharacterBody2D

@export var speed = 50
@export var range = 200
var target
var direction = 1
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta: float) -> void:
	velocity.y += gravity * delta
	move_and_slide()
	
	transform.x.x = 1 if(velocity.x > 0) else -1
	
	#position.x += SPEED * delta * direction
#
#func _on_area_2d_body_exited(body: Node2D) -> void:
	#transform.x.x *= -1
	#direction *= -1
#
##func _process(delta: float) -> void:
	##if !target:
		###idle
	##else:
		##if position.distance_to()
