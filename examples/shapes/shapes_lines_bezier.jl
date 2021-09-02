using Raylib

const screenw = 800
const screenh = 450

setconfigflags(flag_msaa4xhint)
initwindow(screenw, screenh, "raylib.jl [shapes] example - cubic-bezier lines")

start = Vector2(0., 0.)
end_ = Vector2(Float64(screenw), Float64(screenh))

settargetfps(60)

while !windowshouldclose()
    ismousebuttondown(mousebutton_left) && (global start = getmouseposition())
    ismousebuttondown(mousebutton_right) && (global end_ = getmouseposition())

    begindrawing()
        clearbackground(raywhite)

        drawtext("USE MOUSE LEFT-RIGHT CLICK to DEFINE LINE START and END POINTS", 15, 20, 20, gray)
        drawlinebezier(start, end_, 2., red)

    enddrawing()
end

closewindow()