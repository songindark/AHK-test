#IfWinActive ahk_exe eps.exe
#SingleInstance force
#NoEnv 
#Warn 
#Persistent
; 切换为英文0x4090409=67699721
PostMessage, 0x50, 0, 0x4090409, , A 
; vba补零
; Sub test()
; arr = Sheets("sheet1").UsedRange
; i = 0
; For Each a In arr
; If IsNumeric(a) Then i = Application.Max(i, Len(a - Int(a)) - 1)
; Next
; Sheets("sheet1").UsedRange.NumberFormatLocal = "0." & Application.Rept("0", i)
; End Sub
;  坐标
:*:S11X::41542075.38