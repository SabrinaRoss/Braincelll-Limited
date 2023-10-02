extends Node


var bullet = preload("res://Bullet/Bullet.tscn")
var remove_track = 1
@export var next_level = "res://Level/2-3.tscn"

func _ready(): 
	var bnum = BulletNum.num_bullet
	for i in bnum :
		var instance = bullet.instantiate()
		add_child(instance)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $PressurePlate.pressed:
		#$DoorPlaceholder.emitting = true
		#$Player.get_node("Label").visible = false
		
		#if $PressurePlate.get_overlapping_bodies().find($Crate) != -1:
		$ExitDoor.open = true
	else:
		#$DoorPlaceholder.emitting = false
		$ExitDoor.open = false
	
	if $ExitDoor.open && $ExitDoor.get_overlapping_bodies().find($Player) != -1:
		get_tree().change_scene_to_file(next_level)
	if LivesManager.lives > 0 and LivesManager.lives_counter == 0:
		remove_track += 1
			
		_removal()
		LivesManager.lives_counter = 1
		_ready()
			
func _removal():
	var instances_to_remove = 2 * remove_track
	var children_count = get_child_count()
	
	for i in range(children_count-1, children_count - instances_to_remove - 1, -1):
		var instance = get_child(i)
		instance.queue_free()
	
