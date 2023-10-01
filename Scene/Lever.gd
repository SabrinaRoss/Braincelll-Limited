extends Area2D

@export var wants_items = ["wrench"]
@export var consumes_items = true

@export var collectable_distance = 0.0
@export var collectable_leniance = 1.0
@export var collectable_forcefulness = 2
var held_collectables = []

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body.is_in_group("Players"):
		var satisfied = true
		
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
			$AnimatedSprite2D.frame = 1
			if consumes_items:
				# Remove bodies from player held items
				for i_body in bodies:
					body.held_collectables.remove_at(held_item_names.find(i_body))
				for i_body in bodies:
					i_body.target = self
					i_body.can_pick_up = false
					held_collectables.push_back(i_body)
			$CPUParticles2D.emitting = true
		else:
			print("not satisfied")
	elif held_collectables.find(body) != -1:
		print("Despawn item")
		held_collectables.remove_at(held_collectables.find(body))
		body.queue_free()


func _on_body_exited(body):
	pass
