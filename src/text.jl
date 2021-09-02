# text drawing functions

# draw current FPS
drawfps(posx::Int, posy::Int) =
    ccall((:DrawFPS, libname), Cvoid, (Cint, Cint), posx, posy)

# draw text (using default font)
drawtext(text::String, posx::Int, posy::Int, fontsize::Int, color::Color) =
    ccall((:DrawText, libname), Cvoid, (Cstring, Cint, Cint, Cint, Color), text, posx, posy, fontsize, color)

# TODO: void DrawTextEx(Font font, const char *text, Vector2 position, float fontSize, float spacing, Color tint);                // Draw text using font and additional parameters
# TODO: void DrawTextRec(Font font, const char *text, Rectangle rec, float fontSize, float spacing, bool wordWrap, Color tint);   // Draw text using font inside rectangle limits
# TODO: void DrawTextRecEx(Font font, const char *text, Rectangle rec, float fontSize, float spacing, bool wordWrap, Color tint,
#                             int selectStart, int selectLength, Color selectTint, Color selectBackTint);    // Draw text using font inside rectangle limits with support for text selection
# TODO: void DrawTextCodepoint(Font font, int codepoint, Vector2 position, float fontSize, Color tint); // Draw one character (codepoint)