extends CharacterBody2D

@export var velocidade: float = 150

@onready var animacao = get_node("AnimatedSprite2D")

func mover():
	var direcao: Vector2 = Vector2(0,0)
	if Input.is_action_pressed("ui_right"):
		direcao.x += 1
	elif Input.is_action_pressed("ui_left"):
		direcao.x -= 1
		
	if Input.is_action_pressed("ui_down"):
		direcao.y += 1
	elif Input.is_action_pressed("ui_up"):
		direcao.y -= 1
		
	direcao = direcao.normalized()
	
	velocity = direcao * velocidade

func _physics_process(delta):
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
