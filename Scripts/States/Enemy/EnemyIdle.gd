extends State
class_name EnemyIdle

@export var enemy: CharacterBody2D
@export var ground_check: RayCast2D
@export var wall_check: RayCast2D

var wander_time : float
var player

func randomize_wander():
	enemy.turn()
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
	enemy.velocity.x = enemy.is_moving_right * enemy.speed
	
	var direction = player.global_position - enemy.global_position
	if (direction.length() < enemy.range):
		Transitioned.emit(self, "follow")
	
	if (!ground_check.is_colliding() and enemy.is_on_floor()):
		randomize_wander()
	
	if (wall_check.is_colliding()):
		randomize_wander()
