extends CanvasLayer

@onready var coleta = get_node("Control/VBoxContainer/coleta_lixo")
@onready var reciclagem = get_node("Control/VBoxContainer/reciclar_lixo")
@onready var area_limpa = get_node("Control/VBoxContainer/limpar_area")
@onready var arvores_plantadas = get_node("Control/VBoxContainer/plantar_arvore")
var lixoTotal: int
var limpeza_area: int

func _ready():
	coleta.text = "Coleta do lixo: 0/10"
	reciclagem.text = "Reciclagem: 0/10"
	area_limpa.text = "Limpeza da Área: 0/10"
	arvores_plantadas.text = "Árvores Plantadas: 0/10"

func coletar(lixoAtual: int) -> void:
	var lixoDestruido: int = lixoTotal - lixoAtual
	if lixoDestruido < 10:
		coleta.text = "Coleta do lixo: {total}/10".format({"total": lixoDestruido})
	else:
		coleta.text = "[color=green][s]-Coleta do Lixo: {total}/10[/s][/color]".format({"total": lixoDestruido})

func reciclado(lixoAtual: int) -> void:
	var lixo_reciclado: int = lixoTotal - lixoAtual
	if lixo_reciclado < 10:
		reciclagem.text = "Reciclagem do lixo: {total}/10".format({"total": lixo_reciclado})
	else:
		reciclagem.text = "[color=green][s]-Reciclagem do Lixo: {total}/10[/s][/color]".format({"total": lixo_reciclado})

func limpar(lixoAtual: int) -> void:
	var limpeza: int = limpeza_area - lixoAtual
	if limpeza < 10:
		area_limpa.text = "Limpeza da Área: {total}/10".format({"total": limpeza})
	else:
		area_limpa.text = "[color=green][s]-Limpeza da Área: {total}/10[/s][/color]".format({"total": limpeza})
#conseguir alterar o valor diretamente
#conseguir incrementar valor
func plantar(arvore: int) -> void:
	var arv_plan: int = arvore
	if arv_plan < 10:
		arvores_plantadas.text = "Arvores plantadas: {total}/10".format({"total": arv_plan})
	else:
		arvores_plantadas.text = "[color=green][s]-Arvores plantadas: {total}/10[/s][/color]".format({"total": arv_plan})
