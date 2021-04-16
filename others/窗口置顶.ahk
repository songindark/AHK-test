#SingleInstance force
#NoEnv 
#Warn 
#Persistent
SendMode Input
SetWorkingDir, %A_ScriptDir%
; CTRL+F12窗口制顶
^F12::
winset alwaysontop,toggle,A
winget, Transparent, Transparent, A
if (Transparent)
{
    winset Transparent,Off,A
    winset alwaysontop,off,A
}
else
{
    winset Transparent,250,A
    winset alwaysontop,on,A
}
return
