extends StaticBody2D

var closed = true


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func open():
	$AnimatedSprite2D.frame = 1
	process_mode = Node.PROCESS_MODE_DISABLED
	closed = false
	
func close():
	$AnimatedSprite2D.frame = 0
	process_mode = Node.PROCESS_MODE_ALWAYS
	closed = true

