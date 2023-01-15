;#IfWinActive MonsterHunterRise.exe
#SingleInstance force
#NoEnv 
#Warn
#Persistent
~enter::Suspend
~c::h
~b::o
;~x::z
~g::l
~f::i
~e::
;P向后长枪
            If Not GetKeyState("w", "P")
        send,{p down}
        sleep,100
        send,{p up}
Return