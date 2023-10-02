extends Node2D

# Must check if pressure plate is pressed, then open/close door

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $PressurePlate.pressed:
		$ExitDoor.open =true
	else:
		$ExitDoor.open = false
	'''
	if $Lever.state:
		$DoorPlaceholder.emitting = true
		$Door.open()
	else:
		$DoorPlaceholder.emitting = false
		$Door.close()
		'''
	if $ExitDoor.open && $ExitDoor.get_overlapping_bodies().find($Player) != -1:
		get_tree().change_scene_to_file("res://Levels/1-2.tscn")
