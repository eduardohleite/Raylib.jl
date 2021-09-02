using Raylib

const screenw = 800
const screenh = 450

initwindow(screenw, screenh, "raylib.jl [shapes] example - raylib logo using shapes")

settargetfps(60)

while !windowshouldclose()
    begindrawing()

        clearbackground(raywhite)

        drawrectangle(screenw ÷ 2 - 128, screenh ÷ 2 - 128, 256, 256, black)
        drawrectangle(screenw ÷ 2 - 112, screenh ÷ 2 - 112, 224, 224, raywhite)
        drawtext("raylib", screenw ÷ 2 - 44, screenh ÷ 2 + 48, 50, black)

        drawtext("this is NOT a texture!", 350, 370, 10, gray)

    enddrawing()
end

closewindow()