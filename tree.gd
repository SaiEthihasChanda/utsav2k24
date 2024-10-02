extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var placeok = true
var infocus = false
var water_level = 100
var time_passed: float = 0.0

# Called when the node enters the scene tree for the first time.
func _ready():
	sing.elements["trees"]+=1
	print(sing.elements["trees"])
	sing.trees.append(self)
	$interact/level.hide()
	$interact/credsreq.hide()
	$interact/instructions.text = "press X to remove \nQ to water"
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _process(delta):
	if self.water_level == 0:
		sing.elements["trees"] -=1
		self.queue_free()
	$Spatial2/Viewport/Label.text = str(self.water_level,"/100")
	time_passed += delta  # Accumulate time passed
	if time_passed >= sing.rate_of_water_drain:  # Check if 5 seconds have passed
		self.water_level -=10 
		print(self.water_level)
		time_passed = 0.0
	if infocus and Input.is_action_just_pressed("delete"):
		print("deleting",self)
		sing.elements["trees"] -=1
		
		self.queue_free()
	if infocus and Input.is_action_just_pressed("water"):
		#if water_level+sing.bucket >=100:
		var req = 100 - self.water_level
		if req>sing.bucket:
			self.water_level +=sing.bucket_pour
			sing.bucket -=sing.bucket_pour
		else:
			self.water_level+=req
			sing.bucket -=req
				
			
		print("watered tree current level now",water_level, sing.bucket)
		

func _on_Area_body_entered(body):
	print(body.name)
	
	if body.name == "garden"  :
		print("valid placement")
		return
	if body.name == "landcoll":
		print("invalid placement")
		sing.elements["trees"]-=1
		sing.trees.erase(self)
		print(sing.trees)
		if not sing.energy_points+sing.tree_cost > sing.energy_threshold:
			sing.energy_points +=sing.tree_cost 
		else:
			sing.energy_points = sing.energy_threshold
		
		self.queue_free()
	pass # Replace with function body.


func _on_Area2_body_entered(body):
	print(body.name)
	if body.name == "cursor":
		$RootNode/tree_blocks_dark/outline.show()
	else:
		$RootNode/tree_blocks_dark/outline.hide()
		
	pass # Replace with function body.



func _on_Area2_area_entered(area):
	#print(area.name)
	if area.name == "cursor":
		$RootNode/tree_blocks_dark/outline.show()
		get_node("interact").show()
		#Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		infocus = true
	else:
		$RootNode/tree_blocks_dark/outline.hide()
		get_node("interact").hide()
		infocus = false
	pass # Replace with function body.


func _on_Area2_area_exited(area):
	if area.name == "cursor":
		$RootNode/tree_blocks_dark/outline.hide()
		get_node("interact").hide()
		infocus = false
	else:
		$RootNode/tree_blocks_dark/outline.show()
		get_node("interact").hide()
		infocus = false
	pass # Replace with function body.
