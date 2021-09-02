using Raylib

const screenw = 800
const screenh = 450

initwindow(screenw, screenh, "raylib.jl [shapes] example - raylib logo animation")

logopositionx = screenw ÷ 2 - 128
logopositiony = screenh ÷ 2 - 128

framescounter = 0
letterscount = 0

topsiderecwidth = 16
leftsiderecheight = 16

bottomsiderecwidth = 16
rightsiderecheight = 16

state = 0
alpha = 1.

settargetfps(60)

while !windowshouldclose()
    if state == 0
        global framescounter += 1

        if framescounter == 120
            global state = 1
            global framescounter = 0
        end
    elseif state == 1
        global topsiderecwidth += 4
        global leftsiderecheight += 4

        topsiderecwidth == 256 && (global state = 2)
    elseif state == 2
        global bottomsiderecwidth += 4
        global rightsiderecheight += 4

        bottomsiderecwidth == 256 && (global state = 3)
    elseif state == 3
        global framescounter += 1

        if framescounter ÷ 12 != 0
            global letterscount += 1
            global framescounter = 0
        end

        if letterscount >= 10
            global alpha -= .02

            if alpha <= 0.
                global alpha = 0.
                global state = 4
            end
        end
    elseif state == 4
        if iskeypressed(key_r)
            global framescounter = 0
            global letterscount = 0

            global topsiderecwidth = 16
            global rightsiderecheight = 16

            global bottomsiderecwidth = 16
            global leftsiderecheight = 16

            global alpha = 1.
            global state = 0
        end
    end

    begindrawing()
    
        clearbackground(raywhite)

        if state == 0
            (framescounter ÷ 15) % 2 == 0 && drawrectangle(logopositionx, logopositiony, 16, 16, black)
        elseif state == 1
            drawrectangle(logopositionx, logopositiony, topsiderecwidth, 16, black)
            drawrectangle(logopositionx, logopositiony, 16, leftsiderecheight, black)
        elseif state == 2
            drawrectangle(logopositionx, logopositiony, topsiderecwidth, 16, black)
            drawrectangle(logopositionx, logopositiony, 16, leftsiderecheight, black)

            drawrectangle(logopositionx + 240, logopositiony + 16, 16, rightsiderecheight - 32, black)
            drawrectangle(logopositionx, logopositiony + 240, bottomsiderecwidth, 16, black)
        elseif state == 3
            drawrectangle(logopositionx, logopositiony, topsiderecwidth, 16, fade(black, alpha))
            drawrectangle(logopositionx, logopositiony + 16, 16, leftsiderecheight - 32, fade(black, alpha))

            drawrectangle(logopositionx + 240, logopositiony + 16, 16, rightsiderecheight - 32, fade(black, alpha))
            drawrectangle(logopositionx, logopositiony + 240, bottomsiderecwidth, 16, fade(black, alpha))

            drawrectangle(getscreenwidth() ÷ 2 - 112, getscreenheight() ÷ 2 - 112, 224, 224, fade(raywhite, alpha))

            drawtext("raylib"[1:min(letterscount, 6)], getscreenwidth() ÷ 2 - 44, getscreenheight() ÷ 2 + 48, 50, fade(black, alpha))
        elseif state == 4
            drawtext("[R] REPLAY", 340, 200, 20, gray)
        end
    
    enddrawing()
end

closewindow()