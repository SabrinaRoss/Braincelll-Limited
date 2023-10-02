extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.start()
	print($Popup.is_visible())

func _on_timer_timeout():
	if($Timer.is_stopped()):
		print("It's about to pop off!!")
		
		$Popup.show()
		print($Popup.is_visible())
		
	
	



func _on_popup_mouse_entered():
	print("Yes this mouse has enter the scene")
	



func _on_popup_mouse_exited():
	print("This mouse has left the business")
