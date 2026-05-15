extends Node2D

func _ready():
	Global.current_level = 3

	Global.collected_fruits = 0

	await get_tree().process_frame

	var frutas = get_tree().get_nodes_in_group("frutas")
	Global.total_fruits = frutas.size()
