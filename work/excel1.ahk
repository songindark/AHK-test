#IfWinActive ahk_exe eps.exe
#SingleInstance force
#NoEnv
#Persistent
PostMessage, 0x50, 0, 0x4090409, , A 
filepath:="D:\2.xls"
xls:=Check(filepath,excel) ;检测是否打开了xls文件
if (xls="") ;
{
    InputBox,filepath,请打开相应Excel文件,请输入路径并确定行数后关闭EXCEL,,300,200,,,,15,%filepath%
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
if (R="0") 
{
    InputBox,R,请输入总共行数,字尾不能有空格或回车，BY宇佳
    if ErrorLevel
        ExitApp
    ; else
    ;     RunWait R
}
arr :=xls.sheets(1).Range["a1:c" r].value
;~ MsgBox % arr.MaxIndex(1) ; total rows
;~ MsgBox % arr.MaxIndex(2) ; total columns
; 创建图形界面
Gui, Add, ListView,r40 w200 gMyListView,命令缩写|字符|备注
GuiControl, -Redraw, gMyListView
Loop, % arr.MaxIndex(1)
{
    i:=A_Index
    LV_Add("", arr[i,1],arr[i,2],arr[i,3])
    L1:= arr[i,1]
    R1:= arr[i,2]
    L1:= ":*:" . L1
    Hotstring(L1, R1)
}
; LV_ModifyCol() ; 根据内容自动调整每列的大小.
Gui, Show ;, Center AutoSize, list
Gui,+AlwaysOnTop
GuiControl, +Redraw, gMyListView ; 重新启用重绘(上面把它禁用以节省系统资源).
MyListView:
    if A_GuiEvent = DoubleClick
    {
        MsgBox, 启动完成
    }
Return
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
Return
GuiClose(GuiHwnd) { ; 这个参数声明是可选的.
    MsgBox 4,, 确定退出吗?
    IfMsgBox No
return true ; true = 1
Else
ExitApp
}