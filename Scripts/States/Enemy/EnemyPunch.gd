extends State
class_name EnemyPunch

@onready var animation_player: AnimationPlayer = $"../../AnimatedSprite2D/AnimationPlayer"
var timer

func enter():
	animation_player.play("punch")
	print("Peitos!!!!")

func anim_ended():
	Transitioned.emit(self, "idle")
