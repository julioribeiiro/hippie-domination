extends StaticBody2D

var player

func _ready():
#	player = get_parent().get_parent().get_child(1)
#	position.y =  player.position.y
#	position.x =  player.position.x + 30
	pass


func converted():
	$AnimationPlayer.play("coverting")

func disapear():
	$".".queue_free()

func _process(delta):
	pass
#	print('vilan: '+String(position))
