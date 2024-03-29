function love.conf(t)
    t.author = "profan"
    t.identity = nil
    t.version = "0.10.1"
    t.release = false
    t.console = false

    t.window.title = "LD37"
    t.window.icon = nil
    t.window.width = 640
    t.window.height = 480
    t.window.vsync = true
    t.window.fsaa = 0
    t.window.fullscreen = false
    t.window.borderless = false
    t.window.resizable = false
    t.window.highdpi = false
    t.window.srgb = false
    t.window.display = 2

    t.modules.audio = true
    t.modules.event = true
    t.modules.graphics = true
    t.modules.image = true
    t.modules.math = true
    t.modules.mouse = true
    t.modules.sound = true
    t.modules.system = true
    t.modules.timer = true
    t.modules.thread = false
    t.modules.joystick = false
    t.modules.physics = false
end
