!z::
Click 3
ClipBoard =
Send, ^c
WinActivate, ahk_class Chrome_WidgetWin_1
Send, ^t
MouseClick, left, 65, 300
Sleep 820
Click
MouseClick, left, 1007, 572
SendInput %Clipboard%
MouseClick, left, 1035, 772
Click
return