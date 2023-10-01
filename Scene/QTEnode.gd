extends Node2D

var qte_icons = {
	"A": preload("res://Letter_Asset/a.png"),
	"B": preload("res://Letter_Asset/b.png")
}

@onready var qte_sprite = $QTEnode
func show_qte(key:String):
	if qte_icons.has(key):
		qte_sprite.text = load(qte_icons[key])
		self.show()
	else:
		print("Invalid QTEKey: ", key)

func hide_qte():
	self.hide()

# Called when the node enters the scene tree for the first time.
func _ready():
	show_qte("A")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
