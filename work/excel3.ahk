#IfWinActive ahk_exe eps.exe
#SingleInstance force
#NoEnv
#Persistent
PostMessage, 0x50, 0, 0x4090409, , A 
filepath:="D:\1.xls"
xls:=Check(filepath,excel) ;检测是否打开了xls文件
if (xls="") ;
{
    InputBox,filepath,请打开相应Excel文件！,请输入路径并确定行数后关闭EXCEL,,300,200,,,,15,%filepath%
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
R=0
L=6

if (R="0") 
{
    InputBox,R,请输入总共行数,尽量输大一些，BY宇佳
    if ErrorLevel
        ExitApp
    ; else
    ;     RunWait R
}
if L=6
{
    InputBox,L,请输入小数位数,处理文字填9，处理数字的话填小数位数，不能超过六位且对第一列无效，BY宇佳
    if ErrorLevel
        ExitApp
}
if L=0
{
    L:=7
}
Else if L=9
{
    L:=0
}
Else
{
    L:=6-L
}
arr :=xls.sheets(1).Range["a1:c" r].value
;~ MsgBox % arr.MaxIndex(1) ; total rows
;~ MsgBox % arr.MaxIndex(2) ; total columns
; 创建图形界面
Gui, Add, ListView,r50 w400 gMyListView,Q(R-2)|W|E
GuiControl, -Redraw, gMyListView
Loop, % arr.MaxIndex(1)
{
    i:=A_Index
    LV_Add("", arr[i,1],arr[i,2],arr[i,3])
}
LV_ModifyCol() ; 根据内容自动调整每列的大小.
Gui, Show ;, Center AutoSize, list
Gui,+AlwaysOnTop
GuiControl, +Redraw, gMyListView ; 重新启用重绘(上面把它禁用以节省系统资源).
MyListView:
    if A_GuiEvent = DoubleClick
    {
        ; ToolTip You double-clicked row number %A_EventInfo%. Text: "%RowText%"
        ; ControlSend,,%RowText%,ahk_exe eps.exe
        RowText1:= arr[A_EventInfo,1]
        RowText2:= arr[A_EventInfo,2]
        RowText3:= arr[A_EventInfo,3]
        Length := StrLen(RowText1)
        RowText4 := SubStr(RowText1, 1, Length-2)
        Length := StrLen(RowText3)
        RowText3 := SubStr(RowText3, 1, Length-L)
        Length := StrLen(RowText2)
        RowText2 := SubStr(RowText2, 1, Length-L)
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
q::
    clipboard := RowText1
    send ^v
Return
w::
    clipboard := RowText2
    send ^v
Return
e::
    clipboard := RowText3
    send ^v
Return
r::
    clipboard := RowText4
    send ^v
Return
GuiClose(GuiHwnd) { ; 这个参数声明是可选的.
    MsgBox 4,, 确定退出吗?
    IfMsgBox No
return true ; true = 1
Else
ExitApp
}