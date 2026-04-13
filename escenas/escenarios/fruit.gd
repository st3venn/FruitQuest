@tool
extends Node2D


@export_enum("apple", "banana", "cherry") var fruitType:String = "apple":
	set(value):
		fruitType = value
		print(value)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
