using Raylib

const screenw = 800
const screenh = 450

initwindow(screenw, screenh, "raylib.jl [core] example - basic window")
settargetfps(60)

while !windowshouldclose()
    begindrawing()
        clearbackground(raywhite)
        drawtext("Congrats! You created your first window!", 190, 200, 20, lightgray)
    enddrawing()
end

closewindow()
