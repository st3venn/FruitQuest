extends Node2D

## Tamaño de cada anilla: 6pixeles

var floorDetected = false
var safeTimeOut = false
var rayCastInitValue = 36 # pixeles iniciales raycast

# Called when the node enters the scene tree for the first time.
func _ready():
	$raycast_floor_detection.target_position.y = rayCastInitValue
	$safeTime.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not floorDetected && safeTimeOut:
		$raycast_floor_detection.target_position.y += 6
		if $raycast_floor_detection.is_colliding():
			floorDetected = true
			$raycast_floor_detection.target_position.y -= 6
			init_spikeball()


func init_spikeball():
	var numberOfChains = ($raycast_floor_detection.target_position.y - rayCastInitValue) / 6
	$SpikedBall.position.y += (numberOfChains * 6)

func _on_safe_time_timeout() -> void:
	pass # Replace with function body.
