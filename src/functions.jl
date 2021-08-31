initwindow(width::Int, height::Int, title::String) =
    ccall((:InitWindow, libname), Cvoid, (Cint, Cint, Cstring), width, height, title)

settargetfps(fps::Int) =
    ccall((:SetTargetFPS, libname), Cvoid, (Cint,), fps)
  
windowshouldclose()::Bool =
    ccall((:WindowShouldClose, libname), Cint, ())

begindrawing() =
    ccall((:BeginDrawing, libname), Cvoid, ())

clearbackground(color::Color) =
    ccall((:ClearBackground, libname), Cvoid, (Color, ), color)

drawtext(text::String, posx::Int, posy::Int, fontsize::Int, color::Color) =
    ccall((:DrawText, libname), Cvoid, (Cstring, Cint, Cint, Cint, Color), text, posx, posy, fontsize, color)

enddrawing() =
    ccall((:EndDrawing, libname), Cvoid, ())

closewindow() =
    ccall((:CloseWindow, libname), Cvoid, ())

iskeydown(key::Keys)::Bool =
    ccall((:IsKeyDown, libname), Cint, (Cint, ), Int(key))

drawcirclev(center::Vector2, radius::Float64, color::Color) =
    ccall((:DrawCircleV, libname), Cvoid, (Vector2, Cfloat, Color), center, radius, color)

getmouseposition()::Vector2 =
    ccall((:GetMousePosition, libname), Vector2, ())

ismousebuttonpressed(button::MouseButtons)::Bool =
    ccall((:IsMouseButtonPressed, libname), Cint, (Cint, ), Int(button))

getmousewheelmove()::Float32 =
    ccall((:GetMouseWheelMove, libname), Cfloat, ())

drawrectangle(posx::Int, posy::Int, width::Int, height::Int, color::Color) =
    ccall((:DrawRectangle, libname), Cvoid, (Cint, Cint, Cint, Cint, Color), posx, posy, width, height, color)

iskeypressed(key::Keys)::Bool =
    ccall((:IsKeyDown, libname), Cint, (Cint, ), Int(key))

beginmode2d(camera::Camera2D) =
    ccall((:BeginMode2D, libname), Cvoid, (Camera2D, ), camera)

endmode2d() =
    ccall((:EndMode2D, libname), Cvoid, ())
 
drawrectanglerec(rec::Rectangle, color::Color) =
    ccall((:DrawRectangleRec, libname), Cvoid, (Rectangle, Color), rec, color)

drawline(startposx::Int, startposy::Int, endposx::Int, endposy::Int, color::Color) =
    ccall((:DrawLine, libname), Cvoid, (Cint, Cint, Cint, Cint, Color), startposx, startposy, endposx, endposy, color)

fade(color::Color, alpha::Float64)::Color =
    ccall((:Fade, libname), Color, (Color, Cfloat), color, alpha)

drawrectanglelines(posx::Int, posy::Int, width::Int, height::Int, color::Color) =
    ccall((:DrawRectangleLines, libname), Cvoid, (Cint, Cint, Cint, Cint, Color), posx, posy, width, height, color)

getrandomvalue(min::Int, max::Int)::Int =
    ccall((:GetRandomValue, libname), Cint, (Cint, Cint), min, max)