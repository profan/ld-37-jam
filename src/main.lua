-- global shite

require "defines"

-- states shit

Gamestate = require "hump.gamestate"

-- debug stuff

require "cupid.debug"

local lw = love.window
local lg = love.graphics
local lt = love.timer

function draw_debug()

    local fps = lt.getFPS()
    local delta = lt.getAverageDelta()
    local kb_of_mem = collectgarbage("count")

    local w, h = lg.getDimensions()
    local x = w - 176
    local y = 16

    lg.print(string.format("FPS: %f", fps), x, y)
    y = y + 16

    lg.print(string.format("Frametime: %f", delta), x, y)
    y = y + 16

    lg.print(string.format("Memory Usage (kB): %d", kb_of_mem), x, y)
    y = y + 16

end

TileMap = require "tilemap"

local map_data = require "level"
local map = TileMap(map_data, nil)

function draw_game()

    map:draw()

end

-- game states?

local GameState = require "states.game"
local MenuState = require "states.menu"
local PauseState = require "states.pause"

-- love functions go here

function love.load()

    -- create menu states and stuff
    local pause_state = PauseState()

    local game_state = GameState()
    game_state.pause_state = pause_state

    local menu_state = MenuState()
    menu_state.game_state = game_state
    -- what the fucl

    -- set up initial state
    Gamestate.switch(menu_state)

end

function love.keypressed(key, scancode, isrepeat)

    Gamestate.keypressed(key, scancode, isrepeat)

end

function love.keyreleased(key, scancode, isrepeat)

    Gamestate.keyreleased(key, scancode, isrepeat)

end

function love.update(dt)

    if love.keyboard.isDown "escape" then
        love.event.push "quit"
    end

    Gamestate.update(dt)

end

function love.draw()

    draw_debug()
    Gamestate.draw()

end
