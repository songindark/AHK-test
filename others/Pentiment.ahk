#IfWinActive ahk_exe Pentiment.exe
#SingleInstance force
#NoEnv
//SendMode Input
~LButton::
        Sleep 100
        Send, {RButton}

