extends Node2D

@export var collectable_distance = 80.0
@export var collectable_leniance = 5.0
@export var collectable_forcefulness = 3
var held_collectables = []

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func drop_held_items():
	print("dropp")
	for held in held_collectables:
		held.target = null
	held_collectables = []
