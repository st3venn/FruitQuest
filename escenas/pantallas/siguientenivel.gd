extends Area2D

var can_pass = false

func _on_body_entered(body):

	if body.name != "ninjacat":
		return

	if Global.total_fruits <= 0:
		return

	if Global.collected_fruits == Global.total_fruits:
		can_pass = true
		change_scene()


func change_scene():

	if not can_pass:
		return

	Global.total_fruits = 0
	Global.collected_fruits = 0

	call_deferred("_go_next")


func _go_next():

	if get_tree().current_scene.scene_file_path.ends_with("pantalla3.tscn"):
		get_tree().change_scene_to_file("res://escenas/MENU/victoria.tscn")
	else:
		get_tree().change_scene_to_file("res://escenas/MENU/nivelcompletado.tscn")
