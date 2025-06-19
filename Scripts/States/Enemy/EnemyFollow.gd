extends State
class_name EnemyFollow

@export var enemy : CharacterBody2D

var player: CharacterBody2D

func enter():
	player = get_tree().get_first_node_in_group("Player")
	pass

func exit():
	pass

func update(_delta: float):
	pass

func physics_update(_delta: float):
	var direction = player.global_position - enemy.global_position
	
	if (direction.length() > enemy.range):
		Transitioned.emit(self, "idle")
		print("ir pro idle")
	elif (direction.length() > 50):
		print("PARO")
		enemy.velocity.x = direction.normalized().x * enemy.speed
	else:
		enemy.velocity = Vector2()
	
	pass


func _on_area_2d_body_exited(body: Node2D) -> void:
	Transitioned.emit(self, "idle")
	print("ir pro idle2")
	pass # Replace with function body.
