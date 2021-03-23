SetKeyDelay, 100
; 默认50
#IfWinActive ahk_exe Sakuna.exe
#SingleInstance force
#NoEnv 
#Warn
#Persistent
v_direction :=0
j::LButton
u::RButton
k::Space
h::MButton
c::LShift
f::d
^f::a
~d::
    v_direction := 0
    send {CtrlUp}
Return
*d::
    v_direction := 0
    send {CtrlUp}
Return
~a::
    if v_direction=0
    {
    v_direction := 1
    send {CtrlDown}
    }
Return