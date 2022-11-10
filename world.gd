extends Node2D

onready var vilan = preload("res://personagens/vilan1.tscn")
var time = 0
var player
const initial_ground = preload("res://floor_area/A.tscn")

var segments = [
	preload("res://floor_area/A.tscn"),
#	preload("res://floor_area/b.tscn"),
#	preload("res://floor_area/C.tscn"),
]


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	var inst = initial_ground.instance()
	inst.position = Vector2(0,550)
	$floor.add_child(inst)
	spawn_inst(1024, 550)
	player = get_children()[1].get_children()[0]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time += 1
	for area in $floor.get_children():
		if area.position.x - player.position.x < -1350:
			spawn_inst(area.position.x+2048, 550)
			area.queue_free()
	
	if (time % 10 == 0):
		var inst = vilan.instance()
		inst.position = Vector2($floor.get_children()[1].position.x+1024, 512)
		$villan.add_child(inst)


func spawn_inst(x, y):
	var inst = segments[randi() % len(segments)].instance()
	inst.position = Vector2(x,y)
	$floor.add_child(inst)

func lose():
	get_tree().reload_current_scene()
