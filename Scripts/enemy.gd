extends CharacterBody2D

@export var speed = 50
@export var range = 200
var is_moving_right = 1
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta: float) -> void:
	velocity.y += gravity * delta
	
	move_and_slide()

func turn():
	is_moving_right *= -1
	scale.x = -scale.x
