using Raylib

const screenw = 800
const screenh = 450

initwindow(screenw, screenh, "raylib.jl [shapes] example - collision area");

boxa = Rectangle(10., getscreenheight() / 2 - 50., 200., 100.)
boxa_speed = 4

boxb = Rectangle(getscreenwidth() / 2 - 30, getscreenheight() / 2 - 30, 60., 60.)

boxcollision = Rectangle(0., 0., 0., 0.)

screenupperlimit = 40

pause = false
collision = false

settargetfps(60)

while !windowshouldclose()
    pause || (boxa.x += boxa_speed)

    (boxa.x + boxa.width >= getscreenwidth() || boxa.x <= 0) && (global boxa_speed *= -1)

    boxb.x = getmousex() - boxb.width / 2
    boxb.y = getmousey() - boxb.height / 2

    boxb.x + boxb.width >= getscreenwidth() && (boxb.x = getscreenwidth() - boxb.width) 
    boxb.x <= 0 && (boxb.x = 0)

    boxb.y + boxb.height >= getscreenheight() && (boxb.y = getscreenheight() - boxb.height) 
    boxb.y <= screenupperlimit && (boxb.y = screenupperlimit)

    global collision = checkcollisionrecs(boxa, boxb)

    collision && (global boxcollision = getcollisionrec(boxa, boxb))

    iskeypressed(key_space) && (global pause = !pause)

    begindrawing()
        clearbackground(raywhite)

        drawrectangle(0, 0, screenw, screenupperlimit, collision ? red : black)

        drawrectanglerec(boxa, gold)
        drawrectanglerec(boxb, blue)
    
        if collision
            drawrectanglerec(boxcollision, lime)

            drawtext("COLLISION!", getscreenwidth() ÷ 2 - measuretext("COLLISION!", 20) ÷ 2,
                screenupperlimit ÷ 2 - 10, 20, black)

            collisionarea = trunc(Int, boxcollision.width) * trunc(Int, boxcollision.height)
            drawtext("Collision Area: $collisionarea", getscreenwidth() ÷ 2 - 100, screenupperlimit + 10, 20, black)
        
        end

        drawfps(10, 10)
    
    enddrawing()         

end

closewindow()