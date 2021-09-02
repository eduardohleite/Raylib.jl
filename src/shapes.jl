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
drawlineex(startpos::Vector2, endpos::Vector2, thick::Float64, color::Color) =
    ccall((:DrawLineEx, libname), Cvoid, (Vector2, Vector2, Cfloat, Color), startpos, endpos, thick, color)

# draw a line using cubic-bezier curves in-out
drawlinebezier(startpos::Vector2, endpos::Vector2, thick::Float64, color::Color) =
    ccall((:DrawLineBezier, libname), Cvoid, (Vector2, Vector2, Cfloat, Color), startpos, endpos, thick, color)

# draw a line using quadratic bezier curves with a control point
drawlinebezierquad(startpos::Vector2, endpos::Vector2, controlpos::Vector2, thick::Float64, color::Color) =
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

# draw a color-filled rectangle with pro parameters
drawrectanglepro(rec::Rectangle, origin::Vector2, rotation::Float64, color::Color) =
    ccall((:DrawRectanglePro, libname), Cvoid, (Rectangle, Vector2, Cfloat, Color), rec, origin, rotation, color)

# draw a vertical-gradient-filled rectangle
drawrectanglegradientv(posx::Int, posy::Int, width::Int, height::Int, color1::Color, color2::Color) =
    ccall((:DrawRectangleGradientV, libname), Cvoid, (Cint, Cint, Cint, Cint, Color, Color), posx, posy, width, height, color1, color2)

# draw a horizontal-gradient-filled rectangle
drawrectanglegradienth(posx::Int, posy::Int, width::Int, height::Int, color1::Color, color2::Color) =
    ccall((:DrawRectangleGradientH, libname), Cvoid, (Cint, Cint, Cint, Cint, Color, Color), posx, posy, width, height, color1, color2)

# draw a gradient-filled rectangle with custom vertex colors
drawrectanglegradientex(rec::Rectangle, col1::Color, col2::Color, col3::Color, col4::Color) =
    ccall((:DrawRectangleGradientEx, libname), Cvoid, (Rectangle, Color, Color, Color, Color), rec, col1, col2, col3, col4)

# draw rectangle outline
drawrectanglelines(posx::Int, posy::Int, width::Int, height::Int, color::Color) =
    ccall((:DrawRectangleLines, libname), Cvoid, (Cint, Cint, Cint, Cint, Color), posx, posy, width, height, color)

# draw rectangle outline with extended parameters
drawrectanglelinesex(rec::Rectangle, linethick::Int, color::Color) =
    ccall((:DrawRectangleLinesEx, libname), Cvoid, (Rectangle, Cint, Color), rec, linethick, color)

# draw rectangle with rounded edges
drawrectanglerounded(rec::Rectangle, roundness::Float64, segments::Int, color::Color) =
    ccall((:DrawRectangleRounded, libname), Cvoid, (Rectangle, Cfloat, Cint, Color), rec, roundness, segments, color)

# draw rectangle with rounded edges outline
drawrectangleroundedlines(rec::Rectangle, roundness::Float64, segments::Int, linethick::Int, color::Color) =
    ccall((:DrawRectangleRoundedLines, libname), Cvoid, (Rectangle, Cfloat, Cint, Cint, Color), rec, roundness, segments, linethick, color)
    
# draw a color-filled triangle (vertex in counter-clockwise order!)
drawtriangle(v1::Vector2, v2::Vector2, v3::Vector2, color::Color) =
    ccall((:DrawTriangle, libname), Cvoid, (Vector2, Vector2, Vector2, Color), v1, v2, v3, color)

# draw triangle outline (vertex in counter-clockwise order!)
drawtrianglelines(v1::Vector2, v2::Vector2, v3::Vector2, color::Color) =
    ccall((:DrawTriangleLines, libname), Cvoid, (Vector2, Vector2, Vector2, Color), v1, v2, v3, color)

# TODO: void DrawTriangleFan(Vector2 *points, int pointsCount, Color color);                                // Draw a triangle fan defined by points (first vertex is the center)
# TODO: void DrawTriangleStrip(Vector2 *points, int pointsCount, Color color);                              // Draw a triangle strip defined by points
    
# draw regular polygon (Vector version)
drawpoly(center::Vector2, sides::Int, radius::Float64, rotation::Float64, color::Color) =
    ccall((:DrawPoly, libname), Cvoid, (Vector2, Cint, Cfloat, Cfloat, Color), center, sides, radius, rotation, color)

# draw a polygon outline of n sides
drawpolylines(center::Vector2, sides::Int, radius::Float64, rotation::Float64, color::Color) =
    ccall((:DrawPolyLines, libname), Cvoid, (Vector2, Cint, Cfloat, Cfloat, Color), center, sides, radius, rotation, color)

# draw a polygon outline of n sides with extended parameters
drawpolylinesex(center::Vector2, sides::Int, radius::Float64, rotation::Float64, linethick::Float64, color::Color) =
    ccall((:DrawPolyLines, libname), Cvoid, (Vector2, Cint, Cfloat, Cfloat, Cfloat, Color), center, sides, radius, rotation, linethick, color)
    
    
#void DrawPolyLinesEx(Vector2 center, int sides, float radius, float rotation, float lineThick, Color color); // Draw a polygon outline of n sides with extended parameters

    

# basic shapes collision detection functions 

# check collision between two rectangles
checkcollisionrecs(rec1::Rectangle, rec2::Rectangle)::Bool =
    ccall((:CheckCollisionRecs, libname), Cint, (Rectangle, Rectangle), rec1, rec2)

# check collision between two circles
checkcollisioncircles(center1::Vector2, radius1::Float64, center2::Vector2, radius2::Float64)::Bool =
    ccall((:CheckCollisionCircles, libname), Cint, (Vector2, Cfloat, Vector2, Cfloat), center1, radius1, center2, radius2)

# check collision between circle and rectangle
checkcollisioncirclerec(center::Vector2, radius::Float64, rec::Rectangle)::Bool =
    ccall((:CheckCollisionCircleRec, libname), Cint, (Vector2, Cfloat, Rectangle), center, radius, rec)

# check if point is inside rectangle
checkcollisionpointrec(point::Vector2, rec::Rectangle)::Bool =
    ccall((:CheckCollisionPointRec, libname), Cint, (Vector2, Rectangle), point, rec)

# check if point is inside circle
checkcollisionpointcircle(point::Vector2, center::Vector2, radius::Float64)::Bool =
    ccall((:CheckCollisionPointCircle, libname), Cint, (Vector2, Vector2, Float64), point, center, radius)

# check if point is inside triangle
checkcollisionpointtriangle(point::Vector2, p1::Vector2, p2::Vector2, p3::Vector3)::Bool =
    ccall((:CheckCollisionPointTriangle, libname), Cint, (Vector2, Vector2, Vector2, Vector2), point, p1, p2, p3)
    
# TODO: bool CheckCollisionLines(Vector2 startPos1, Vector2 endPos1, Vector2 startPos2, Vector2 endPos2, Vector2 *collisionPoint); // Check the collision between two lines defined by two points each, returns collision point by reference

# get collision rectangle for two rectangles collision
getcollisionrec(rec1::Rectangle, rec2::Rectangle)::Rectangle =
    ccall((:GetCollisionRec, libname), Rectangle, (Rectangle, Rectangle), rec1, rec2)
