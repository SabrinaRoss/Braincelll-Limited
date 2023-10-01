extends CharacterBody2D
signal hit

@export var speed = 400
var screen_size

@export var collectable_distance = 80.0
@export var collectable_leniance = 5.0
@export var collectable_forcefulness = 3
var held_collectables = []


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$GoblinSprite.play()
	else:
		$GoblinSprite.stop()
		
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, get_viewport_rect().size)
	
	if Input.is_action_pressed("drop_items"):
		drop_held_items()


func drop_held_items():
	print("dropp")
	for held in held_collectables:
		held.target = null
	held_collectables = []

