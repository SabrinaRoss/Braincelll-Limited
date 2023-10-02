extends CanvasLayer

@export var restart_level = "res://Scene/level_0.tscn"
@export var menu_level = "res://Scene/start_screen/start_scene.tscn"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_start_button_pressed():
	get_tree().change_scene_to_file(restart_level)
	


func _on_main_menu_pressed():
	get_tree().change_scene_to_file(menu_level)
