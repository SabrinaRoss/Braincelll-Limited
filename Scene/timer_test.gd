extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.start()
	print($Popup.is_visible())
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	if($Timer.is_stopped()):
		print("It's about to pop off!!")
		
		$Popup.show()
		print($Popup.is_visible())
		
	
	

