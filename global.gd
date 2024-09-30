extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var energy_points = 30
var energy_threshold = 1000
var elements = {
	"solar":1,
	"turbine":1,
	"battery":1,
	"trees": 0
}
var levels ={
	
}

# Called when the node enters the scene tree for the first time.
func _ready():
	print("global ready")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _physics_process(delta):
	#print(energy_points)
