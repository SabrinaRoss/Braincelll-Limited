extends Node2D


@onready var collision_polygon_2d = $StaticBody2D/CollisionPolygon2D

var velocity = Vector2.ZERO
func _draw():
	draw_circle(collision_polygon_2d.position, 6, Color.RED)



func _ready():

	respawn()
	
func _process(delta):

	position += velocity * delta
	if position.y < 0 or position.x > 720 or position.y > 480 or position.y < 0:
		respawn()

func respawn():
	randomize()
	position.x = randf_range(10, 710)
	position.y = 0
	velocity = Vector2(randf_range(-250, 250), randf_range(100, 340))

	
