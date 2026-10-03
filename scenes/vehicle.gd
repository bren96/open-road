extends VehicleBody3D

const STEER_SPEED = 1.5
const STEER_LIMIT = 0.4
const MAX_SPEED = 5.0

var _steer_target := 0.0
var _engine_force_target := 40.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	print(engine_force)
	
	# first handle steering
	if Input.is_action_pressed(&"turn_left"):
		on_turn_left(delta)
	
	if Input.is_action_pressed(&"turn_right"):
		on_turn_right(delta)

	# then handle acceleration
	if Input.is_action_pressed(&"accelerate"):
		on_acceleration();
	else:
		# if not accelerating, set baseline force to zero
		# for later check for reverse
		engine_force = 0.0
	if Input.is_action_pressed(&"reverse"):
		on_reverse();
	


func on_acceleration() -> void:
	var speed := linear_velocity.length()
	if speed < MAX_SPEED and not is_zero_approx(speed):
		engine_force = clamp_speed(speed)
	else:
		engine_force = _engine_force_target


func on_reverse() -> void:
	var speed := linear_velocity.length()
	if speed < MAX_SPEED and not is_zero_approx(speed):
		engine_force = -1 * clamp_speed(speed)
	else:
		engine_force = -1 * _engine_force_target


func on_turn_left(delta) -> void:
	steering = move_toward(
		steering,
		STEER_LIMIT,
		STEER_SPEED * delta
	)

func on_turn_right(delta) -> void:
	steering = move_toward(
		steering,
		STEER_LIMIT * -1,
		STEER_SPEED * delta
	)

func clamp_speed(speed: float) -> float:
	return clampf(
		_engine_force_target * 5.0 / speed,
		0.0,
		100.0
	)
