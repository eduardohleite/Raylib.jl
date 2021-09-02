using Raylib

const screenw = 800
const screenh = 450

const maxcolorscount = 21

initwindow(screenw, screenh, "raylib.jl [shapes] example - bouncing ball")

colors = [darkgray, maroon, orange, darkgreen, darkblue, darkpurple, darkbrown,
          gray, red, gold, lime, blue, violet, brown, lightgray, pink, yellow,
          green, skyblue, purple, beige]

colornames = ["DARKGRAY", "MAROON", "ORANGE", "DARKGREEN", "DARKBLUE", "DARKPURPLE",
              "DARKBROWN", "GRAY", "RED", "GOLD", "LIME", "BLUE", "VIOLET", "BROWN",
              "LIGHTGRAY", "PINK", "YELLOW", "GREEN", "SKYBLUE", "PURPLE", "BEIGE"]
          
colorrects = []

for i = 1:maxcolorscount
    push!(colorrects, Rectangle(20. + 100. * ((i-1) % 7) + 10. * ((i-1) % 7),
                                80. + 100. * ((i-1) ÷ 7) + 10. * ((i-1) ÷ 7),
                                100., 100.))
end

colorstate = zeros(Int, maxcolorscount)
mousepoint = Vector2(0., 0.)

settargetfps(60)

while !windowshouldclose()
    global mousepoint = getmouseposition()

    for i = 1:maxcolorscount
        global colorstate[i] = checkcollisionpointrec(mousepoint, colorrects[i]) ? 1 : 0 
    end


    begindrawing()
        clearbackground(raywhite)

        drawtext("raylib colors palette", 28, 42, 20, black)
        drawtext("press SPACE to see all colors", getscreenwidth() - 180, getscreenheight() - 40, 10, gray)

        for i = 1:maxcolorscount
            drawrectanglerec(colorrects[i], fade(colors[i], colorstate[i] == 1 ? .6 : 1.))

            if iskeydown(key_space) || colorstate[i] == 1
                drawrectangle(trunc(Int, colorrects[i].x), trunc(Int, colorrects[i].y + colorrects[i].height - 26), 
                    trunc(Int, colorrects[i].width), 20, black)
                drawrectanglelinesex(colorrects[i], 6, fade(black, .3))
                drawtext(colornames[i], trunc(Int, colorrects[i].x + colorrects[i].width - measuretext(colornames[i], 10) - 12),
                    trunc(Int, colorrects[i].y + colorrects[i].height - 20), 10, colors[i]);
            end
        end
    
    enddrawing()
end

closewindow()
