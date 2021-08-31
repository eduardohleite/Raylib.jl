using Raylib

const screenw = 800
const screenh = 450

initwindow(screenw, screenh, "raylib.jl [core] example - keyboard input")

ballposition = Vector2(screenw/2, screenh/2)
settargetfps(60)

while !windowshouldclose()
    x, y = ballposition.x, ballposition.y

    iskeydown(keyright) && (x += 2.)
    iskeydown(keyleft) && (x -= 2.)
    iskeydown(keyup) && (y += 2.)
    iskeydown(keydown) && (y -= 2.)

    global ballposition = Vector2(x, y)

    begindrawing()
        clearbackground(raywhite)
        drawtext("move the ball with arrow keys", 10, 10, 20, darkgray)

        drawcirclev(ballposition, 50., maroon)
    enddrawing()
end

closewindow()
