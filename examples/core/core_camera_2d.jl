using Raylib

const screenw = 800
const screenh = 450

const maxbuildings = 100

initwindow(screenw, screenh, "raylib.jl [core] example - 2d camera")

spacing = 0

player = Rectangle(400, 280, 40, 40)
buildings = []
buildcolors = []

global spacing = 0

for i = 1:maxbuildings
    w = getrandomvalue(50, 200)
    h = getrandomvalue(100, 800)
    y = screenh - 130. - h
    x = -6000. + spacing

    push!(buildings, Rectangle(x, y, w, h))
    global spacing += w

    push!(buildcolors, Color(getrandomvalue(200, 240), getrandomvalue(200, 240), getrandomvalue(200, 250), 255))
end

camera = Camera2D(Vector2(screenw / 2., screenh / 2.),
                Vector2(player.x + 20., player.y + 20.),
                0., 1.)

settargetfps(60)

while !windowshouldclose()
    iskeydown(keyright) && (player.x += 2.)
    iskeydown(keyleft) && (player.x -= 2.)

    camera.target = Vector2(player.x + 20., player.y + 20.)

    iskeydown(keya) && (camera.rotation -= 1.)
    iskeydown(key_s) && (camera.rotation += 1.)

    camera.rotation > 40. && (camera.rotation = 40.)
    camera.rotation < -40. && (camera.rotation = -40.)

    camera.zoom += getmousewheelmove() * .05

    camera.zoom > 3. && (camera.zoom = 3.)
    camera.zoom < .1 && (camera.zoom = .1)

    if iskeypressed(keyr)
        camera.zoom = 1.
        camera.rotation = 0.
    end

    begindrawing()
        clearbackground(raywhite)

        beginmode2d(camera)
            drawrectangle(-6000, 320, 13000, 8000, darkgray)

            for i = 1:maxbuildings
                drawrectanglerec(buildings[i], buildcolors[i])
            end

            drawrectanglerec(player, red)

            drawline(trunc(Int, camera.target.x), trunc(Int, -screenh * 10.), trunc(Int, camera.target.x), trunc(Int, screenh * 10.), green)
            drawline(trunc(Int, -screenw * 10.), trunc(Int, camera.target.y), trunc(Int, screenw * 10.), trunc(Int, camera.target.y), green)
        endmode2d()

        drawtext("SCREEN AREA", 640, 10, 20, red)

        drawrectangle(0, 0, screenw, 5, red)
        drawrectangle(0, 5, 5, screenh - 10, red)
        drawrectangle(screenw - 5, 5, 5, screenh - 10, red)
        drawrectangle(0, screenh - 5, screenw, 5, red)

        drawrectangle(10, 10, 250, 113, fade(skyblue, .3))
        drawrectanglelines(10, 10, 250, 113, blue)

        drawtext("Free 2d camera controls:", 20, 20, 10, black)
        drawtext("- Right/Left to move Offset", 40, 40, 10, darkgray)
        drawtext("- Mouse Wheel to Zoom in-out", 40, 60, 10, darkgray)
        drawtext("- A / S to Rotate", 40, 80, 10, darkgray)
        drawtext("- R to reset Zoom and Rotation", 40, 100, 10, darkgray)
        
    enddrawing()
end

closewindow()