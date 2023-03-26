extends CharacterBody2D

@export var velocidade: float = 150

@onready var animacao = get_node("AnimatedSprite2D")
@onready var interacao = get_node("AreaInteracao/ColisaoInteracao")

func mover():
	if Input.is_action_pressed("ui_shift"):
		velocidade = 300
		animacao.speed_scale = 2
	else:
		velocidade = 150
		animacao.speed_scale = 1
	var direcao: Vector2 = Vector2(0,0)
	
	if Input.is_action_pressed("ui_down"):
		direcao.y += 1
		interacao.position.y = 31
		interacao.position.x = 0
	elif Input.is_action_pressed("ui_up"):
		direcao.y -= 1
		interacao.position.y = 3
		interacao.position.x = 0
	
	if Input.is_action_pressed("ui_right"):
		direcao.x += 1
		interacao.position.y = 17
		interacao.position.x = 23
	elif Input.is_action_pressed("ui_left"):
		direcao.x -= 1
		interacao.position.y = 17
		interacao.position.x = -23
		
	direcao = direcao.normalized()
	
	velocity = direcao * velocidade

func _physics_process(delta):
	
	interacao.disabled = true
	if Input.is_action_just_pressed("interact"):
		interacao.disabled = false
	mover()
	if Input.is_action_pressed("ui_right"):
		animacao.play("Direita")
	elif Input.is_action_pressed("ui_left"):
		animacao.play("Esquerda")
	elif Input.is_action_pressed("ui_up"):
		animacao.play("Cima")
	elif Input.is_action_pressed("ui_down"):
		animacao.play("Baixo")
	else:
		animacao.stop()
		
	move_and_slide()

func areaDentro(area):
	area.get_parent().get_parent().tempoDeVida = 0.0
