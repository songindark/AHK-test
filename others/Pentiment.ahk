#IfWinActive ahk_exe Pentiment.exe
#SingleInstance force
#NoEnv
//SendMode Input
LButton::
    MouseGetPos, start_x, start_y
    Sleep, 50
    MouseMove, %start_x%, %start_y%
    Sleep, 100
    Click, Right
    return
