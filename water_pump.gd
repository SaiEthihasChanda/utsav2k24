extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var infocus = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _process(delta):
	if infocus and Input.is_action_just_pressed("water") and not sing.bucket>=100:
		sing.bucket +=10
	
	else:
		$interact/level.hide()
		$interact/credsreq.hide()
		$interact/instructions.text = "press Q to fill bucket"
	

func _on_Area_area_entered(area):
	if area.name == "cursor":
		$RootNode/water_pump/outline.show()
		get_node("interact").show()
		#Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		infocus = true
	else:
		$RootNode/water_pump/outline.hide()
		get_node("interact").hide()
		infocus = false


func _on_Area_area_exited(area):
	if area.name == "cursor":
		$RootNode/water_pump/outline.hide()
		get_node("interact").hide()
		infocus = false
	else:
		$RootNode/water_pump/outline.show()
		get_node("interact").hide()
		infocus = false
