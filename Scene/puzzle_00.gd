extends Node2D

# Must check if pressure plate is pressed, then open/close door

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $PressurePlate.pressed:
		$DoorPlaceholder.emitting = true
		$Player.get_node("Label").visible = false
		
		if $PressurePlate.get_overlapping_bodies().find($Crate) != -1:
			get_tree().change_scene_to_file("res://Scene/puzzle_01.tscn")
	else:
		$DoorPlaceholder.emitting = false
