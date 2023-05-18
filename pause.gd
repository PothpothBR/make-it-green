extends CanvasLayer

@onready var pause = get_node(".")

var gameState

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if Input.is_action_just_pressed("pause"):
		pause.visible = !(pause.visible)
		gameState["pause"] = !gameState["pause"]


func voltar():
	gameState["pause"] = false
	pause.visible = false


func sair():
	get_tree().change_scene_to_file("res://menu.tscn")
