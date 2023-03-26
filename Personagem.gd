extends CharacterBody2D

@export var velocidade: float = 300.0
@onready var _animation_player = get_node("AnimatedSprite2D")

func mover():
	var input_direction: Vector2 = Vector2(Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"), 
	Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up"))
		
	input_direction = input_direction.normalized()
	
	velocity = input_direction * velocidade

func _physics_process(delta):
	mover()
	if Input.is_action_pressed("ui_right"):
		_animation_player.play("Direita")
	elif Input.is_action_pressed("ui_left"):
		_animation_player.play("Esquerda")
	elif Input.is_action_pressed("ui_up"):
		_animation_player.play("Cima")
	elif Input.is_action_pressed("ui_down"):
		_animation_player.play("Baixo")
	else:
		_animation_player.stop()
	move_and_slide()
