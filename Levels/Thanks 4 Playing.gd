extends Node2D

@onready var animated_sprite_2d_2 = $AnimatedSprite2D2

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	animated_sprite_2d_2.play("default")
