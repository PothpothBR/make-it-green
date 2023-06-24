extends Node2D

var semente: bool = true
@onready var Pontos = get_node("/root/Raiz/HUD/Pontos")
@onready var col = get_node("StaticBody2D/Collision")

func _ready():
	Pontos.adicionar(2)
	col.disabled = true

func _on_timer_timeout():
	if semente:
		col.disabled = false
		semente = false
		get_node("Semente").visible = false
		get_node("Arbusto").visible = true
		var timer = get_node("Timer")
		timer.stop()
		Pontos.adicionar(10)
