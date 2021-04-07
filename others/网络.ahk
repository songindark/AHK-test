#SingleInstance, Force
#NoEnv 
#Warn 
#SingleInstance Force
#NoEnv
#Persistent
; Run, ::{7007acc7-3202-11d1-aad2-00805fc1270e},, Max
; sleep 150
; Send {Click 80 155 right}
; sleep 50
; send b
; sleep 50
filepath:="D:\CAD迷你看图\DWGView.exe"
if (filepath="D:\CAD迷你看图\DWGView.exe") 
{
    InputBox,filepath,请确认路径,,,300,200,,,,15,%filepath%
    if ErrorLevel
    {
        ExitApp
    }
    else
        ; RunWait %filepath%
    sleep 200
}
run,C:\Windows\System32\netsh interface set interface name="本地连接" admin=DISABLED
WinWaitClose, ahk_exe cmd.exe
if ErrorLevel
{
    msgbox, 错误
    return
}
else
run,%filepath%
; run,D:\CAD迷你看图\DWGView.exe
WinWait, ahk_exe DWGView.exe
if ErrorLevel
{
    msgbox, 错误
    return
}
else
    msgbox, 断网成功!
WinWaitClose, ahk_exe DWGView.exe
run,C:\Windows\System32\netsh interface set interface name="本地连接" admin=ENABLED
WinWaitClose, ahk_exe cmd.exe
if ErrorLevel
{
    msgbox, 错误
    return
}
else
    MsgBox, 正在重连网络!
ExitApp