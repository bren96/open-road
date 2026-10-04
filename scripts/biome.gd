extends Node3D

const biome_options = [
	"building.tscn",
	"skyscraper.tscn"
]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# evyer n frames, procedurally generate
	if Engine.get_process_frames() % 150 == 0:
		handle_proc_generation()
		

func handle_proc_generation() -> void:
	# generate next biome block
	# add to biome tree
	var next_biome = generate_next_biome_block()
	add_child(next_biome)
	
func load_random_biome() -> Node3D:
	var random_biome = biome_options.pick_random()
	var scene = load("res://scenes/" + random_biome)
	return scene.instantiate()

	
func generate_next_biome_block() -> Node3D:
	# get last biome block
	# duplicate for next
	# update position
	# note: each biome scene randomized on init in sub-class
	var last_biome = get_child(-1)
	var next_biome = load_random_biome()
	next_biome.transform = last_biome.transform
	next_biome.position.z += 6
	return next_biome
