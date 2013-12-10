!z::
Click 3
ClipBoard =
Send, ^c
;WinActivate, ahk_class Chrome_WidgetWin_1
Send ^t
MouseClick, left, 64, 326
Sleep 820
Click
MouseClick, left, 1016, 594
SendInput %Clipboard%
MouseClick, left, 1042, 798
Click
return