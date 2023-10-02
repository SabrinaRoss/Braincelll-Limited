extends Popup



# Called when the node enters the scene tree for the first time.

func _on_visibility_changed():
	print("I am visible now")
	if(is_visible()):
		$popup_timer.start()

func _on_popup_timer_timeout():
	self.hide()
