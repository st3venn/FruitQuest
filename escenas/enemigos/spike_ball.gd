extends Node2D

var floorDetected = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not floorDetected:
		$raycast_floor_detection.target_position.y +=5
		if $raycast_floor_detection.is_colliding():
			floorDetected = true
			print("Suelo Detectado", $raycast_floor_detection.target_position.y)
