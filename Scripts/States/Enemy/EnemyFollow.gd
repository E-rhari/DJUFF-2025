extends State
class_name EnemyFollow

@export var enemy : CharacterBody2D
@export var nextState : String
@onready var animation_player: AnimationPlayer = $"../../AnimatedSprite2D/AnimationPlayer"

var player: CharacterBody2D

func enter():
	player = get_tree().get_first_node_in_group("Player")

func physics_update(_delta: float):
	animation_player.play("idle")
	var direction = player.global_position - enemy.global_position
	if direction.normalized().x > 0 and enemy.is_moving_right < 0:
		enemy.turn()
	elif direction.normalized().x < 0 and enemy.is_moving_right > 0:
		enemy.turn()
	if (direction.length() > enemy.range):
		Transitioned.emit(self, "idle")
	elif (direction.length() > 60):
		enemy.velocity.x = direction.normalized().x * enemy.speed
	else:
		enemy.velocity.x = 0
		Transitioned.emit(self, nextState)

func _on_ground_check_body_exited(body: Node2D) -> void:
	Transitioned.emit(self, "idle")
