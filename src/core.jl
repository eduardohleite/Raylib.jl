
# window-related functions

# initialize window and OpenGL context
initwindow(width::Int, height::Int, title::String) =
    ccall((:InitWindow, libname), Cvoid, (Cint, Cint, Cstring), width, height, title)

# check if KEY_ESCAPE pressed or Close icon pressed
windowshouldclose()::Bool =
    ccall((:WindowShouldClose, libname), Cint, ())

# close window and unload OpenGL context
closewindow() =
    ccall((:CloseWindow, libname), Cvoid, ())

# check if window has been initialized successfully
iswindowready()::Bool =
    ccall((:IsWindowReady, libname), Cint, ())

# check if window is currently fullscreen
iswindowfullscreen()::Bool =
    ccall((:IsWindowFullscreen, libname), Cint, ())

# check if window is currently hidden (only PLATFORM_DESKTOP)
iswindowhidden()::Bool =
    ccall((:IsWindowHidden, libname), Cint, ())

# check if window is currently minimized (only PLATFORM_DESKTOP)
iswindowminimized()::Bool =
    ccall((:IsWindowMinimized, libname), Cint, ())

# check if window is currently maximized (only PLATFORM_DESKTOP)
iswindowmaximized()::Bool =
    ccall((:IsWindowMaximized, libname), Cint, ())

# check if window is currently focused (only PLATFORM_DESKTOP)
iswindowfocused()::Bool =
    ccall((:IsWindowFocused, libname), Cint, ())

# check if window has been resized last frame
iswindowresized()::Bool =
    ccall((:IsWindowResized, libname), Cint, ())

# check if one specific window flag is enabled
iswindowstate(flag::UInt)::Bool =
    ccall((:IsWindowState, libname), Cint, (Cuint,), flag)

# set window configuration state using flags
setwindowstate(flag::UInt) =
    ccall((:SetWindowState, libname), Cvoid, (Cuint,), flag)

# clear window configuration state flags
clearwindowstate(flag::UInt) =
    ccall((:ClearWindowState, libname), Cvoid, (Cuint,), flag)

# toggle window state: fullscreen/windowed (only PLATFORM_DESKTOP)
togglefullscreen() =
    ccall((:ToggleFullscreen, libname), Cvoid, ())

# set window state: maximized, if resizable (only PLATFORM_DESKTOP)
maximizewindow() =
    ccall((:MaximizeWindow, libname), Cvoid, ())

# set window state: minimized, if resizable (only PLATFORM_DESKTOP)
minimizewindow() =
    ccall((:MinimizeWindow, libname), Cvoid, ())

# set window state: not minimized/maximized (only PLATFORM_DESKTOP)
restorewindow() =
    ccall((:RestoreWindow, libname), Cvoid, ())

# TODO: void SetWindowIcon(Image image);                                        // Set icon for window (only PLATFORM_DESKTOP)    

# set title for window (only PLATFORM_DESKTOP)
setwindowtitle(title::String) =
    ccall((:SetWindowTitle, libname), Cvoid, (Cstring,), title)
    
# set window position on screen (only PLATFORM_DESKTOP)
setwindowposition(x::Int, y::Int) =
    ccall((:SetWindowPosition, libname), Cvoid, (Cint, Cint), x, y)

# set monitor for the current window (fullscreen mode)
setwindowmonitor(monitor::Int) =
    ccall((:SetWindowMonitor, libname), Cvoid, (Cint,), monitor)

# set window minimum dimensions (for FLAG_WINDOW_RESIZABLE)
setwindowminsize(width::Int, height::Int) = 
    ccall((:SetWindowMinSize, libname), Cvoid, (Cint, Cint), width, height)

# set window dimensions
setwindowsize(width::Int, height::Int) = 
    ccall((:SetWindowSize, libname), Cvoid, (Cint, Cint), width, height)

# TODO: void *GetWindowHandle(void);                                            // Get native window handle

# get current screen width
getscreenwidth()::Int =
    ccall((:GetScreenWidth, libname), Cint, ())
    
# get current screen height
getscreenheight()::Int =
    ccall((:GetScreenHeight, libname), Cint, ())
    
# get number of connected monitors
getmonitorcount()::Int =
    ccall((:GetMonitorCount, libname), Cint, ())
    
# get current connected monitor
getcurrentmonitor()::Int =
    ccall((:GetCurrentMonitor, libname), Cint, ())

