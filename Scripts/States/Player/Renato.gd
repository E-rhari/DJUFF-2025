extends State
class_name Renato

func enter():
	owner.transform.y.y = -1
	owner.local_gravity = -1
	owner.set_up_direction(Vector2(0, 1))

func exit():
	owner.transform.y.y = 1
	owner.local_gravity = 1
	owner.set_up_direction(Vector2(0, -1))
