extends Node2D

@onready var first_label = get_node("../../MarginContainer/Label")


var is_qte_active = false
var qte_key = KEY_A

func _ready():
	print("ready")
	print("===========")
	print(first_label)
	print(first_label.text)
	print("============")
	$Timer.start() # Get ready to mash the buttonsssssss

	

	_qte_start()
	

func _process(delta):
	first_label.text = "Time: " + str(snapped($Timer.get_time_left(), 0.01))
	

func _qte_start():
	print("qte_start")
	is_qte_active = true
	
	
func _input(event):
	if is_qte_active:
		if event is InputEventKey and event.pressed:
			if event.pressed and event.keycode == qte_key:
				_qte_success()
			else:
				_qte_fail()
	
	
# Connected from Timer
func _qte_timeout():
	print("Your time's up buckaroo")
	_reset_timer()


	
	
func _qte_fail():
	print("Puzzle fail")
	_reset_timer()
	
func _qte_success():
	print("Event success")
	_reset_timer()
	
func _reset_timer():
	$Timer.paused = true # Figure out if pausing timer is possible instead of stopping it... stopping it resets it to 0
	print("timer resets after QTE event")
