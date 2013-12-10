^Lwin::
Click 3
ClipBoard :=
send ^c
winwait, ahk_class #32770
clipboard = %clipboard%
StringSplit, klipp, clipboard, `(
StringTrimLeft, klipp2, klipp2, 1
StringSplit, klipp, klipp2, `)
StringTrimRight, klipp1, klipp1, 1

urklipp = %klipp1% Skanova
urklippOver = %klipp1%
klipp :=
klipp1 :=
klipp2 :=

WinActivate, Save As
WinActivate, Spara som

ControlSetText, Edit1, %urklipp%, ahk_class #32770
clipboard := urklippOver
ControlFocus, Edit1
Send {End}
return