extends State
class_name Coraggio

@export var aura_attack: Area2D
var can_attack: bool

func enter():
	can_attack = true
	owner.speed = 100

func exit():
	aura_attack.get_child(0).disabled = true
	aura_attack.get_child(1).visible = false
	owner.speed = 150

func physics_update(delta: float):
	if Input.is_action_just_pressed("attack") and can_attack:
		aura_attack.get_child(0).disabled = false
		aura_attack.get_child(1).visible = true
		can_attack = false
		await get_tree().create_timer(.5).timeout
		aura_attack.get_child(0).disabled = true
		aura_attack.get_child(1).visible = false
		can_attack = true

func _on_aura_attack_body_entered(body: Node2D) -> void:
	body.queue_free()
	pass # Replace with function body.
