extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
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
