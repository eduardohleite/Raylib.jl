using Raylib

const screenw = 800
const screenh = 450

initwindow(screenw, screenh, "raylib.jl [core] example - mouse input")

ballposition = Vector2(-100., -100.)
ballcolor = darkblue
settargetfps(60)

while !windowshouldclose()
    global ballposition = getmouseposition()

    ismousebuttonpressed(mousebuttonleft) && (global ballcolor = maroon)
    ismousebuttonpressed(mousebuttonright) && (global ballcolor = darkblue)
    ismousebuttonpressed(mousebuttonmiddle) && (global ballcolor = lime)
    ismousebuttonpressed(mousebuttonside) && (global ballcolor = purple)
    ismousebuttonpressed(mousebuttonextra) && (global ballcolor = yellow)
    ismousebuttonpressed(mousebuttonforward) && (global ballcolor = orange)
    ismousebuttonpressed(mousebuttonback) && (global ballcolor = beige)

    begindrawing()
        clearbackground(raywhite)
        drawcirclev(ballposition, 40., ballcolor)
        drawtext("move ball with mouse and click mouse button to change color", 10, 10, 20, darkgray)
    enddrawing()
end

closewindow()
