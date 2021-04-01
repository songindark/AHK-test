; #IfWinActive ahk_exe eps.exe
;两行
#SingleInstance force
#NoEnv 
; #Warn
#Persistent
PostMessage, 0x50, 0, 0x4090409, , A 
filepath:="C:\1.xls"
xls:=Check(filepath,excel) ;检测是否打开了xlsx文件

if (xls="") ;
{
    InputBox,filepath,请打开相应Excel文件！,请输入xls路径,,300,200,,,,15,%filepath%
    if ErrorLevel
    {
        msgbox, 没有选择正确文件！
        ExitApp
    }
    else
        RunWait %filepath%
    ; 持续等待，直到打开
    ; loop
    ; {
    ;     xls:=Check(filepath,excel)
    ;     ToolTip 等待excel启动完成
    ;     Sleep,5001.000000
    ;     if a_index>5
    ;         MsgBox 等待太长时间了，请检查下。
    ; }
    ; until IsObject(xls)
}
xls:=ComObjget(filepath)
ToolTip
TrayTip ,,已就绪
R=0
if (R="0") 
{
    InputBox,R,请输入总共行数
    if ErrorLevel
        ExitApp
    ; else
    ;     RunWait R
}
arr :=xls.sheets(1).Range["a1:c" r].value
;~ MsgBox % arr.MaxIndex(1) ; total rows
;~ MsgBox % arr.MaxIndex(2) ; total columns
; 创建图形界面
Gui, Add, ListView,r33 w180 gMyListView,N|X|Y
GuiControl, -Redraw, MyListView
Loop, % arr.MaxIndex(1)
{
    i:=A_Index
    LV_Add("", arr[i,1],arr[i,2],arr[i,3])
}
LV_ModifyCol() ; 根据内容自动调整每列的大小.
Gui, Show , Center AutoSize, list
Gui,+AlwaysOnTop
GuiControl, +Redraw, MyListView ; 重新启用重绘(上面把它禁用以节省系统资源).
MyListView:
    if A_GuiEvent = DoubleClick
    {
        ; LV_GetText(RowText1, A_EventInfo,1) ; 从行的第1个字段中获取文本.
        ; LV_GetText(RowText2, A_EventInfo,2) ; 从行的第2个字段中获取文本.
        ; LV_GetText(RowText3, A_EventInfo,3) ; 从行的第1个字段中获取文本.
        ; ToolTip You double-clicked row number %A_EventInfo%. Text: "%RowText%"
        ;自己重定义了一个
        ; RowText:= ""
        ; RowText:= arr[A_EventInfo,2]
        ; 内容
        ; ControlSend,,%RowText%,ahk_exe eps.exe
        RowText1:= arr[A_EventInfo,1]
        RowText2:= arr[A_EventInfo,2]
        RowText3:= arr[A_EventInfo,3]
        Length := StrLen(RowText1)
        RowText1 := SubStr(RowText1, 1, Length-2)
    }
Return

; 辅助函数
Check(filepath,oExcel)
{
    for Item in oExcel.workbooks
    {
        ;Name 文件名 FullName路径名
        ;~ data .= "Name:`t"oexcel.workbooks(A_index).FullName "`n"
        IF (oexcel.workbooks(A_index).FullName=filepath)
            xls:=item
    }
    if IsObject(xls)
        return xls
    else
        return ""
}

GuiClose(GuiHwnd) { ; 这个参数声明是可选的.
    MsgBox 4,, 确定退出吗?
    IfMsgBox No
return true ; true = 1
}

IfWinActive, ahk_exe eps.exe
{
q::
    clipboard := RowText1
    send ^v
Return
}

IfWinActive, ahk_exe eps.exe
{
w::
    clipboard := RowText2
    send ^v
Return
}

IfWinActive, ahk_exe eps.exe
{
e::
    clipboard := RowText3
    send ^v
Return
}
