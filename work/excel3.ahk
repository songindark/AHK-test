#IfWinActive ahk_exe eps.exe
#SingleInstance force
#NoEnv
#Persistent
PostMessage, 0x50, 0, 0x4090409, , A 
filepath:="D:\1.xls"
xls:=Check(filepath,excel) ;����Ƿ����xls�ļ�
if (xls="") ;
{
    InputBox,filepath,�����ӦExcel�ļ���,������·����ȷ��������ر�EXCEL,,300,200,,,,15,%filepath%
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
L=6

if (R="0") 
{
    InputBox,R,�������ܹ�����,�������һЩ��BY���
    if ErrorLevel
        ExitApp
    ; else
    ;     RunWait R
}
if L=6
{
    InputBox,L,������С��λ��,����������9���������ֵĻ���С��λ�������ܳ�����λ�ҶԵ�һ����Ч��BY���
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
; ����ͼ�ν���
Gui, Add, ListView,r50 w400 gMyListView,Q(R-2)|W|E
GuiControl, -Redraw, gMyListView
Loop, % arr.MaxIndex(1)
{
    i:=A_Index
    LV_Add("", arr[i,1],arr[i,2],arr[i,3])
}
LV_ModifyCol() ; ���������Զ�����ÿ�еĴ�С.
Gui, Show ;, Center AutoSize, list
Gui,+AlwaysOnTop
GuiControl, +Redraw, gMyListView ; ���������ػ�(������������Խ�ʡϵͳ��Դ).
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
GuiClose(GuiHwnd) { ; ������������ǿ�ѡ��.
    MsgBox 4,, ȷ���˳���?
    IfMsgBox No
return true ; true = 1
Else
ExitApp
}