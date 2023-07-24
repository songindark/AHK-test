#NoEnv
#SingleInstance, Force
SetKeyDelay, 50
SendMode, Input
SetBatchLines, -1
SetWorkingDir, %A_ScriptDir%
$s::Esc
$d::
    send {Esc}
    Sleep, 20
    send {LButton}
    Sleep, 320
    send {Esc}