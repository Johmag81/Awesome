^Lwin::
Click 3
ClipBoard := 
send ^c
Sleep 420
clipboard = %clipboard%
StringSplit, klipp, clipboard, `(
StringTrimLeft, klipp2, klipp2, 1
StringSplit, klipp, klipp2, `)
StringTrimRight, klipp1, klipp1, 1
klipp1 := klipp1, Skanova

WinActivate ahk_class IEFrame

SetTitleMatchMode, 3
if WinExist("Save As"){
WinActivate, Save As
pwb := IEGet("Save As")
send {Tab}
send {Tab}
send {Tab}
send {Tab}
send {Tab}
send ^{BS}
send ^{BS}
sendInput %klipp1% Skanova
clipboard := klipp1
}else if WinExist("Spara som"){
WinActivate, Spara som
pwb := IEGet("Spara som")
send {Tab}
send {Tab}
send {Tab}
send {Tab}
send {Tab}
send ^{BS}
send ^{BS}
sendInput %klipp1% Skanova
clipboard := klipp1
}
return