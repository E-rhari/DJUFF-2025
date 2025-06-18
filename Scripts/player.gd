extends CharacterBody2D

@export var speed = 400


func directional_flip(direction):
	if direction < 0:
		transform.x.x = -1;
	else:
		transform.x.x = 1


func _physics_process(delta: float) -> void:
	var input_direction = Input.get_axis("left", "right")
	if input_direction:
		velocity.x = input_direction*speed
		directional_flip(input_direction)
	else:
		velocity.x = input_direction*0
	move_and_slide()
