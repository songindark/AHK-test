#NoEnv
#SingleInstance, Force
SetKeyDelay, 50
SendMode, Input
SetBatchLines, -1
SetWorkingDir, %A_ScriptDir%
global v_switch := 1
rButton::i    
~w::
    {
        sleep,100
        send,{o down}
        loop
        {
            sleep,100
            If Not GetKeyState("w", "P")
                break

        }
        sleep,100
        send,{o up}
    }

  