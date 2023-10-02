extends Node2D
@onready var puzzle = get_node("popup_container/puzzle720")
@onready var timeout_raaa = get_node("popup_container/MarginContainer/QTE")




# Called when the node enters the scene tree for the first time.
func _ready():
	#$Timer.wait_time = 3
	$Timer.start()
	hide_qte()
	#print('Im ready')
	#print(puzzle)
	puzzle.connect("puzzle_completed", Callable(self, "_on_puzzle_completed"))
	timeout_raaa.connect("timeout_ree", Callable(self, "_on_timeout_ree"))
	

func show_qte():
	$popup_container.visible = true

func hide_qte():
	$popup_container.visible = false


# When the timer runs out 
func _on_timer_timeout():
	if($Timer.is_stopped()):
		print("It's about to pop off!!")
		
		# QTE Puzzle event
		show_qte()
		
# Puzzle complete
func _on_puzzle_completed():
	print("Puzzle completed bitches")
	hide_qte()
	
	# Resetting Timer
	$Timer.start()
		
		
#Puzzle failed on timeout
func _on_timeout_ree():
	print("You suck at time management")
	hide_qte()
	# Resetting timer
	$Timer.start()
	
	
	



