extends Area2D
@export var playerMovementSpeed=300;
var playerVelocity= Vector2.ZERO;
@export var jump_height:float;
@export var jump_acent_time:float;
@export var jump_decent_time:float;

@onready var jump_velocity:float =((2.0*jump_height)/jump_acent_time)*-1.0;
@onready var jump_gravity:float=((-2.0*jump_height)/jump_acent_time*jump_acent_time)*-1.0;
@onready var fall_gravity:float=((-2.0*jump_height)/jump_decent_time*jump_decent_time)*-1.0;
func _physics_process(delta: float) -> void:
	playerVelocity.x=get_input_velocity()*playerMovementSpeed;
	
	if(Input.is_action_just_pressed("jump")and is_on_floor):
		jump();
		
		playerVelocity=move_and_slide(playerVelocity, Vector2.UP)
func jump():
	
	
	pass
func get_input_velocity()->float:
		var hVelocity=0.0
		if(Input.is_action_pressed("move_left")):
			hVelocity-=1;
		if(Input.is_action_pressed("move_right")):
			hVelocity+=1;
		
		return hVelocity;
