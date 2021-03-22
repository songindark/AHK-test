SetKeyDelay, 100
; 默认50
#IfWinActive ahk_exe Sakuna.exe
#SingleInstance force
#NoEnv 
#Warn
#Persistent
v_direction :=1
j::LButton
u::RButton
k::Space
h::MButton
c::LShift
f::d
^f::a
~a::
    v_direction=0
    send {LControl down}
Return
~d::
    v_direction=1
    send {LControl up}
Return