# get specified monitor position
getmonitorposition(monitor::Int)::Vector2 =
    ccall((:GetMonitorPosition, libname), Vector2, (Cint,), monitor)

# get specified monitor width (max available by monitor)
getmonitorwidth(monitor::Int)::Int =
    ccall((:GetMonitorWidth, libname), Cint, (Cint,), monitor)

# get specified monitor height (max available by monitor)
getmonitorheight(monitor::Int)::Int =
    ccall((:GetMonitorHeight, libname), Cint, (Cint,), monitor)

# get specified monitor physical width in millimetres
getmonitorphysicalwidth(monitor::Int)::Int =
    ccall((:GetMonitorPhysicalWidth, libname), Cint, (Cint,), monitor)

# get specified monitor physical height in millimetres
getmonitorphysicalheight(monitor::Int)::Int =
    ccall((:GetMonitorPhysicalHeight, libname), Cint, (Cint,), monitor)

# get specified monitor refresh rate
getmonitorrefreshrate(monitor::Int)::Int =
    ccall((:GetMonitorRefreshRate, libname), Cint, (Cint,), monitor)
    
# get window position XY on monitor
getwindowposition()::Vector2 =
    ccall((:GetWindowPosition, libname), Vector2, ())

# get window scale DPI factor
getwindowscaledpi()::Vector2 =
    ccall((:GetWindowScaleDPI, libname), Vector2, ())
    
# get the human-readable, UTF-8 encoded name of the primary monitor
getmonitorname(monitor::Int)::String =
    ccall((:GetMonitorName, libname), Cstring, (Cint,), monitor)

# set clipboard text content
setclipboardtext(text::String) =
    ccall((:SetClipboardText, libname), Cvoid, (Cstring,), text)

# get clipboard text content
getclipboardtext()::String =
    ccall((:GetClipboardText, libname), Cstring, ())


# cursor-related functions

# shows cursor
showcursor() =
    ccall((:ShowCursor, libname), Cvoid, ())

# hides cursor
hidecursor() =
    ccall((:HideCursor, libname), Cvoid, ())

# check if cursor is not visible
iscursorhidden()::Bool =
    ccall((:IsCursorHiddenll, libname), Cint, ())

# enables cursor (unlock cursor)r
enablecursor() =
    ccall((:EnableCursor, libname), Cvoid, ())

# disables cursor (lock cursor)
disablecursor() =
    ccall((:DisableCursor, libname), Cvoid, ())

# check if cursor is on the current screen.
iscursoronscreen()::Bool =
    ccall((:IsCursorOnScreen, libname), Cint, ())


# drawing-related functions

# set background color (framebuffer clear color)
clearbackground(color::Color) =
    ccall((:ClearBackground, libname), Cvoid, (Color, ), color)

# setup canvas (framebuffer) to start drawing
begindrawing() =
    ccall((:BeginDrawing, libname), Cvoid, ())

# end canvas drawing and swap buffers (double buffering)
enddrawing() =
    ccall((:EndDrawing, libname), Cvoid, ())

# initialize 2D mode with custom camera (2D)
beginmode2d(camera::Camera2D) =
    ccall((:BeginMode2D, libname), Cvoid, (Camera2D, ), camera)

# ends 2D mode with custom camera
endmode2d() =
    ccall((:EndMode2D, libname), Cvoid, ())

# TODO: void BeginMode3D(Camera3D camera);                                      // Initializes 3D mode with custom camera (3D)
# TODO: void EndMode3D(void);                                                   // Ends 3D mode and returns to default 2D orthographic mode
# TODO: void BeginTextureMode(RenderTexture2D target);                          // Initializes render texture for drawing

# ends drawing to render texture
endtexturemode() =
    ccall((:EndTextureMode, libname), Cvoid, ())

# TODO: void BeginShaderMode(Shader shader);                                    // Begin custom shader drawing

# end custom shader drawing (use default shader)
endshadermode() =
    ccall((:EndShaderMode, libname), Cvoid, ())

# begin blending mode (alpha, additive, multiplied)
beginblendmode(mode::Int) =
    ccall((:BeginBlendMode, libname), Cvoid, (Cint, ), mode)

# end blending mode (reset to default: alpha blending)
endblendmode() =
    ccall((:EndBlendMode, libname), Cvoid, ())

# begin scissor mode (define screen area for following drawing)
beginscissormode(x::Int, y::Int, width::Int, height::Int) =
    ccall((:BeginScissorMode, libname), Cvoid, (Cint, Cint, Cint, Cint), x, y, width, height)

