extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var infocus = false

# Called when the node enters the scene tree for the first time.
func _ready():
	sing.energy_threshold += sing.battery_cap
	$interact/level.hide()
	$interact/credsreq.hide()
	$interact/instructions.text = "press X to remove"
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if infocus and Input.is_action_just_pressed("delete"):
		print("deleting",self)
		sing.energy_threshold -=sing.battery_cap
		self.queue_free()
#	pass


func _on_Area_area_entered(area):
	if area.name == "cursor":
		$RootNode/Mesh/outline.show()
		get_node("interact").show()
		#Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		infocus = true
	else:
		$RootNode/Mesh/outline.hide()
		get_node("interact").hide()
		infocus = false
	pass # Replace with function body.


func _on_Area_area_exited(area):
	if area.name == "cursor":
		$RootNode/Mesh/outline.hide()
		get_node("interact").hide()
		infocus = false
	else:
		$RootNode/Mesh/outline.show()
		get_node("interact").hide()
		infocus = false
