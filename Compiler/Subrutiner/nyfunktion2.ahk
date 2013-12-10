!z::
Click 3
ClipBoard =
Send, ^c
Send ^t
GuiControlGet, Check1
if (Check1 = 1){
Sleep 600
MouseClick, left, 64, 300
MouseClick, left, 952, 557
SendInput %Clipboard%
SendInput {Enter}
}else{
Sleep 600
MouseClick, left, 65, 274
MouseClick, left, 957, 534
SendInput %Clipboard%
SendInput {Enter}
}
return