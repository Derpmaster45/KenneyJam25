extends CharacterBody2D
@export_category("Movement Properties")
@export var playerMoveSpeed:float= 300;
@export var air_jumps_total:int =1;
@export var jump_height:float=20.0;
@export var jump_time_to_peak:float=.5;
@export var jump_time_to_descent:float=.25;
var air_jumps_current:int=air_jumps_total;
@onready var jump_velocity:float=((2.0*jump_height)/jump_time_to_peak);
@onready var jump_gravity:float=((-2.0*jump_height)/jump_time_to_peak*jump_time_to_peak);
@onready var fall_gravity:float =((-2.0*jump_height)/jump_time_to_descent*jump_time_to_descent);

func _physics_process(delta):
	velocity.y+=get_gravity()*delta;
	velocity.x=get_horizontal_velocity()*playerMoveSpeed;
	
	if(Input.is_action_pressed("jump")):
		if(is_on_floor()):
			jump();
	if(air_jumps_current>0 and not is_on_floor()):
		air_jump();
	var playerDirection=Input.get_axis("move_left","move_right");
	if(playerDirection):
		velocity.x=playerDirection*playerMoveSpeed;
	else:
		velocity.x=move_toward(velocity.x,0,playerMoveSpeed);
	move_and_slide()
func get_horizontal_velocity()->float:
	var hVelocity=0.0;
	if(Input.is_action_pressed("move_left")):
		hVelocity-=1;
	if(Input.is_action_pressed("move_right")):
		hVelocity+=1;
	return hVelocity;
func jump():
	air_jumps_current-=1;
	velocity.y=jump_velocity;
func air_jump():
	air_jumps_current-=1;
	velocity.y=jump_velocity;
