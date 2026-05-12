extends Control

func _on_salir_pressed():
	get_tree().quit()


func _on_reiniciar_2_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file(Global.current_scene)
