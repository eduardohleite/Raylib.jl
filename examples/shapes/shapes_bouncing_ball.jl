using Raylib

const screenw = 800
const screenh = 450

initwindow(screenw, screenh, "raylib.jl [shapes] example - bouncing ball")

ballposition = Vector2(getscreenwidth() / 2, getscreenheight() / 2)
ballspeed = Vector2(5., 4.)
ballradius = 20.

pause = false
framescounter = 0

settargetfps(60)

while !windowshouldclose()
    iskeypressed(key_space) && (global pause = !pause)

    if (!pause)

        x = ballposition.x + ballspeed.x
        y = ballposition.y + ballspeed.y

        global ballposition = Vector2(x, y)

        x = ballspeed.x
        y = ballspeed.y

        (ballposition.x >= (getscreenwidth() - ballradius) || ballposition.x <= ballradius) && (x *= -1.)
        (ballposition.y >= (getscreenheight() - ballradius) || ballposition.y <= ballradius) && (y *= -1.)

        global ballspeed = Vector2(x, y)
    else
        global framescounter += + 1
    end

    begindrawing()
        clearbackground(raywhite)

        drawcirclev(ballposition, ballradius, maroon)
        drawtext("PRESS SPACE to PAUSE BALL MOVEMENT", 10, getscreenheight() - 25, 20, lightgray)

        (pause && (framescounter / 30) % 2 == 0) && drawtext("PAUSED", 350, 200, 30, gray)

        drawfps(10, 10)

    enddrawing()
end

closewindow()
