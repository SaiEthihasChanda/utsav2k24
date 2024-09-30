extends Spatial

# Declare member variables here
var time_passed: float = 0.0  # Variable to track time

# Called when the node enters the scene tree for the first time
func _ready():
	print(sing.energy_points)
	sing.levels[self.get_node("RootNode/Stamm001/Turbine")] = 1
	print(sing.levels)

# Called every frame
func _process(delta):
	time_passed += delta  # Accumulate time passed
	if time_passed >= (6.0-(sing.levels[self.get_node("RootNode/Stamm001/Turbine")])) and  sing.energy_points <=sing.energy_threshold:  # Check if 5 seconds have passed
		sing.energy_points += 1  # Increment energy points
		print(sing.energy_points)
		time_passed = 0.0  # Reset the timer
