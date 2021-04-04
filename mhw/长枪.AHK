SetKeyDelay, 50
; 默认50
#IfWinActive ahk_exe MonsterHunterWorld.exe
#SingleInstance force
#NoEnv 
#Warn
#Persistent
global v_switch := 1
~enter::
    ; 双暂停开关
    v_switch := 1-v_switch
~x::
    if v_switch = 1
    {
        sleep,150
        send {LButton}
    }
Return
~e::
    if v_switch = 1
    {
        send,{u down}
        send,{r down}
        sleep,50
        send,{r up}
        send,{u up}
    }
Return
~g::
    if v_switch = 1
    {
        sleep,200
        send,{y down}
        sleep,200
        send,{y down}
        loop
        {
            sleep,100
            If Not GetKeyState("g", "P")
                break
        }
        sleep,100
        send,{y up}
    }
Return