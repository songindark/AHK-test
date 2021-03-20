#IfWinActive notepad.exe
    {
        #SingleInstance force
        #NoEnv 
        #Warn 
        #Persistent

        Loop{

            MouseGetPos, xpos, ypos
            PixelGetColor currentColor, xpos, ypos
            ToolTip,(%xpos%`,%ypos%)-%currentColor%

        }
    }
