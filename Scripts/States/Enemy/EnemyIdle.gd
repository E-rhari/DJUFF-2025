extends State
class_name EnemyTrueIdle

var wander_time: float
var player
@onready var animation_player: AnimationPlayer = $"../../AnimatedSprite2D/AnimationPlayer"

func enter():
	owner.velocity.x = 0
	player = get_tree().get_first_node_in_group("Player")
	wander_time = randf_range(1, 3)

func update(delta):
	animation_player.play("idle")
	if wander_time <= 0:
		Transitioned.emit(self, "patrol")
	else:
		wander_time -= delta
	
	var direction = player.global_position - owner.global_position
	if (direction.length() < owner.range):
		Transitioned.emit(self, "follow")
