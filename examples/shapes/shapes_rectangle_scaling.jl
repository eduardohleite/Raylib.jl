const screenw = 800
const screenh = 450
const mousescalemarksize = 12

initwindow(screenw, screenh, "raylib.jl [shapes] example - rectangle scaling mouse")

rec = Rectangle(100, 100, 200, 80)
mouseposition = Vector2(0, 0)

mousescaleready = false
mousescalemode = false

settargetfps(60)

while !windowshouldclose()
    global mouseposition = getmouseposition()

    if checkcollisionpointrec(mouseposition, rec) && 
        checkcollisionpointrec(mouseposition, 
            Rectangle(rec.x + rec.width - mousescalemarksize,
                      rec.y + rec.height - mousescalemarksize,
                      mousescalemarksize, mousescalemarksize))
        global mousescaleready = true
        ismousebuttonpressed(mousebutton_left) && (global mousescalemode = true)
    else
        global mousescaleready = false
    end

    if mousescalemode
        mousescaleready = true

        rec.width = mouseposition.x - rec.x
        rec.height = mouseposition.y - rec.y

        rec.width < mousescalemarksize && (rec.width = mousescalemarksize)
        rec.height < mousescalemarksize && (rec.height = mousescalemarksize)

        ismousebuttonreleased(mousebutton_left) && (global mousescalemode = false)
    end

    begindrawing()
    
        clearbackground(raywhite)
        
        drawtext("Scale rectangle dragging from bottom-right corner!", 10, 10, 20, gray)
        drawrectanglerec(rec, fade(green, .5))

        if mousescaleready
            drawrectanglelinesex(rec, 1, red)
            drawtriangle(Vector2(rec.x + rec.width - mousescalemarksize, rec.y + rec.height),
                         Vector2(rec.x + rec.width, rec.y + rec.height),
                         Vector2(rec.x + rec.width, rec.y + rec.height - mousescalemarksize), red)
        end
    
    enddrawing()
end

closewindow()