extends CanvasLayer

@onready var label = get_node("RichTextLabel")
var lixoTotal: int

func _ready():
	label.text = "Objetivos:\n -Limpar lixo: 0/10"

func changeText(lixoAtual: int) -> void:
	var lixoDestruido: int = lixoTotal - lixoAtual
	if lixoDestruido < 10:
		label.text = "Objetivos:\n -Limpar lixo: {total}/10".format({"total": lixoDestruido})
	else:
		label.text = "Objetivos:\n [color=green][s]-Limpar lixo: {total}/10[/s][/color]".format({"total": lixoDestruido})
	
