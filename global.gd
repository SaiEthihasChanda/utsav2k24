extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var bucket = 100
var energy_points = 500
var energy_threshold = 600
var elements = {
	"solar":1,
	"turbine":1,
	"battery":1,
	"trees": 0
}
var levels ={
	
}
var trees = []
var cost = {
	"solar":150,
	"turbine":300
}

# Called when the node enters the scene tree for the first time.
func _ready():
	print("global ready")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _physics_process(delta):
	#print(energy_points)
