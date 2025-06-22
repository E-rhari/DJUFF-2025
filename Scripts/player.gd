extends CharacterBody2D

@export var speed = 150
@export var jump_speed = 400
@export var audios: Array[AudioStreamWAV]

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var local_gravity = 1

#Respawn
var enemies: Array[Node]
var enemies_spawn_positions: Array[Vector2]
var enemies_types: Array[int]
enum {GLUTTO, GANACCIO, PRECIOSO, CORAGGIO, SONECA, MARCATO, RENATO}
@export var enemies_preload: Array[PackedScene]
@export var spawn_location : Vector2

func _ready() -> void:
	enemies = get_tree().get_nodes_in_group("Enemies")
	for i in enemies.size():
		enemies_spawn_positions.append(enemies[i].global_position)
		enemies_types.append(enemies[i].get_meta("Index"))


func directional_flip(direction):
	if direction < 0:
		transform.x.x = -1;
	else:
		transform.x.x = 1


func jump():
	velocity.y = -jump_speed * local_gravity


func horizontal_movement():
	var input_direction = Input.get_axis("left", "right")
	if input_direction:
		velocity.x = input_direction*speed
		directional_flip(input_direction)
		if $SomDeAndarTimer.time_left <= 0 and is_on_floor():
			$SomGeral.stream = audios[0]
			$SomGeral.pitch_scale = randf_range(0.8,1.2)
			$SomGeral.play()
			$SomDeAndarTimer.start(0.5)
	else:
		velocity.x = input_direction*0


func apply_gravity(delta: float):
	velocity.y += gravity * delta * local_gravity


func cut_jump():
	if velocity.y < float(-speed)/4:
		velocity.y = float(-speed)/4


func _physics_process(delta: float) -> void:
	#get_input()
	apply_gravity(delta)
	horizontal_movement()
	
	if Input.is_action_just_pressed("up") and is_on_floor():
		jump()
		$SomGeral.stream = audios[1] 
		$SomGeral.pitch_scale = randf_range(0.8, 1.2)
		$SomGeral.play()
	if Input.is_action_just_released("up"):
		cut_jump()
	
	move_and_slide()

func die() -> void:
	position = spawn_location
	$SomGeral.stream = audios[2]
	$SomGeral.pitch_scale = randf_range(0.8, 1.0)
	$SomGeral.play()
	for i in enemies.size():
		if enemies[i]:
			enemies[i].queue_free()
		var instance = enemies_preload[enemies_types[i]].instantiate()
		get_tree().root.add_child(instance)
		instance.position = enemies_spawn_positions[i]
		enemies[i] = instance
