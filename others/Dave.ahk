#IfWinActive ahk_exe DaveTheDiver.exe
#SingleInstance force
#NoEnv
//SendMode Input
t::
    While GetKeyState("t", "P")
    {
        Send, {F down}
        Sleep 5
        Send, {F up}
        Send, {LButton}
    }
return
~r::i
