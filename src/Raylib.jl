module Raylib

# types.jl
export Vector2
export Color
export Rectangle
export Camera2D

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

# functions.jl
export initwindow
export settargetfps
export windowshouldclose
export begindrawing
export clearbackground
export drawtext
export enddrawing
export closewindow
export iskeydown
export drawcirclev
export getmouseposition
export ismousebuttonpressed
export getmousewheelmove
export drawrectangle
export iskeypressed
export beginmode2d
export endmode2d
export drawrectanglerec
export drawline
export fade
export drawrectanglelines
export getrandomvalue


const libname = "libraylib.dylib"

include("types.jl")
include("functions.jl")

end # module