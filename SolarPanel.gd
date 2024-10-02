extends Spatial

# Declare member variables here
var time_passed: float = 0.0  # Variable to track time
var infocus = false


# Called when the node enters the scene tree for the first time
func _ready():
	print(sing.energy_points)
	sing.levels[self.get_node("SolarPanel")] = 1
	print(sing.levels)
# Called every frame
func _process(delta):
	if infocus and Input.is_action_just_pressed("delete"):
		print("deleting",self)
		self.queue_free()
	self.get_node("RootNode/interact/level").text = str("current level:",sing.levels[self.get_node("SolarPanel")] )
	if sing.levels[self.get_node("SolarPanel")] <4:
		$"RootNode/interact/credsreq".text = str("energy required for upgrade:", 150*(sing.levels[self.get_node("SolarPanel")]+1))
	else:
		$RootNode/interact/level.hide()
		$RootNode/interact/credsreq.hide()
		$RootNode/interact/instructions.text = "press X to delete"
	
	time_passed += delta  # Accumulate time passed
	if time_passed >= (6.0-(sing.levels[self.get_node("SolarPanel")])) and  sing.energy_points <=sing.energy_threshold :  # Check if 5 seconds have passed
		sing.energy_points += 1  # Increment energy points
		print(sing.energy_points)
		time_passed = 0.0  # Reset the timer


func _on_Area_area_entered(area):
	if area.name == "cursor":
		$RootNode/solarpanel/outline.show()
		$RootNode/interact.show()
		#Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		infocus = true
	else:
		$RootNode/solarpanel/outline.hide()
		$RootNode/interact.hide()
		infocus = false
	pass # Replace with function body.


func _on_Area_area_exited(area):
	if area.name == "cursor":
		$RootNode/solarpanel/outline.hide()
		$RootNode/interact.hide()
		infocus = false
		
	else:
		$RootNode/solarpanel/outline.show()
		$RootNode/interact.show()
		infocus = true
	pass # Replace with function body.


func _on_AudioStreamPlayer3D_finished():
	$AudioStreamPlayer3D.play()
	pass # Replace with function body.


func _on_AudioStreamPlayer3D2_finished():
	pass # Replace with function body.
