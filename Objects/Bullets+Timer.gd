extends Node2D

var bullet = preload("res://Bullet/Bullet.tscn")
var remove_track = 1

func _ready(): 
	$Timer.start()
	var bnum = BulletNum.num_bullet
	for i in bnum :
		var instance = bullet.instantiate()
		add_child(instance)

	
func _process(delta):
		
	if LivesManager.lives > 0 and LivesManager.lives_counter == 0:
		remove_track += 1
			
		_removal()
		LivesManager.lives_counter = 1
		_ready()
		$Timer.start()
		$Timer.stop()
			
	if $ExitDoor.open && $ExitDoor.get_overlapping_bodies().find($Player) != -1:
			get_tree().change_scene_to_file("res://Scene/puzzle_01.tscn")
			
func _removal():
	var instances_to_remove = 2 * remove_track
	var children_count = get_child_count()
	
	for i in range(children_count-1, children_count - instances_to_remove - 1, -1):
		var instance = get_child(i)
		instance.queue_free()
	
	


func _on_timer_timeout():
	if ($Timer.is_stopped()): #or something
		print("Hello")
		$ExitDoor.open = true
	
