extends Area2D
signal hit

var body_count = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	#hide() # Player disappears after being hit.
	#hit.emit()
	# Must be deferred as we can't change physics properties on a physics callback.
	#$CollisionShape2D.set_deferred("disabled", true)
	body_count += 1
	$AnimatedSprite2D.frame = 1


func _on_body_exited(body):
	body_count -= 1
	if body_count == 0:
		$AnimatedSprite2D.frame = 0
