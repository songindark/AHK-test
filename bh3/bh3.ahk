SetKeyDelay, 100
; 默认50
#IfWinActive ahk_exe BH3.exe
#SingleInstance force
#NoEnv 
#Warn
#Persistent
v_switch := 1
~enter::
    ; 双暂停开关
    v_switch := 1-v_switch
$f::
    if v_switch = 1
    {
        send u
        sleep,50
        send {u down}
        sleep,850
        send {u up}
    }
Return
$j::
    if v_switch = 1
    {
        send u
    }
Return
$h::
    if v_switch = 1
    {
        send i
    }
Return