extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var placeok = true
var infocus = false

# Called when the node enters the scene tree for the first time.
func _ready():
	sing.elements["trees"]+=1
	print(sing.elements["trees"])
	sing.trees.append(self)
	$interact/level.hide()
	$interact/credsreq.hide()
	$interact/instructions.text = "press X to remove"
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _process(delta):
	if infocus and Input.is_action_just_pressed("delete"):
		print("deleting",self)
		self.queue_free()
		

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
		if not sing.energy_points+100 > sing.energy_threshold:
			sing.energy_points +=100 
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
