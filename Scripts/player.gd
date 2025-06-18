extends CharacterBody2D

@export var speed = 400
@export var jump_speed = 500
@onready var static_body_2d: StaticBody2D = $"../StaticBody2D"
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func directional_flip(direction):
	if direction < 0:
		transform.x.x = -1;
	else:
		transform.x.x = 1


func jump():
	velocity.y = -jump_speed


func horizontal_movement():
	var input_direction = Input.get_axis("left", "right")
	if input_direction:
		velocity.x = input_direction*speed
		directional_flip(input_direction)
	else:
		velocity.x = input_direction*0


func apply_gravity(delta: float):
	velocity.y += gravity * delta


func cut_jump():
	if velocity.y < float(-speed)/4:
		velocity.y = float(-speed)/4


func _physics_process(delta: float) -> void:
	#get_input()
	apply_gravity(delta)
	horizontal_movement()
	
	if Input.is_action_just_pressed("up") and is_on_floor():
		jump()
	if Input.is_action_just_released("up"):
		cut_jump()
	
	move_and_slide()
