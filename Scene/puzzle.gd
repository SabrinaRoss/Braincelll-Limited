extends Node2D

@export var next_scene = "res://Scene/puzzle_01.tscn"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $PressurePlate.pressed:
		$Door.open()
	else:
		$Door.close()
	
	if $Lever.state:
		$ExitDoor.open = true
	else:
		$ExitDoor.open = false
		
	var any_player = false
	for body in $ExitDoor.get_overlapping_bodies():
		if body.is_in_group("Players"):
			any_player = true
			break
	if $ExitDoor.open && any_player:
		#print("Todo: change scene")
		get_tree().change_scene_to_file(next_scene)
