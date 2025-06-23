extends State
class_name EnemyFire

@onready var animation_player: AnimationPlayer = $"../../AnimatedSprite2D/AnimationPlayer"
var timer

func enter():
	owner.velocity.x = 0
	animation_player.play("attack")

func anim_ended():
	Transitioned.emit(self, "patrol")
