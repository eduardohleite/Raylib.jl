module Raylib

# types.jl
export Vector2
export Vector3
export Vector4
export Color
export Rectangle
export Camera2D
export Camera3D
export Camera
export Matrix

export Keys, key_right, key_left, key_up, key_down, key_a, key_r, key_s
export MouseButtons, mousebutton_left, mousebutton_right, mousebutton_middle, mousebutton_side,
    mousebutton_extra, mousebutton_forward, mousebutton_back

export lightgray
export gray
export darkgray
export yellow
export gold
export orange
export pink
export red
export maroon
export green
export lime
export darkgreen
export skyblue
export blue
export darkblue
export purple
export violet
export darkpurple
export beige
export brown
export darkbrown

export white
export black
export blank
export magenta
export raywhite

# core.jl
export initwindow
export windowshouldclose
export closewindow
export iswindowready
export iswindowfullscreen
export iswindowhidden
export iswindowminimized
export iswindowmaximized
export iswindowfocused
export iswindowresized
export iswindowstate
export setwindowstate
export clearwindowstate
export togglefullscreen
export maximizewindow
export minimizewindow
export restorewindow
export setwindowtitle
export setwindowposition
export setwindowmonitor
export setwindowminsize
export setwindowsize
export getscreenwidth
export getscreenheight
export getmonitorcount
export getcurrentmonitor
export getmonitorposition
export getmonitorwidth
export getmonitorheight
export getmonitorphysicalwidth
export getmonitorphysicalheight
export getmonitorrefreshrate
export getwindowposition
export getwindowscaledpi
export getmonitorname
export setclipboardtext
export getclipboardtext

export showcursor
export hidecursor
export iscursorhidden
export enablecursor
export disablecursor
export iscursoronscreen

export clearbackground
export begindrawing
export enddrawing
export beginmode2d
export endmode2d
export endtexturemode
export endshadermode
export beginblendmode
export endblendmode
export beginscissormode
export endscissormode

export getcameramatrix2d
export getworldtoscreen2d
export getscreentoworld2d

export settargetfps
export getfps
export getframetime
export gettime

export getrandomvalue
export takescreenshot
export setconfigflags

export openurl

export iskeypressed
export iskeydown
export iskeyreleased
export iskeyup
export setexitkey
export getkeypressed
export getcharpressed

export isgamepadavailable
export isgamepadname
export getgamepadname
export isgamepadbuttonpressed
export isgamepadbuttondown
export isgamepadbuttonreleased
export isgamepadbuttonup
export getgamepadbuttonpressed
export getgamepadaxiscount
export getgamepadaxismovement
export setgamepadmappings

export ismousebuttonpressed
export ismousebuttondown
export ismousebuttonreleased
export ismousebuttonup
export getmousex
export getmousey
export getmouseposition
export setmouseposition
export setmouseoffset
export setmousescale
export getmousewheelmove
export setmousecursor

export setcamerapancontrol
export setcameraaltcontrol
export setcamesmoothzoomcontrol
export setcameramovecontrols

# shapes.jl
export drawtext
export drawcirclev
export drawrectangle
export drawrectanglerec
export drawline
export drawrectanglelines

export fade


const libname = "libraylib.dylib"

include("types.jl")
include("core.jl")
include("shapes.jl")

end # module