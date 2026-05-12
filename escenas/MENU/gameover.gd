extends Control

func _on_reiniciar_pressed():
	get_tree().reload_current_scene()

func _on_salir_pressed():
	get_tree().quit()
