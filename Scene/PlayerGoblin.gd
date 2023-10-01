extends CharacterBody2D
signal hit

@export var speed = 400
@export var push_force = 30.0
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
	var input_velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("move_right"):
		input_velocity.x += 1
	if Input.is_action_pressed("move_left"):
		input_velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		input_velocity.y += 1
	if Input.is_action_pressed("move_up"):
		input_velocity.y -= 1

	velocity = input_velocity.normalized() * speed
	if input_velocity.length() > 0:
		$GoblinSprite.play()
	else:
		$GoblinSprite.stop()
		
	#position += velocity * delta
	#position = position.clamp(Vector2.ZERO, get_viewport_rect().size)
	
	move_and_slide()
	#for i in get_slide_collision_count():
	#	var c = get_slide_collision(i)
	#	if c.get_collider() is RigidBody2D:
	#		c.get_collider().apply_central_impulse(-c.get_normal() * push_force)
			
	
	if Input.is_action_pressed("drop_items"):
		drop_held_items()


func drop_held_items():
	print("dropp")
	for held in held_collectables:
		held.target = null
	held_collectables = []

