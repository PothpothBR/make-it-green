extends CharacterBody2D

@export var velocidade: float = 150

@onready var player: CharacterBody2D = get_node(".")
@onready var animacao = get_node("AnimatedSprite2D")
@onready var interacao = get_node("AreaInteracao/ColisaoInteracao")
@onready var circulo = get_node("CollisionShape2D")
@onready var seta = get_node("CollisionShape2D/Sprite2D")
@onready var lixoPerto: Vector2 = Vector2()
@onready var Pontos = get_node("/root/Raiz/HUD/Pontos")

const Arvore: PackedScene = preload("res://arvore.tscn")
const Arbusto: PackedScene = preload("res://Arbusto.tscn")

var arvoreAtual = null

var lixoTotal = 0
var lixoAtual = 0

var inventario

var lixeira

var objetivos

var gameState
var save

var pause
var loja
var hud

func mover() -> void:
	if Input.is_action_pressed("ui_shift"):
		velocidade = 300
		animacao.speed_scale = 2
	else:
		velocidade = 150
		animacao.speed_scale = 1
	var direcao: Vector2 = Vector2(0,0)
	
	if Input.is_action_pressed("ui_down"):
		direcao.y += 1
		interacao.position.y = 33
		interacao.position.x = 0
	elif Input.is_action_pressed("ui_up"):
		direcao.y -= 1
		interacao.position.y = 1
		interacao.position.x = 0
	
	if Input.is_action_pressed("ui_right"):
		direcao.x += 1
		interacao.position.y = 17
		interacao.position.x = 20
	elif Input.is_action_pressed("ui_left"):
		direcao.x -= 1
		interacao.position.y = 17
		interacao.position.x = -20
		
	direcao = direcao.normalized()
	
	velocity = direcao * velocidade
	
func animar() -> void:
	if Input.is_action_pressed("ui_right"):
		animacao.play("Direita")
	elif Input.is_action_pressed("ui_left"):
		animacao.play("Esquerda")
	elif Input.is_action_pressed("ui_down"):
		animacao.play("Baixo")
	elif Input.is_action_pressed("ui_up"):
		animacao.play("Cima")
	else:
		animacao.stop()

func interagir() -> void:
	interacao.disabled = true
	if Input.is_action_just_pressed("interact"):
		interacao.disabled = false

# retorna se a ação de plantar teve sucesso ou não
func plantarArvore() -> bool:
	var arve = Arvore.instantiate()
	arve.position = self.position
	get_node("/root").add_child(arve)
	objetivos.plantar(1)
	return true
	
func plantarArbusto() -> bool:
	var arbo = Arbusto.instantiate()
	arbo.position = self.position
	get_node("/root").add_child(arbo)
	objetivos.plantar(1)
	return true
		
func apontaLixoPerto() -> void:
	var lixos = get_tree().get_nodes_in_group("lixo")
	
	if lixos.size() != 0:
		var minVec = lixos[0].position
		var min = Vector2(abs(player.position.x - lixos[0].position.x), abs(player.position.y - lixos[0].position.y))
		
		for i in range(1, lixos.size()):
			var nmin = Vector2(abs(player.position.x - lixos[i].position.x), abs(player.position.y - lixos[i].position.y))
			
			if nmin.length() < min.length():
				var c = lixos[i].get_child(0).get_child(1)
				minVec = lixos[i].position
				minVec.x += c.shape.size.x / 2
				minVec.y += c.shape.size.y / 2
				min = nmin
				
		player.lixoPerto = minVec
	else:
		seta.visible = false
		
func updateHUD():
	for i in hud.get_children():
		i.visible = !i.visible

func _physics_process(delta):
	
	apontaLixoPerto()
	
	var posicao: Vector2 = player.position
	
	circulo.rotation = posicao.angle_to_point(lixoPerto)
	
	if !gameState["pause"]:
		if Input.is_action_just_pressed("inventory"):
			if !loja.visible:
				inventario.visible = !(inventario.visible)
				gameState["inventario"] = !gameState["inventario"]
				animacao.stop()
				updateHUD()
		if Input.is_action_just_pressed("temp"):
			if !inventario.visible:
				loja.visible = !(loja.visible)
				gameState["inventario"] = !gameState["inventario"]
				animacao.stop()
				updateHUD()

		if !gameState["inventario"]:
			interagir()
			
			mover()
			
			animar()
				
			move_and_slide()
	else:
		animacao.stop()
		

func areaDentro(area):
	var obj = area.get_parent().get_parent()
	
	# ação de recolher o lixo
	if obj.tipo == "Lixo":
		obj.tempoDeVida = 0.0
		inventario.addItem(obj)
		Pontos.adicionar(1)
		objetivos.coletar(1)
	# ação de interagir com a lixeira
	elif obj.tipo == "Lixeira":
		obj.add(inventario)
		inventario.clear()
	# acção de regar
	elif obj.tipo == "Arvore" || obj.tipo == "Arbusto":
		arvoreAtual = obj
		print(obj)
