extends State
class_name Marcato

func enter():
	owner.jump_speed = 500

func exit():
	owner.jump_speed = 400
