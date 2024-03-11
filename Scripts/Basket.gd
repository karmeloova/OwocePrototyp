extends Area2D
var speed = 400;
var color = 0;
var isCollLeft = false
var isCollRight = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(Input.is_action_pressed("Right") and not(isCollRight) and not(Input.is_action_pressed("Left"))) : 
		position.x += speed*delta;
		if(isCollLeft) : isCollLeft = false;
	if(Input.is_action_pressed("Left") and not(isCollLeft) and not(Input.is_action_pressed("Right"))) : 
		position.x -= speed*delta;
		if(isCollRight) : isCollRight = false; #warunek, który mówi o tym, że dotknęliśmy ściany i skoro chcemy poruszać się w drugą stronę to musimy uaktywnić opcje poruszania się
	
	match color:
		0: $BasketPicture.modulate = Color.RED;
		1: $BasketPicture.modulate = Color.GREEN;
		2: $BasketPicture.modulate = Color.BLUE;
		3: $BasketPicture.modulate = Color.PURPLE;


func _input(event):
	if(Input.is_action_pressed("ChangeColor") ) :
		if(Input.is_key_pressed(KEY_1)) : color = 0;
		if(Input.is_key_pressed(KEY_2)) : color = 1;
		if(Input.is_key_pressed(KEY_3)) : color = 2;
		if(Input.is_key_pressed(KEY_4)) : color = 3;
		SignalManager.basketColor.emit(color)

func _on_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	if(area.name == "Left") : isCollLeft = true;
	if(area.name == "Right") : isCollRight = true;

