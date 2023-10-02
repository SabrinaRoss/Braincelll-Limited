extends Area2D
signal hit

var body_count = 0
var pressed = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	body_count += 1
	$AnimatedSprite2D.frame = 1
	pressed = true


func _on_body_exited(body):
	body_count -= 1
	if body_count == 0:
		pressed = false
		$AnimatedSprite2D.frame = 0