# end scissor mode
endscissormode() =
    ccall((:EndScissorMode, libname), Cvoid, ())

# TODO: void BeginVrStereoMode(VrStereoConfig config);                          // Begin stereo rendering
# TODO: void EndVrStereoMode(void);                                             // End stereo rendering


# VR stereo config functions for VR simulator

# TODO: VrStereoConfig LoadVrStereoConfig(VrDeviceInfo device);                 // Load VR stereo config for VR simulator device parameters
# TODO: void UnloadVrStereoConfig(VrStereoConfig config);                       // Unload VR stereo config


# shader management functions
# NOTE: Shader functionality is not available on OpenGL 1.1

# TODO: Shader LoadShader(const char *vsFileName, const char *fsFileName);      // Load shader from files and bind default locations
# TODO: Shader LoadShaderFromMemory(const char *vsCode, const char *fsCode);    // Load shader from code strings and bind default locations
# TODO: int GetShaderLocation(Shader shader, const char *uniformName);          // Get shader uniform location
# TODO: int GetShaderLocationAttrib(Shader shader, const char *attribName);     // Get shader attribute location
# TODO: void SetShaderValue(Shader shader, int locIndex, const void *value, int uniformType);               // Set shader uniform value
# TODO: void SetShaderValueV(Shader shader, int locIndex, const void *value, int uniformType, int count);   // Set shader uniform value vector
# TODO: void SetShaderValueMatrix(Shader shader, int locIndex, Matrix mat);     // Set shader uniform value (matrix 4x4)
# TODO: void SetShaderValueTexture(Shader shader, int locIndex, Texture2D texture); // Set shader uniform value for texture (sampler2d)
# TODO: void UnloadShader(Shader shader);


# screen-space-related functions

# TODO: Ray GetMouseRay(Vector2 mousePosition, Camera camera);                  // Returns a ray trace from mouse position
# TODO: Matrix GetCameraMatrix(Camera camera);                                  // Returns camera transform matrix (view matrix)
# TODO: Matrix GetCameraMatrix2D(Camera2D camera);                              // Returns camera 2d transform matrix
# TODO: Vector2 GetWorldToScreen(Vector3 position, Camera camera);              // Returns the screen space position for a 3d world space position
# TODO: Vector2 GetWorldToScreenEx(Vector3 position, Camera camera, int width, int height); // Returns size position for a 3d world space position

# returns the screen space position for a 2d camera world space position
getworldtoscreen2d(position::Vector2, camera::Camera2D)::Vector2 =
    ccall((:GetWorldToScreen2D, libname), Vector2, (Vector2, Camera2D), position, camera)

# returns the world space position for a 2d camera screen space position
getscreentoworld2d(position::Vector2, camera::Camera2D)::Vector2 =
    ccall((:GetScreenToWorld2D, libname), Vector2, (Vector2, Camera2D), position, camera)


# timing-related functions

# set target FPS (maximum)
settargetfps(fps::Int) =
    ccall((:SetTargetFPS, libname), Cvoid, (Cint,), fps)

# returns current FPS
getfps()::Int =
    ccall((:GetFPS, libname), Cint, ())

# returns time in seconds for last frame drawn (delta time)
getframetime()::Float32 =
    ccall((:GetFrameTime, libname), Cfloat, ())

# returns elapsed time in seconds since InitWindow()
gettime()::Float64 =
    ccall((:GetTime, libname), Cdouble, ())


# misc. functions   

# returns a random value between min and max (both included)
getrandomvalue(min::Int, max::Int)::Int =
    ccall((:GetRandomValue, libname), Cint, (Cint, Cint), min, max)

# takes a screenshot of current screen (filename extension defines format)
takescreenshot(filename::String) =
    ccall((:TakeScreenshot, libname), Cvoid, (Cstring,), filename)

# setup init configuration flags (view FLAGS)
setconfigflags(flags::UInt) =
    ccall((:SetConfigFlags, libname), Cvoid, (Cuint,), flags)
        
# TODO: void TraceLog(int logLevel, const char *text, ...);                     // Show trace log messages (LOG_DEBUG, LOG_INFO, LOG_WARNING, LOG_ERROR)
# TODO: void SetTraceLogLevel(int logLevel);                                    // Set the current threshold (minimum) log level
# TODO: void *MemAlloc(int size);                                               // Internal memory allocator
# TODO: void *MemRealloc(void *ptr, int size);                                  // Internal memory reallocator
# TODO: void MemFree(void *ptr);                                                // Internal memory free


