; #IfWinActive ahk_exe MonsterHunterRiseDemo.exe
#SingleInstance force
#NoEnv 
#Warn
#Persistent
~enter::Suspend
~c::o
~g::l
; Wheelup::j
~WheelDown::y
~e::
            If Not GetKeyState("w", "P")
        send,{p down}
        sleep,100
        send,{p up}
Return