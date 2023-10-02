extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	var bnum = BulletNum.num_bullet
	for i in bnum :
		var instance = bullet.instantiate()
		add_child(instance)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if LivesManager.lives > 0 and LivesManager.lives_counter == 0:
		remove_track += 1
			
		_removal()
		LivesManager.lives_counter = 1
		_ready()
	if $PressurePlate.pressed:
		$ExitDoor.open = true
	else:
		$ExitDoor.open = false
	
	if $Lever.state:
		$Door.open()
	else:
		$Door.close()
		
	if $ExitDoor.open && $ExitDoor.get_overlapping_bodies().find($Player) != -1:
		print("Todo: change scene")
		#get_tree().change_scene_to_file("res://Scene/puzzle_01.tscn")

var bullet = preload("res://Bullet/Bullet.tscn")
var remove_track = 1

	
func _removal():
	var instances_to_remove = 2 * remove_track
	var children_count = get_child_count()
	
	for i in range(children_count-1, children_count - instances_to_remove - 1, -1):
		var instance = get_child(i)
		instance.queue_free()
	
