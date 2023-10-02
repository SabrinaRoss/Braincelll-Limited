extends Node2D

@onready var first_label = get_node("../../MarginContainer/Label")
@onready var timey = get_node("../../../Timer")
signal timeout_ree

var is_qte_active = false
var og_time = 20
func _ready():
	#print("ready")
	#print("===========")
	#print(first_label)
	#print(first_label.text)
	#print("============")
	print(timey)
	$Timer.start() # Get ready to mash the buttonsssssss

	

	_qte_start()
	

func _process(delta):
	first_label.text = "Time: " + str(snapped($Timer.get_time_left(), 0.01))
	

# Puzzle event start
func _qte_start():
	#print("qte_start")
	is_qte_active = true
	
	
	
# Connected from Timer, timer runs out
func _qte_timeout():
	print("Your time's up buckaroo")
	emit_signal("timeout_ree")
	_reset_timer()

# Successfully solving puzzle
func _qte_success():
	#print("Event success")
	_reset_timer()
	
func _reset_timer():
	# Simple reset timer workaround
	$Timer.stop()
	$Timer.wait_time = 0
	$Timer.start()
	# got the timer from how long it'll take for the popup to reappear
	$Timer.wait_time = og_time + timey.wait_time
	#print("timer resets after QTE event")
