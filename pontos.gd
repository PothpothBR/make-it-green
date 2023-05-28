extends CanvasLayer
class_name Pontos

var pontos = 0

@onready var label: RichTextLabel = get_node("HBoxContainer/RichTextLabel")

func _ready():
	label.set_text("Pontos: 0")

func adicionar(pontos_adicionar):
	pontos += pontos_adicionar
	label.set_text("Pontos: {pontos}".format({"pontos": pontos}))
	
func remover(pontos_remover):
	pontos -= pontos_remover
	label.set_text("Pontos: {pontos}".format({"pontos": pontos}))
