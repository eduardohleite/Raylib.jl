using Raylib

const screenw = 800
const screenh = 450

initwindow(screenw, screenh, "raylib.jl [shapes] example - basic shapes drawing")

settargetfps(60)

while !windowshouldclose()
    begindrawing()
        clearbackground(raywhite)

        drawtext("some basic shapes available on raylib", 20, 20, 20, darkgray)

        drawcircle(screenw ÷ 5, 120, 35., darkblue)
        drawcirclegradient(screenw ÷ 5, 220, 60., green, skyblue)
        drawcirclelines(screenw ÷ 5, 340, 80., darkblue)

        drawrectangle(trunc(Int, screenw / 4 * 2 - 60), 100, 120, 60, red)
        drawrectanglegradienth(trunc(Int, screenw / 4 * 2 - 90), 170, 180, 130, maroon, gold)
        drawrectanglelines(trunc(Int, screenw / 4 * 2 - 40), 320, 80, 60, orange) 
        
        drawtriangle(Vector2(screenw / 4. * 3., 80.),
                     Vector2(screenw / 4. * 3. - 60., 150.),
                     Vector2(screenw / 4. * 3. + 60., 150.), violet)

        drawtrianglelines(Vector2(screenw / 4. * 3., 160.),
                          Vector2(screenw / 4. * 3. - 20., 230.),
                          Vector2(screenw / 4. * 3. + 20., 230.), darkblue)

        drawpoly(Vector2(screenw / 4 * 3, 320), 6, 80., 0., brown)
        drawpolylinesex(Vector2(screenw / 4 * 3, 320), 6, 80., 0., 6., beige)

        drawline(18, 42, screenw - 18, 42, black)

    enddrawing()
end

closewindow()
