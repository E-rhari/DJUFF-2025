extends State
class_name EnemyCharge

@export var timeout = .5
@export var warning: Sprite2D
var timer

func enter():
	timer = timeout

func update(delta: float):
	warning.scale.x = .4 * timer
	if timer <= 0:
		Transitioned.emit(self, "attack")
	else:
		timer -= delta
