extends Area2D

@export var next_scene_path: String

var can_pass = false


func _on_body_entered(body):

	if body.name == "ninjacat":

		print(Global.collected_fruits)
		print(Global.total_fruits)

		if Global.collected_fruits == Global.total_fruits:

			can_pass = true
			change_scene()


func change_scene():

	if can_pass:
		Global.total_fruits = 0
		Global.collected_fruits = 0

		get_tree().change_scene_to_file(next_scene_path)
