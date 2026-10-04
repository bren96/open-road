extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# evyer n frames, procedurally generate
	if Engine.get_process_frames() % 150 == 0:
		handle_proc_generation()


func handle_proc_generation() -> void:
	# generate next segment
	# add segment to scene
	var next_segment = generate_next_road_segment()
	add_child(next_segment)
	print(next_segment.position)


func generate_next_road_segment() -> Node3D:
	# get last segment
	# duplicate as next segment
	# transform ahead of previous
	var last_segment = get_child(-1)
	var next_segment = last_segment.duplicate()
	next_segment.position.z += 6.0
	return next_segment
