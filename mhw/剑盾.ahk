SetKeyDelay, 50
#IfWinActive ahk_exe MonsterHunterWorld.exe
#SingleInstance force
#NoEnv 
#Warn
#Persistent
~enter::Suspend
~f::j
~x::t
~g::
    sleep,100
    send,{p down}
    sleep,100
    send,{p down}
    loop
    {
        sleep,100
        If Not GetKeyState("g", "P")
        {
            break
        }
    }
    sleep,100
    send,{p up}
Return