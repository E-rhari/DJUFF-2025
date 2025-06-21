extends Node
var enemies: Array[Node]

func _ready() -> void:
	enemies = get_tree().get_nodes_in_group("Enemies")
