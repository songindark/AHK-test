#IfWinActive ahk_exe eps.exe
#SingleInstance force
#NoEnv
#Persistent
PostMessage, 0x50, 0, 0x4090409, , A 
filepath:="D:\2.xls"
xls:=Check(filepath,excel) ;����Ƿ����xls�ļ�
if (xls="") ;
{
    InputBox,filepath,�����ӦExcel�ļ�,������·����ȷ��������ر�EXCEL,,300,200,,,,15,%filepath%
    if ErrorLevel
    {
        msgbox, û��ѡ����ȷ�ļ���
        ExitApp
    }
    else
        RunWait %filepath%
    ; �����ȴ���ֱ����
    ; loop
    ; {
    ;     xls:=Check(filepath,excel)
    ;     ToolTip �ȴ�excel�������
    ;     Sleep,5001.000000
    ;     if a_index>5
    ;         MsgBox �ȴ�̫��ʱ���ˣ������¡�
    ; }
    ; until IsObject(xls)
}
xls:=ComObjget(filepath)
R=0
if (R="0") 
{
    InputBox,R,�������ܹ�����,��β�����пո��س���BY���
    if ErrorLevel
        ExitApp
    ; else
    ;     RunWait R
}
arr :=xls.sheets(1).Range["a1:c" r].value
;~ MsgBox % arr.MaxIndex(1) ; total rows
;~ MsgBox % arr.MaxIndex(2) ; total columns
; ����ͼ�ν���
Gui, Add, ListView,r40 w200 gMyListView,������д|�ַ�|��ע
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
; LV_ModifyCol() ; ���������Զ�����ÿ�еĴ�С.
Gui, Show ;, Center AutoSize, list
Gui,+AlwaysOnTop
GuiControl, +Redraw, gMyListView ; ���������ػ�(������������Խ�ʡϵͳ��Դ).
MyListView:
    if A_GuiEvent = DoubleClick
    {
        MsgBox, �������
    }
Return
Check(filepath,oExcel)
{
    for Item in oExcel.workbooks
    {
        ;Name �ļ��� FullName·����
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
GuiClose(GuiHwnd) { ; ������������ǿ�ѡ��.
    MsgBox 4,, ȷ���˳���?
    IfMsgBox No
return true ; true = 1
Else
ExitApp
}