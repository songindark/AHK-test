; #IfWinActive ahk_exe eps.exe
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
ToolTip
TrayTip ,,�Ѿ���
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
GuiControl, -Redraw, MyListView
Loop, % arr.MaxIndex(1)
{
    i:=A_Index
    LV_Add("", arr[i,1],arr[i,2],arr[i,3])
}
LV_ModifyCol() ; ���������Զ�����ÿ�еĴ�С.
Gui, Show , Center AutoSize, list
Gui,+AlwaysOnTop
GuiControl, +Redraw, MyListView ; ���������ػ�(������������Խ�ʡϵͳ��Դ).
MyListView:
    if A_GuiEvent = DoubleClick
    {
        ; LV_GetText(RowText1, A_EventInfo,1) ; ���еĵ�1���ֶ��л�ȡ�ı�.
        ; LV_GetText(RowText2, A_EventInfo,2) ; ���еĵ�2���ֶ��л�ȡ�ı�.
        ; LV_GetText(RowText3, A_EventInfo,3) ; ���еĵ�1���ֶ��л�ȡ�ı�.
        ; ToolTip You double-clicked row number %A_EventInfo%. Text: "%RowText%"
        ;�Լ��ض�����һ��
        ; RowText:= ""
        ; RowText:= arr[A_EventInfo,2]
        ; ����
        ; ControlSend,,%RowText%,ahk_exe eps.exe
        RowText1:= arr[A_EventInfo,1]
        RowText2:= arr[A_EventInfo,2]
        RowText3:= arr[A_EventInfo,3]
        Length := StrLen(RowText1)
        RowText1 := SubStr(RowText1, 1, Length-2)
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
