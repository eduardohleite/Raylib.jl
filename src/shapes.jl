# set texture and rectangle to be used on shapes drawing
# NOTE: It can be useful when using basic shapes and one single font,
# defining a font char white rectangle would allow drawing everything in a single draw call

# TODO: void SetShapesTexture(Texture2D texture, Rectangle source);


# basic shapes drawing functions

# draw a pixel
drawpixel(posx::Int, posy::Int, color::Color) =
    ccall((:DrawPixel, libname), Cvoid, (Cint, Cint, Color), posx, posy, color)

# draw a pixel (Vector version)
drawpixelv(position::Vector2, color::Color) =
    ccall((:DrawPixelV, libname), Cvoid, (Vector2, Color), position, color)

# draw a line
drawline(startposx::Int, startposy::Int, endposx::Int, endposy::Int, color::Color) =
    ccall((:DrawLine, libname), Cvoid, (Cint, Cint, Cint, Cint, Color), startposx, startposy, endposx, endposy, color)

# draw a line (Vector version)
drawlinev(startpos::Vector2, endpos::Vector2, color::Color) =
    ccall((:DrawLineV, libname), Cvoid, (Vector2, Vector2, Color), startpos, endpos, color)

# draw a line defining thickness
drawlineex(startpos::Vector2, endpos::Vector2, thick::Float32, color::Color) =
    ccall((:DrawLineEx, libname), Cvoid, (Vector2, Vector2, Cfloat, Color), startpos, endpos, thick, color)

# draw a line using cubic-bezier curves in-out
drawlinebezier(startpos::Vector2, endpos::Vector2, thick::Float32, color::Color) =
    ccall((:DrawLineBezier, libname), Cvoid, (Vector2, Vector2, Cfloat, Color), startpos, endpos, thick, color)

# draw a line using quadratic bezier curves with a control point
drawlinebezierquad(startpos::Vector2, endpos::Vector2, controlpos::Vector2, thick::Float32, color::Color) =
    ccall((:DrawLineBezierQuad, libname), Cvoid, (Vector2, Vector2, Vector2, Cfloat, Color), startpos, endpos, controlpos, thick, color)

# TODO: void DrawLineStrip(Vector2 *points, int pointsCount, Color color);                                  // Draw lines sequence

# draw a color-filled circle
drawcircle(centerx::Int, centery::Int, radius::Float64, color::Color) =
    ccall((:DrawCircle, libname), Cvoid, (Cint, Cint, Cfloat, Color), centerx, centery, radius, color)

# draw a piece of a circle
drawcirclesector(center::Vector2, radius::Float64, startangle::Float64, endangle::Float64, segments::Int, color::Color) =
    ccall((:DrawCircleSector, libname), Cvoid, (Vector2, Cfloat, Cfloat, Cfloat, Cint, Color), center, radius, startangle, endangle, segments, color)

# draw a circle sector outline
drawcirclesectorlines(center::Vector2, radius::Float64, startangle::Float64, endangle::Float64, segments::Int, color::Color) =
    ccall((:DrawCircleSectorLines, libname), Cvoid, (Vector2, Cfloat, Cfloat, Cfloat, Cint, Color), center, radius, startangle, endangle, segments, color)

# draw a gradient-filled circle
drawcirclegradient(centerx::Int, centery::Int, radius::Float64, color1::Color, color2::Color) =
    ccall((:DrawCircleGradient, libname), Cvoid, (Cint, Cint, Cfloat, Color, Color), centerx, centery, radius, color1, color2)

# draw a color-filled circle (Vector version)
drawcirclev(center::Vector2, radius::Float64, color::Color) =
    ccall((:DrawCircleV, libname), Cvoid, (Vector2, Cfloat, Color), center, radius, color)

# draw circle outline
drawcirclelines(centerx::Int, centery::Int, radius::Float64, color::Color) =
    ccall((:DrawCircleLines, libname), Cvoid, (Cint, Cint, Cfloat, Color), centerx, centery, radius, color)

# draw ellipse
drawellipse(centerx::Int, centery::Int, radiush::Float64, radiusv::Float64, color::Color) =
    ccall((:DrawEllipse, libname), Cvoid, (Cint, Cint, Cfloat, Cfloat, Color), centerx, centery, radiush, radiusv, color)

