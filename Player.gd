extends CharacterBody2D

const speed = 400
const moove_power = 100

const acceleration = 125
const friction = 15



func _physics_process(delta):
	var input_dir : Vector2 = input()
	
	if input_dir != Vector2.ZERO:
		accelerate(input_dir)
		change_direction(input_dir)
	else:
		add_friction()
	
	player_movement()
	
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
	
		if direction.x > 0 and direction.y > 0:
			self.rotation_degrees = 135 #Top_left
			return
		elif direction.x < 0 and direction.y > 0:
			self.rotation_degrees = 225 #Bottom_left
			return
		elif direction.x < 0 and direction.y < 0:
			self.rotation_degrees = 315 #Botto,_right
			return
		elif direction.x > 0 and direction.y < 0:
			self.rotation_degrees = 45 # Top_right
			return
		if direction.x > 0: 
			self.rotation_degrees = 90 # Facing right 
			
		elif direction.x < 0:
			self.rotation_degrees = 270 # Facing left
			

		elif direction.y > 0:
			self.rotation_degrees = 180  # Facing up
			
		elif direction.y < 0:
			self.rotation_degrees = 0  # Facing down
			
		
		
	
func player_movement():
	move_and_slide()
