; #IfWinActive ahk_exe notepad
;����
#SingleInstance force
#NoEnv 
; #Warn
#Persistent
PostMessage, 0x50, 0, 0x4090409, , A 
filepath:="C:\1.xls"
xls:=Check(filepath,excel) ;����Ƿ����xlsx�ļ�
if (xls="") ;
{
    InputBox,filepath,�����ӦExcel�ļ���,������xls·��,,300,200,,,,15,%filepath%
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
    InputBox,R,�������ܹ�����
    if ErrorLevel
        ExitApp
    ; else
    ;     RunWait R
}
arr :=xls.sheets(1).Range["a1:c" r].value
;~ MsgBox % arr.MaxIndex(1) ; total rows
;~ MsgBox % arr.MaxIndex(2) ; total columns
; ����ͼ�ν���
Gui, Add, ListView,r33 w180 gMyListView,N|X|Y
GuiControl, -Redraw, gMyListView
Loop, % arr.MaxIndex(1)
{
    i:=A_Index
    LV_Add("", arr[i,1],arr[i,2],arr[i,3])
}
LV_ModifyCol() ; ���������Զ�����ÿ�еĴ�С.
Gui, Show , Center AutoSize, list
Gui,+AlwaysOnTop
GuiControl, +Redraw, gMyListView ; ���������ػ�(������������Խ�ʡϵͳ��Դ).
MyListView:
    if A_GuiEvent = DoubleClick
    {
        ; ToolTip You double-clicked row number %A_EventInfo%. Text: "%RowText%"
        ; ControlSend,,%RowText%,ahk_exe notepad
        RowText1:= arr[A_EventInfo,1]
        RowText2:= arr[A_EventInfo,2]
        RowText3:= arr[A_EventInfo,3]
        Length := StrLen(RowText1)
        RowText4 := SubStr(RowText1, 1, Length-2)
    }
Return

; ��������
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
GuiClose(GuiHwnd) { ; ������������ǿ�ѡ��.
    MsgBox 4,, ȷ���˳���?
    IfMsgBox No
return true ; true = 1
}
IfWinActive, ahk_exe notepad
{
q::
    clipboard := RowText1
    send ^v
Return
}
IfWinActive, ahk_exe notepad
{
w::
    clipboard := RowText2
    send ^v
Return
}
IfWinActive, ahk_exe notepad
{
e::
    clipboard := RowText3
    send ^v
Return
}

IfWinActive, ahk_exe notepad
{

r::
    clipboard := RowText4
    send ^v
Return
}