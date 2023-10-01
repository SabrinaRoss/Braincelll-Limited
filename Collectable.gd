extends RigidBody2D

var target = null


# Called when the node enters the scene tree for the first time.
func _ready():
	#$CollisionShape2D.disabled = true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if target != null:
		var difference = target.position - position
		var distance = difference.length() - target.collectable_distance
		
		if distance > 0.0:
			var direction = difference / difference.length()
			var mult = (distance / target.collectable_leniance)**target.collectable_forcefulness
			var force = direction * mult
			self.apply_central_force(force)


func _on_body_entered(body):
	if body.is_in_group("Players"):
		target = body
		body.held_collectables.push_back(self)
