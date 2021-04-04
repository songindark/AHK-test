#IfWinActive ahk_exe MonsterHunterWorld.exe
#SingleInstance force
#NoEnv 
#Warn
#Persistent
~enter::Suspend
~f::j
~x::t
~space::WheelUp
g::
        {
                SetTimer, Label_1, 50
        }
g up::
        {
                SetTimer, Label_1, Off
        }
Label_1:
        SendInput, p