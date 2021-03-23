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
f::LShift
m::LAlt
b::Tab