# set custom callbacks
# WARNING: Callbacks setup is intended for advance users

# TODO: void SetTraceLogCallback(TraceLogCallback callback);                    // Set custom trace log
# TODO: void SetLoadFileDataCallback(LoadFileDataCallback callback);            // Set custom file binary data loader
# TODO: void SetSaveFileDataCallback(SaveFileDataCallback callback);            // Set custom file binary data saver
# TODO: void SetLoadFileTextCallback(LoadFileTextCallback callback);            // Set custom file text data loader
# TODO: void SetSaveFileTextCallback(SaveFileTextCallback callback);            // Set custom file text data saver


# files management functions

# TODO: unsigned char *LoadFileData(const char *fileName, unsigned int *bytesRead);     // L
# TODO: void UnloadFileData(unsigned char *data);                               // Unload file data allocated by LoadFileData()
# TODO: bool SaveFileData(const char *fileName, void *data, unsigned int bytesToWrite); // Save data to file from byte array (write), returns true on success
# TODO: char *LoadFileText(const char *fileName);                               // Load text data from file (read), returns a '\0' terminated string
# TODO: void UnloadFileText(unsigned char *text);                               // Unload file text data allocated by LoadFileText()
# TODO: bool SaveFileText(const char *fileName, char *text);                    // Save text data to file (write), string must be '\0' terminated, returns true on success
# TODO: bool FileExists(const char *fileName);                                  // Check if file exists
# TODO: bool DirectoryExists(const char *dirPath);                              // Check if a directory path exists
# TODO: bool IsFileExtension(const char *fileName, const char *ext);            // Check file extension (including point: .png, .wav)
# TODO: const char *GetFileExtension(const char *fileName);                     // Get pointer to extension for a filename string (includes dot: ".png")
# TODO: const char *GetFileName(const char *filePath);                          // Get pointer to filename for a path string
# TODO: const char *GetFileNameWithoutExt(const char *filePath);                // Get filename string without extension (uses static string)
# TODO: const char *GetDirectoryPath(const char *filePath);                     // Get full path for a given fileName with path (uses static string)
# TODO: const char *GetPrevDirectoryPath(const char *dirPath);                  // Get previous directory path for a given path (uses static string)
# TODO: const char *GetWorkingDirectory(void);                                  // Get current working directory (uses static string)
# TODO: char **GetDirectoryFiles(const char *dirPath, int *count);              // Get filenames in a directory path (memory should be freed)
# TODO: void ClearDirectoryFiles(void);                                         // Clear directory files paths buffers (free memory)
# TODO: bool ChangeDirectory(const char *dir);                                  // Change working directory, return true on success
# TODO: bool IsFileDropped(void);                                               // Check if a file has been dropped into window
# TODO: char **GetDroppedFiles(int *count);                                     // Get dropped files names (memory should be freed)
# TODO: void ClearDroppedFiles(void);                                           // Clear dropped files paths buffer (free memory)
# TODO: long GetFileModTime(const char *fileName);                              // Get file modification time (last write time)

# TODO: unsigned char *CompressData(unsigned char *data, int dataLength, int *compDataLength);        // Compress data (DEFLATE algorithm)
# TODO: unsigned char *DecompressData(unsigned char *compData, int compDataLength, int *dataLength);  // Decompress data (DEFLATE algorithm)


# persistent storage management

# TODO: bool SaveStorageValue(unsigned int position, int value);                // Save integer value to storage file (to defined position), returns true on success
# TODO: int LoadStorageValue(unsigned int position);                            // Load integer value from storage file (from defined position)

# open URL with default system browser (if available)
openurl(url::String) =
    ccall((:TakeScreenshot, libname), Cvoid, (Cstring,), url)


# input-related functions: keyboard

# detect if a key has been pressed once
iskeypressed(key::Keys)::Bool =
    ccall((:IsKeyDown, libname), Cint, (Cint, ), Int(key))

# detect if a key is being pressed
iskeydown(key::Keys)::Bool =
    ccall((:IsKeyDown, libname), Cint, (Cint, ), Int(key))

# detect if a key has been released once
iskeyreleased(key::Keys)::Bool =
    ccall((:IsKeyReleased, libname), Cint, (Cint, ), Int(key))

