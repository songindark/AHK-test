;#IfWinActive ahk_exe code.exe
#SingleInstance force
#NoEnv 
#Warn 
#Persistent
;切换为中文0x8040804=134481924
; PostMessage, 0x50, 0, 0x8040804, , A 
; 切换为英文0x4090409=67699721
PostMessage, 0x50, 0, 0x4090409, , A 
:*:sc::scale


:*:br::boundary
