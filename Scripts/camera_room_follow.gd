extends Camera2D

@onready var player: CharacterBody2D = $"../Player"


func _process(delta: float) -> void:
	var width  = get_viewport_rect().size.x/zoom.x
	var height = get_viewport_rect().size.y/zoom.y
	var cameraBoundary =  { "right": position.x+width, "left": position.x, 
							"up": position.y+height, "down": position.y }
	var playerPosition = player.position
	
	print(width)
	print("Camera: " + str(position))
	print("Player: " + str(playerPosition))
	print("Limit: " + str(cameraBoundary))

	if playerPosition.x > cameraBoundary.right:
		position.x += width
	elif playerPosition.x < cameraBoundary.left:
		position.x -= width
	
	if playerPosition.y > cameraBoundary.up:
		position.y += height
	elif playerPosition.y < cameraBoundary.down:
		position.y -= height    