# detect if a key is NOT being pressed
iskeyup(key::Keys)::Bool =
    ccall((:IsKeyUp, libname), Cint, (Cint, ), Int(key))

# set a custom key to exit program (default is ESC)
setexitkey(key::Keys) =
    ccall((:SetExitKey, libname), Cvoid, (Cint, ), Int(key))

# get key pressed (keycode), call it multiple times for keys queued
getkeypressed(key::Keys)::Int =
    ccall((:GetKeyPressed, libname), Cint, (Cint, ), Int(key))

# get char pressed (unicode), call it multiple times for chars queued
getcharpressed()::Int =
    ccall((:GetCharPressed, libname), Cint, ())


# input-related functions: gamepads

# detect if a gamepad is available
isgamepadavailable(gamepad::Int)::Bool =
    ccall((:IsGamepadAvailable, libname), Cint, (Cint, ), gamepad)

# check gamepad name (if available)
isgamepadname(gamepad::Int, name::String)::Bool =
    ccall((:IsGamepadName, libname), Cint, (Cint, Cstring), gamepad, name)

# return gamepad internal name id
getgamepadname(gamepad::Int)::String =
    ccall((:GetGamepadName, libname), Cstring, (Cint, ), gamepad)

# detect if a gamepad button has been pressed once
isgamepadbuttonpressed(gamepad::Int, button::Int)::Bool =
    ccall((:IsGamepadButtonPressed, libname), Cint, (Cint, Cint), gamepad, button)

# detect if a gamepad button is being pressed
isgamepadbuttondown(gamepad::Int, button::Int)::Bool =
    ccall((:IsGamepadButtonDown, libname), Cint, (Cint, Cint), gamepad, button)

# detect if a gamepad button has been released once
isgamepadbuttonreleased(gamepad::Int, button::Int)::Bool =
    ccall((:IsGamepadButtonReleased, libname), Cint, (Cint, Cint), gamepad, button)

# detect if a gamepad button is NOT being pressed
isgamepadbuttonup(gamepad::Int, button::Int)::Bool =
    ccall((:IsGamepadButtonUp, libname), Cint, (Cint, Cint), gamepad, button)

# get the last gamepad button pressed
getgamepadbuttonpressed()::Int =
    ccall((:GetGamepadButtonPressed, libname), Cint, ())

# return gamepad axis count for a gamepad
getgamepadaxiscount(gamepad::Int)::Int =
    ccall((:GetGamepadAxisCount, libname), Cint, (Cint,), gamepad)

# return axis movement value for a gamepad axis
getgamepadaxismovement(gamepad::Int, axis::Int)::Float32 =
    ccall((:GetGamepadAxisMovement, libname), Cfloat, (Cint, Cint), gamepad, axis)

# set internal gamepad mappings (SDL_GameControllerDB)
setgamepadmappings(mappings::String)::Int =
    ccall((:SetGamepadMappings, libname), Cint, (Cstring,), mappings)


# input-related functions: mouse

# detect if a mouse button has been pressed once
ismousebuttonpressed(button::MouseButtons)::Bool =
    ccall((:IsMouseButtonPressed, libname), Cint, (Cint, ), Int(button))

# detect if a mouse button is being pressed
ismousebuttondown(button::MouseButtons)::Bool =
    ccall((:IsMouseButtonDown, libname), Cint, (Cint, ), Int(button))

# detect if a mouse button has been released once
ismousebuttonreleased(button::MouseButtons)::Bool =
    ccall((:IsMouseButtonReleased, libname), Cint, (Cint, ), Int(button))

# detect if a mouse button is NOT being pressed
ismousebuttonup(button::MouseButtons)::Bool =
    ccall((:IsMouseButtonUp, libname), Cint, (Cint, ), Int(button))

# returns mouse position X
getmousex()::Int =
    ccall((:GetMouseX, libname), Cint, ())

# returns mouse position Y
getmousey()::Int =
    ccall((:GetMouseY, libname), Cint, ())

# returns mouse position XY
getmouseposition()::Vector2 =
    ccall((:GetMousePosition, libname), Vector2, ())

# set mouse position XY
setmouseposition(x::Int, y::Int) =
    ccall((:SetMousePosition, libname), Cvoid, (Cint, Cint), x, y)

# set mouse offset
setmouseoffset(offsetx::Int, offsety::Int) =
    ccall((:SetMouseOffset, libname), Cvoid, (Cint, Cint), offsetx, offsety)

