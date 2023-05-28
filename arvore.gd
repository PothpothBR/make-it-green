extends Node2D

var semente: bool = true
var muda: bool = false

@onready var col = get_node("StaticBody2D/Collision")

func _ready():
	col.disabled = true

func _process(_delta):
	if muda:
		var muda_node = get_node("Muda")
		if muda_node.scale.x <= 1.2:
			muda_node.scale += Vector2(.00001/2, .00001/2)
			muda_node.position -= Vector2(0, .00045/2)

func _on_timer_timeout():
	if semente:
		col.disabled = false
		muda = true
		semente = false
		get_node("Semente").visible = false
		get_node("Muda").visible = true
		var timer = get_node("Timer")
		timer.stop()
		timer.set_wait_time(15)
		timer.start()
		
	elif muda:
		muda = false
		get_node("Muda").visible = false
		get_node("Arvore").visible = true
