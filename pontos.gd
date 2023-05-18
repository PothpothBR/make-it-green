extends CanvasLayer

@onready var label: RichTextLabel = get_node("HBoxContainer/RichTextLabel")

func _ready():
	label.set_text("Pontos: 0")

func update(pontos):
	label.set_text("Pontos: {pontos}".format({"pontos": pontos}))
