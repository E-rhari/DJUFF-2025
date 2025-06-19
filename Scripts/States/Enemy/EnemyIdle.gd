extends State
class_name EnemyIdle

@export var enemy: CharacterBody2D
@export var ground_check: Area2D

var last_direction := 1
var wander_time : float
var player

func randomize_wander():
	print("randomizou")
	last_direction *= -1
	wander_time = randf_range(2, 5)

func enter():
	player = get_tree().get_first_node_in_group("Player")
	randomize_wander()

func update(delta: float):
	if wander_time > 0:
		wander_time -= delta
	else:
		randomize_wander()

func physics_update(delta: float):
	if enemy:
		enemy.velocity.x = last_direction * enemy.speed
	
	var direction = player.global_position - enemy.global_position
	if direction.length() < enemy.range and ground_check.has_overlapping_bodies():
		print("ir pro follow")
		Transitioned.emit(self, "follow")


func _on_area_2d_body_exited(body: Node2D) -> void:
	randomize_wander()
	pass # Replace with function body.
