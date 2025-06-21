extends State
class_name EnemyAttack

@export var hitbox: Area2D
@export var warning: Sprite2D

func enter():
	hitbox.get_child(0).disabled = false

func exit():
	hitbox.get_child(0).disabled = true
	hitbox.rotation = 0
	warning.scale.x = .2

func update(delta: float):
	if hitbox.rotation < PI:
		hitbox.rotation += delta * 4
	else:
		Transitioned.emit(self, "idle")
