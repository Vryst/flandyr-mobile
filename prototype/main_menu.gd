
extends Control


func _ready():
    set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
    RenderingServer.set_default_clear_color(Color.BLACK)
    
    await get_tree().process_frame
    
    var screen = get_viewport_rect().size
    
    $title.set_anchors_and_offsets_preset(Control.PRESET_CENTER_TOP)
    $title.position.y = screen.y * 0.2
    $title.position.x = (screen.x - $title.size.x) / 2
    
    $startGame.set_anchors_and_offsets_preset(Control.PRESET_CENTER_TOP)
    $startGame.position.y = screen.y * 0.8
    $startGame.position.x = (screen.x - $startGame.size.x) / 2
        
    $AnimationPlayer.play("fade")
    
    $AudioStreamPlayer2D.volume_db = -20
    $AudioStreamPlayer2D.play()
    
    var tween = create_tween()
    tween.tween_property($AudioStreamPlayer2D, "volume_db",0.0,1.0)
    
