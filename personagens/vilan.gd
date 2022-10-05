extends StaticBody2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func converted():
	$AnimationPlayer.play("coverting")
	print("converted")

func disapear():
	$".".queue_free()
#func _process(delta):
#	pass
