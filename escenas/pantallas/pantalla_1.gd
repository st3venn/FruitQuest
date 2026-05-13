extends Node2D

func _ready():
	Global.current_level = 1
	Global.total_fruits = 0
	Global.collected_fruits = 0

	var frutas = get_tree().get_nodes_in_group("frutas")

	Global.total_fruits = frutas.size()
