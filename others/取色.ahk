#IfWinActive ahk_exe code.exe
; 用window spy 查 ahk_exe对应Code.exe
FileEncoding, UTF-8-RAW
#SingleInstance force
#NoEnv 
#Warn 
#Persistent
Ctext :="1"
Loop
{
    MouseGetPos, xpos, ypos
    PixelGetColor currentColor, xpos, ypos
    ToolTip,(%xpos%`,%ypos%)-%currentColor%
    if GetKeyState("capslock", "t")
    ;  获取的值为 1(true) 表明按键是 "on"(打开的), 而 0(false) 表明它是 "off"(关闭的).
        break
}
Ctext := "坐标为" . xpos . "," . ypos . "`r颜色为" . currentColor
    MsgBox %Ctext%
clipboard := ""  ;让剪贴板初始为空, 这样可以使用 ClipWait 检测文本什么时候被复制到剪贴板中.
clipboard := Ctext