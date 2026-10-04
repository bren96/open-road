extends Node3D

const options = [
	"building-a",
	"building-b",
	"building-c",
	"building-d",
	"building-e",
	"building-f",
	"building-g",
	"building-h",
	"building-i",
	"building-j",
	"building-k",
	"building-l",
	"building-m",
]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# randomly toggle a different building option
	var random_option = options.pick_random()
	var next_node = find_child(random_option)
	if next_node == null:
		next_node = get_child(0)
	set_all_children_visibility(false)
	next_node.visible = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
	
func set_all_children_visibility(visible: bool) -> void:
	for child in get_children():
		child.visible = visible
