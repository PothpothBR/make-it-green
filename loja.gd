extends CanvasLayer

@onready var loja: CanvasLayer = get_node(".")
var gameState

func _ready():
	pass

func _process(delta):
	if !gameState["pause"]:
		if Input.is_action_just_pressed("temp"):
			loja.visible = !(loja.visible)
			gameState["inventario"] = !gameState["inventario"]
			print(loja.visible)