# set mouse scaling
setmousescale(scalex::Int, scaley::Int) =
    ccall((:SetMouseScale, libname), Cvoid, (Cint, Cint), scalex, scaley)

# returns mouse wheel movement Y
getmousewheelmove()::Float32 =
    ccall((:GetMouseWheelMove, libname), Cfloat, ())

# set mouse cursor
setmousecursor(cursor::Int) =
    ccall((:SetMouseCursor, libname), Cvoid, (Cint,), cursor)


# input-related functions: touch

# TODO: int GetTouchX(void);                                                    // Returns touch position X for touch point 0 (relative to screen size)
# TODO: int GetTouchY(void);                                                    // Returns touch position Y for touch point 0 (relative to screen size)
# TODO: Vector2 GetTouchPosition(int index);                                    // Returns touch position XY for a touch point index (relative to screen size)


# gestures and Touch Handling Functions (Module: gestures)

# TODO: void SetGesturesEnabled(unsigned int flags);                            // Enable a set of gestures using flags
# TODO: bool IsGestureDetected(int gesture);                                    // Check if a gesture have been detected
# TODO: int GetGestureDetected(void);                                           // Get latest detected gesture
# TODO: int GetTouchPointsCount(void);                                          // Get touch points count
# TODO: float GetGestureHoldDuration(void);                                     // Get gesture hold time in milliseconds
# TODO: Vector2 GetGestureDragVector(void);                                     // Get gesture drag vector
# TODO: float GetGestureDragAngle(void);                                        // Get gesture drag angle
# TODO: Vector2 GetGesturePinchVector(void);                                    // Get gesture pinch delta
# TODO: float GetGesturePinchAngle(void);                                       // Get gesture pinch angle


# Camera System Functions (Module: camera)

# TODO: void SetCameraMode(Camera camera, int mode);                            // Set camera mode (multiple camera modes available)
# TODO: void UpdateCamera(Camera *camera);                                      // Update camera position for selected mode

# set camera pan key to combine with mouse movement (free camera)
setcamerapancontrol(keypan::Int) =
    ccall((:SetCameraPanControl, libname), Cvoid, (Cint,), keypan)

# set camera alt key to combine with mouse movement (free camera)
setcameraaltcontrol(keyalt::Int) =
    ccall((:SetCameraAltControl, libname), Cvoid, (Cint,), keyalt)

# set camera smooth zoom key to combine with mouse (free camera)
setcamesmoothzoomcontrol(keysmoothzoom::Int) =
    ccall((:SetCameraSmoothZoomControl, libname), Cvoid, (Cint,), keysmoothzoom)

# set camera move controls (1st person and 3rd person cameras
setcameramovecontrols(frontkey::Int, backkey::Int, rightkey::Int, leftkey::Int, upkey::Int, downkey::Int) =
    ccall((:SetCameraMoveControls, libname), Cvoid, (Cint, Cint, Cint, Cint, Cint, Cint), frontkey, backkey, rightkey, leftkey, upkey, downkey)

# -----

drawtext(text::String, posx::Int, posy::Int, fontsize::Int, color::Color) =
    ccall((:DrawText, libname), Cvoid, (Cstring, Cint, Cint, Cint, Color), text, posx, posy, fontsize, color)

drawcirclev(center::Vector2, radius::Float64, color::Color) =
    ccall((:DrawCircleV, libname), Cvoid, (Vector2, Cfloat, Color), center, radius, color)

drawrectangle(posx::Int, posy::Int, width::Int, height::Int, color::Color) =
    ccall((:DrawRectangle, libname), Cvoid, (Cint, Cint, Cint, Cint, Color), posx, posy, width, height, color)
 
drawrectanglerec(rec::Rectangle, color::Color) =
    ccall((:DrawRectangleRec, libname), Cvoid, (Rectangle, Color), rec, color)

drawline(startposx::Int, startposy::Int, endposx::Int, endposy::Int, color::Color) =
    ccall((:DrawLine, libname), Cvoid, (Cint, Cint, Cint, Cint, Color), startposx, startposy, endposx, endposy, color)

fade(color::Color, alpha::Float64)::Color =
    ccall((:Fade, libname), Color, (Color, Cfloat), color, alpha)

drawrectanglelines(posx::Int, posy::Int, width::Int, height::Int, color::Color) =
    ccall((:DrawRectangleLines, libname), Cvoid, (Cint, Cint, Cint, Cint, Color), posx, posy, width, height, color)
