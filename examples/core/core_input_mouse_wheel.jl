using Raylib

const screenw = 800
const screenh = 450

initwindow(screenw, screenh, "raylib.jl [core] example - input mouse wheel")

boxpositiony = screenh / 2 - 40
scrollspeed = 4

settargetfps(60)

while !windowshouldclose()
    global boxpositiony -= trunc(Int, getmousewheelmove() * scrollspeed)

    begindrawing()
        clearbackground(raywhite)
        drawrectangle(screenw ÷ 2 - 40, trunc(Int, boxpositiony), 80, 80, maroon)

        drawtext("Use mouse wheel to move the cube up and down!", 10, 10, 20, gray)
        drawtext("Box position Y:$boxpositiony", 10, 40, 20, lightgray)
    enddrawing()
end

closewindow()
