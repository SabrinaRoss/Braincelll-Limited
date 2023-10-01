extends Area2D

@export var wants_items = ["wrench"]
@export var consumes_items = true

var collectable_distance = 0.0
var collectable_leniance = 1.0
var collectable_forcefulness = 2
var held_collectables = []

var state = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Check ofr overlapping bodies
	# Must do here and not in _on_body_entered becuase we might already be overlapping
	for body in get_overlapping_bodies():
		if held_collectables.find(body) != -1:
			print("Despawn item")
			held_collectables.remove_at(held_collectables.find(body))
			body.queue_free()


func _on_body_entered(body):
	if body.is_in_group("Players"):
		# Get all held item names
		var held_item_names = []
		for item in body.held_collectables:
			held_item_names.push_back(item.item_name)
		
		# Get consumed bodies
		var bodies = []
		for wanted_item in wants_items:
			var i = held_item_names.find(wanted_item)
			if i != -1:
				bodies.push_back(body.held_collectables[i])
		
		if bodies.size() == wants_items.size():
			print("satisfied")
			if consumes_items:
				for i_body in bodies:
					# Remove bodies from player held items
					body.held_collectables.remove_at(body.held_collectables.find(i_body))
					# Set target to self
					i_body.target = self
					i_body.can_pick_up = false
					# Add to our held items (removal queue)
					held_collectables.push_back(i_body)
			# Spawn cool particles
			$CPUParticles2D.emitting = true
			$AnimatedSprite2D.frame = 1
			state = true
		else:
			print("not satisfied")


func _on_body_exited(body):
	pass
