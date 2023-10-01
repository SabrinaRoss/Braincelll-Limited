extends CharacterBody2D

const speed = 400
const moove_power = 100

const acceleration = 125
const friction = 200
@onready var starting_position = global_position


@onready var animated_sprite_2d = $AnimatedSprite2D


func _physics_process(delta):
	var input_dir : Vector2 = input()
	
	if input_dir != Vector2.ZERO:
		accelerate(input_dir)
		change_direction(input_dir)
	else:
		add_friction()
	
	player_movement()
	update_animations()
	
func input() -> Vector2:
	var input_dir = Vector2.ZERO
	
	input_dir.x = Input.get_axis("ui_left", "ui_right")
	input_dir.y = Input.get_axis("ui_up", "ui_down")
	input_dir = input_dir.normalized()
	return input_dir
	
func accelerate(direction):
	velocity = velocity.move_toward(speed * direction, acceleration)

func add_friction():
	velocity = velocity.move_toward(Vector2.ZERO, friction)
	
func change_direction(direction):
	

	move_and_slide()
	

func player_movement():
	move_and_slide()
	

func update_animations():
	if Input.is_action_pressed("ui_up"):
		animated_sprite_2d.play("Backwards")
	elif Input.is_action_just_released("ui_up"):
		animated_sprite_2d.play("Idle_Backwards")
		
	if Input.is_action_pressed("ui_down"):
		animated_sprite_2d.play("Forward")
	elif Input.is_action_just_released("ui_down"):
		animated_sprite_2d.play("Idle_Forward")
		
	if Input.is_action_pressed("ui_left"):
		animated_sprite_2d.flip_h = 1
		animated_sprite_2d.play("Side")
	elif Input.is_action_just_released("ui_left"):
		animated_sprite_2d.flip_h = 1
		animated_sprite_2d.play("Idle_Side")
	
	if Input.is_action_pressed("ui_right"):
		animated_sprite_2d.flip_h = 0
		animated_sprite_2d.play("Side")
	elif Input.is_action_just_released("ui_right"):
		animated_sprite_2d.flip_h = 0
		animated_sprite_2d.play("Idle_Side")

		
	