# draw ellipse outline
drawellipselines(centerx::Int, centery::Int, radiush::Float64, radiusv::Float64, color::Color) =
    ccall((:DrawEllipseLines, libname), Cvoid, (Cint, Cint, Cfloat, Cfloat, Color), centerx, centery, radiush, radiusv, color)

# draw ring
drawring(center::Vector2, innerradius::Float64, outerradius::Float64, startangle::Float64, endangle::Float64, segments::Int, color::Color) =
    ccall((:DrawRing, libname), Cvoid, (Vector2, Cfloat, Cfloat, Cfloat, Cfloat, Cint, Color), center, innerradius, outerradius, startangle, endangle, segments, color)

# draw ring outline
drawringlines(center::Vector2, innerradius::Float64, outerradius::Float64, startangle::Float64, endangle::Float64, segments::Int, color::Color) =
    ccall((:DrawRingLines, libname), Cvoid, (Vector2, Cfloat, Cfloat, Cfloat, Cfloat, Cint, Color), center, innerradius, outerradius, startangle, endangle, segments, color)

# draw a color-filled rectangle
drawrectangle(posx::Int, posy::Int, width::Int, height::Int, color::Color) =
    ccall((:DrawRectangle, libname), Cvoid, (Cint, Cint, Cint, Cint, Color), posx, posy, width, height, color)

# draw a color-filled rectangle (Vector version)
drawrectanglev(position::Vector2, size::Vector2, color::Color) =
    ccall((:DrawRectangleV, libname), Cvoid, (Vector2, Vector2, Color), position, size, color)
 
# draw a color-filled rectangle
drawrectanglerec(rec::Rectangle, color::Color) =
    ccall((:DrawRectangleRec, libname), Cvoid, (Rectangle, Color), rec, color)

drawrectanglelines(posx::Int, posy::Int, width::Int, height::Int, color::Color) =
    ccall((:DrawRectangleLines, libname), Cvoid, (Cint, Cint, Cint, Cint, Color), posx, posy, width, height, color)


# void DrawRectanglePro(Rectangle rec, Vector2 origin, float rotation, Color color);                  // Draw a color-filled rectangle with pro parameters
# void DrawRectangleGradientV(int posX, int posY, int width, int height, Color color1, Color color2); // Draw a vertical-gradient-filled rectangle
# void DrawRectangleGradientH(int posX, int posY, int width, int height, Color color1, Color color2); // Draw a horizontal-gradient-filled rectangle
# void DrawRectangleGradientEx(Rectangle rec, Color col1, Color col2, Color col3, Color col4);        // Draw a gradient-filled rectangle with custom vertex colors
# void DrawRectangleLines(int posX, int posY, int width, int height, Color color);                    // Draw rectangle outline
# void DrawRectangleLinesEx(Rectangle rec, int lineThick, Color color);                               // Draw rectangle outline with extended parameters
# void DrawRectangleRounded(Rectangle rec, float roundness, int segments, Color color);               // Draw rectangle with rounded edges
# void DrawRectangleRoundedLines(Rectangle rec, float roundness, int segments, int lineThick, Color color); // Draw rectangle with rounded edges outline
# void DrawTriangle(Vector2 v1, Vector2 v2, Vector2 v3, Color color);                                 // Draw a color-filled triangle (vertex in counter-clockwise order!)
# void DrawTriangleLines(Vector2 v1, Vector2 v2, Vector2 v3, Color color);                            // Draw triangle outline (vertex in counter-clockwise order!)
# void DrawTriangleFan(Vector2 *points, int pointsCount, Color color);                                // Draw a triangle fan defined by points (first vertex is the center)
# void DrawTriangleStrip(Vector2 *points, int pointsCount, Color color);                              // Draw a triangle strip defined by points
# void DrawPoly(Vector2 center, int sides, float radius, float rotation, Color color);                // Draw a regular polygon (Vector version)
# void DrawPolyLines(Vector2 center, int sides, float radius, float rotation, Color color);           // Draw a polygon outline of n sides


drawtext(text::String, posx::Int, posy::Int, fontsize::Int, color::Color) =
    ccall((:DrawText, libname), Cvoid, (Cstring, Cint, Cint, Cint, Color), text, posx, posy, fontsize, color)
