extends Node3D

const options = [
	"building-skyscraper-a",
	"building-skyscraper-b",
	"building-skyscraper-c",
	"building-skyscraper-d",
	"building-skyscraper-e",
]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# randomly toggle a different skyscraper option
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
