
#SingleInstance force
#NoEnv 
#Warn
#Persistent
~f::s
~g::
    If Not GetKeyState("k", "P")
    send,{s down}
    sleep,10
    send,{j down}
    send,{j up}
    sleep,10
    send,{s up}
Return