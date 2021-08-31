using Raylib

const screenw = 800
const screenh = 450

initwindow(screenw, screenh, "raylib.jl [core] example - mouse input")

ballposition = Vector2(-100., -100.)
ballcolor = darkblue
settargetfps(60)

while !windowshouldclose()
    global ballposition = getmouseposition()

    ismousebuttonpressed(mousebutton_left) && (global ballcolor = maroon)
    ismousebuttonpressed(mousebutton_right) && (global ballcolor = darkblue)
    ismousebuttonpressed(mousebutton_middle) && (global ballcolor = lime)
    ismousebuttonpressed(mousebutton_side) && (global ballcolor = purple)
    ismousebuttonpressed(mousebutton_extra) && (global ballcolor = yellow)
    ismousebuttonpressed(mousebutton_forward) && (global ballcolor = orange)
    ismousebuttonpressed(mousebutton_back) && (global ballcolor = beige)

    begindrawing()
        clearbackground(raywhite)
        drawcirclev(ballposition, 40., ballcolor)
        drawtext("move ball with mouse and click mouse button to change color", 10, 10, 20, darkgray)
    enddrawing()
end

closewindow()
