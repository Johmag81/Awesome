!z::
Click 3
ClipBoard =
Send, ^c
;WinActivate, ahk_class Chrome_WidgetWin_1
Send ^t
GuiControlGet, Check1
if (Check1 = 1){
MouseClick, left, 64, 326
Sleep 820
Click
MouseClick, left, 1016, 594
SendInput %Clipboard%
MouseClick, left, 1042, 798
}else{
MouseClick, left, 65, 300
Sleep 820
Click
MouseClick, left, 1007, 572
SendInput %Clipboard%
MouseClick, left, 1035, 772
}
Click
return

