extends State
class_name EnemyPunch

@export var timeout = .5
@onready var animation_player: AnimationPlayer = $"../../AnimatedSprite2D/AnimationPlayer"
var timer

func enter():
	timer = timeout
	print("Peitos!!!!")

func update(delta: float):
	animation_player.play("punch")

# func exit():
	# animation_player.play_
