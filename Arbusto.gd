extends Node2D

var regado = false
var adubado = false
var tipo = "Planta"

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

func regar():
	if !regado:
		regado = true
		var timer = get_node("Timer")
		timer.set_wait_time(12)
		timer.start()

func adubar():
	if !adubado:
		_on_timer_timeout()
		adubado = true
