extends TileMap

func _ready():

	Global.total_fruits = 0
	Global.collected_fruits = 0

	var frutas = get_tree().get_nodes_in_group("frutas")

	Global.total_fruits = frutas.size()
