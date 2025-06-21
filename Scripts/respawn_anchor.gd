extends Area2D

func _on_body_entered(body: Node2D) -> void:
	body.spawn_location = $RespawnLocation.global_position
