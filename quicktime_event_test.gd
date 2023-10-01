extends Node2D

var is_qte_active = false
var qte_key = KEY_A
var qte_key_list = [
	[KEY_A],
	[KEY_B, KEY_C],
	[KEY_D, KEY_E, KEY_F]
]

func _ready():
	print("ready")
	$Timer.start() # Get ready to mash the buttonsssssss
	_qte_start()
	
	
func _qte_start():
	print("qte_start")
	is_qte_active = true
	
	
func _input(event):
	if is_qte_active:
		#print("qte is active")
		#print(event)
		#print(InputEventAction)
		#print(event is InputEventAction)
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
	print("timer resets after QTE event")




