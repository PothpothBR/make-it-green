extends CanvasLayer

var gameState
#itens do inventario
var inventario
func _ready():
#	self.inventario = get_node("/root").inventario
	pass
func create_texture():
	#criando uma nova instancia de atlas texture
	var texture = AtlasTexture.new()
	#carregando o path 
	texture.atlas = load("res://resources/Sprit-Itens.png")
	#criando a regioa vazia
	texture.region = Rect2()
	#retornando o texture
	return texture

func delimitando_regiao_atlas(texture_atlas, sprite, rect):
	var regiao = texture_atlas.atlas_rect_region(rect)
	texture_atlas.add_region(sprite, regiao)

func usar_atlas():
	#criando um novo sprite
	var sprite = Sprite2D.new()
	#chamando a função create texture
	var texture_atlas = create_texture()
	#configurando o sprite
	sprite.texture = texture_atlas
	sprite.set_texture(texture_atlas)
	# Define a região do atlas para o sprite
	sprite.set_region(Rect2(0, 0, 64, 64))
	add_child(sprite)
	# Defina o retângulo desejado para delimitar a região do atlas
	var rect = Rect2(0, 0, 64, 64)	
	# Chama a função para delimitar a região do atlas
	delimitando_regiao_atlas(texture_atlas, sprite, rect)  




#-----------------itens de plantação-----------------
func on_comprar_semente_arvore():
	#saber qual item tem que ser carregado
	#criar um atlas texture programaticamente
	#configurar o atlas texture(carregar arquivo de sprites,selecionar a regiao do item)
	#achar inventario com get_node("/root").inventario
	#adcionar um item ao inventario(nome,atlas texture)
	pass
func on_comprar_semente_arbusto():
	pass
func on_comprar_regador():
	pass
func on_comprar_fertilizante():
	pass
#-----------------Mochilas-----------------
func on_comprar_mochila_1():
	pass
func on_comprar_mochila_2():
	pass
func on_comprar_mochila_3():
	pass
func on_comprar_mochila_4():
	pass

