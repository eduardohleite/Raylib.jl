struct Color
    r::UInt8
    g::UInt8
    b::UInt8
    a::UInt8
end

struct Vector2
    x::Float32
    y::Float32
end

mutable struct Rectangle
    x::Float32
    y::Float32
    width::Float32
    heigth::Float32
end

mutable struct Camera2D
    offset::Vector2
    target::Vector2
    rotation::Float32
    zoom::Float32
end

const lightgray = Color(200, 200, 200, 255)
const gray = Color(130, 130, 130, 255)
const darkgray = Color(80, 80, 80, 255)
const yellow = Color(253, 249, 0, 255)
const gold = Color(255, 203, 0, 255)
const orange = Color(255, 161, 0, 255)
const pink = Color(255, 109, 194, 255)
const red = Color(230, 41, 55, 255)
const maroon = Color(190, 33, 55, 255)
const green = Color(0, 228, 48, 255)
const lime = Color(0, 158, 47, 255)
const darkgreen = Color(0, 117, 44, 255)
const skyblue = Color(102, 191, 255, 255)
const blue = Color(0, 121, 241, 255)
const darkblue = Color(0, 82, 172, 255)
const purple = Color(200, 122, 255, 255)
const violet = Color(135, 60, 190, 255)
const darkpurple = Color(112, 31, 126, 255)
const beige = Color(211, 176, 131, 255)
const brown = Color(127, 106, 79, 255)
const darkbrown = Color(76, 63, 47, 255)

const white = Color(255, 255, 255, 255)
const black = Color(0, 0, 0, 255)
const blank = Color(0, 0, 0, 0)
const magenta = Color(255, 0, 255, 255)
const raywhite = Color(245, 245, 245, 255)

@enum Keys begin
    keyright = 262
    keyleft = 263
    keyup = 264
    keydown = 265

    keya = 65
    keyr = 82
    key_s = 83
end

@enum MouseButtons begin
    mousebuttonleft = 0
    mousebuttonright = 1
    mousebuttonmiddle = 2
    mousebuttonside = 3
    mousebuttonextra = 4
    mousebuttonforward = 5
    mousebuttonback = 6
end