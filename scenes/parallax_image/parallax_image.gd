extends Parallax2D

@onready var sprite_2d: Sprite2D = $Sprite2D
@export var texture: Texture2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var scale_f = get_viewport_rect().size.y / texture.get_height()
	sprite_2d.texture = texture
	sprite_2d.scale = Vector2(scale_f, scale_f)
	repeat_size.x = texture.get_width() * scale_f

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	screen_offset.x += (GameManager.SCROLL_SPEED * delta) 
