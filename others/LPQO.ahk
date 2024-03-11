
#IfWinActive
#SingleInstance force
#NoEnv 
#Warn
#Persistent
~enter::Suspend
~q::5
$LButton::
        Loop
        {
                Sleep 20
                If Not GetKeyState("LButton", "P")
                Break
                Send {LButton Down}
                Sleep 10
                Send {LButton Up}
                Sleep 10
                Send {P}
                Sleep 10
        }
Return