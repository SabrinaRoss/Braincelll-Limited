extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	LivesManager.lives=3
func _physics_process(delta):
	
	if LivesManager.lives == 2:
		$Heart3.hide()
		
		
	elif LivesManager.lives == 1:
		$Heart2.hide()
		
		
	elif LivesManager.lives == 0:
		$Heart1.hide()
		#get_tree().paused = true
		
		
		get_tree().change_scene_to_file("res://Scene/game_over_screen/game_over_screen.tscn")
		#get_tree().reload_current_scene()
