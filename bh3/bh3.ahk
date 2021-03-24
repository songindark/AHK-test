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
~f::
    if v_switch = 1
    {
        send u
        sleep,50
        send {u down}
        sleep,950
        send {u up}
    }
Return
buttom1:
    send u
Return
buttom2:
    send i
Return
~j::
if v_switch = 1
SetTimer,buttom1,100
{
    Loop
        {
            GetKeyState, state, j, P;
                if state = U 
                { 
                SetTimer,buttom1,off
                Break  
                }
                Else   
                {
                Continue
                }
        }
}
Return
~h::
if v_switch = 1
SetTimer,buttom2,100
{
    Loop
        {
            GetKeyState, state, h, P;
                if state = U 
                { 
                SetTimer,buttom2,off
                Break  
                }
                Else   
                {
                Continue
                }
        }
}
Return
