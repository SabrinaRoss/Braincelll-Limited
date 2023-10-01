extends Area2D

var velocity = Vector2.ZERO

func _ready():
	var x = randf_range(0, 720)
	var y = 0
	velocity = Vector2(x, y)
	
	
func _process(delta):
	position += velocity * delta
