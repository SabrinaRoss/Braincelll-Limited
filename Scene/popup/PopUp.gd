extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.start()
	hide_qte()
	

func show_qte():
	$popup_container.visible = true

func hide_qte():
	$popup_container.visible = false



func _on_timer_timeout():
	if($Timer.is_stopped()):
		print("It's about to pop off!!")
		show_qte()
		
		
	
	



