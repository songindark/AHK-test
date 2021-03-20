IfWinActive ahk_exe code.exe
; 用window spy 查 ahk_exe对应Code.exe
#SingleInstance force
#NoEnv 
#Warn 
#Persistent
Loop
{
    MouseGetPos, xpos, ypos
    PixelGetColor currentColor, xpos, ypos
    ToolTip,(%xpos%`,%ypos%)-%currentColor%
}

