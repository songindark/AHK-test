#IfWinActive ahk_exe code.exe
; ��window spy �� ahk_exe��ӦCode.exe
#SingleInstance force
#NoEnv 
#Warn 
#Persistent
Ctext :="1"
Loop
{
    MouseGetPos, xpos, ypos
    PixelGetColor currentColor, xpos, ypos
    ToolTip,(%xpos%`,%ypos%)-%currentColor%
    if GetKeyState("capslock", "t")
    ;  ��ȡ��ֵΪ 1(true) ���������� "on"(�򿪵�), �� 0(false) �������� "off"(�رյ�).
        break
}
Ctext := "����Ϊ" . xpos . "," . ypos . "`r��ɫΪ" . currentColor
    MsgBox %Ctext%
clipboard := ""  ;�ü������ʼΪ��, ��������ʹ�� ClipWait ����ı�ʲôʱ�򱻸��Ƶ���������.
clipboard := Ctext