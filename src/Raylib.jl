module Raylib

# types.jl
export Vector2
export Color
export Rectangle
export Camera2D

export Keys, keyright, keyleft, keyup, keydown, keya, keyr, key_s
export MouseButtons, mousebuttonleft, mousebuttonright, mousebuttonmiddle, mousebuttonside,
    mousebuttonextra, mousebuttonforward, mousebuttonback

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