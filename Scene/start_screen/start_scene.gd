extends CanvasLayer

@export var first_level = "res://Scene/level_0.tscn"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_start_button_pressed():
	get_tree().change_scene_to_file(first_level)
