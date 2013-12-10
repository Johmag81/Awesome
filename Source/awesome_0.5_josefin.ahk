;
; FUNCTIONS
;

IEGet(WinTitle="ahk_class IEFrame", Svr#=1) 
{ ; based on ComObjQuery docs
static msg := DllCall("RegisterWindowMessage", "str", "WM_HTML_GETOBJECT")
, IID := "{0002DF05-0000-0000-C000-000000000046}" ; IID_IWebBrowserApp
; , IID := "{332C4427-26CB-11D0-B483-00C04FD90119}" ; IID_IHTMLWindow2
SendMessage msg, 0, 0, Internet Explorer_Server%Svr#%, %WinTitle%
if (ErrorLevel != "FAIL") {
lResult:=ErrorLevel, VarSetCapacity(GUID,16,0)
if DllCall("ole32\CLSIDFromString", "wstr","{332C4425-26CB-11D0-B483-00C04FD90119}", "ptr",&GUID) >= 0 {
DllCall("oleacc\ObjectFromLresult", "ptr",lResult, "ptr",&GUID, "ptr",0, "ptr*",pdoc)
return ComObj(9,ComObjQuery(pdoc,IID,IID),1), ObjRelease(pdoc)
}
}
} 

;
; TRIGGERS & ACTION MAPPING
;

^q::SendInput LMV eller berörd kommun
^w::SendInput Vid innehav av trygghetslarm eller hemarbetsplats och fastighetsägaren anser att kabelutsättning behövs, vänligen kontakta Geomatikk igen.
^e::SendInput Ledningar i kartan kan vara i osäkert läge. Vid behov av kabelutsättning vänligen kontakta Geomatikk 026-123500.
^r::SendInput Utsättare kommer att kontakta er för att avtala en närmare tid vid utsättning. 
!q::SendInput Översikt endast för orientering - ej till kund.
!a::SendInput Vi har försökt nå dig för handläggning av ditt ärende, ledningar i kartan är i osäkert läge. Vänligen kontakta Geomatikk 026-123500 innan markarbete i ärendet utförs.
!s::SendInput Observera att luftledningar finns i området.
^<::SendInput / Josefin Lindberg {Enter} Geomatikk


§::
Click 3
ClipBoard := 
send ^c
Sleep 420
clipboard = %clipboard%
StringSplit, coordinate, clipboard, `;
StringTrimLeft, coordinate2, coordinate2, 1

kartTitel = Utskriftskarta
kartURL = https://proxy.evy.telia.se/kartf/AdvancedPrint/PrintMap.aspx
titel = Telia - Kartfönster
url = https://proxy.evy.telia.se/kartf/start/autdefault.asp 
pwb := IEGet("Telia - Kartfönster")


for window in ComObjCreate("Shell.Application").Windows
if ( window.LocationName = kartTitel && window.LocationURL = kartURL )
{
window.quit()
}


WinActivate ahk_class IEFrame

SetTitleMatchMode, 2
IfWinExist, - Windows Internet Explorer
     WinActivate, - Windows Internet Explorer ; Activate IE if it does
Send ^1
Sleep 420

pwb := IEGet("Telia - Kartfönster")

if (pwb.document.parentWindow.frames("searchframe").document.all.rbKoord.checked = 0){
pwb.document.parentWindow.frames("searchframe").document.all.rbKoord.click()
Sleep 100
}

pwb.document.parentWindow.frames("searchframe").document.all.txtXKoord.value := coordinate1
pwb.document.parentWindow.frames("searchframe").document.all.txtYKoord.value := coordinate2
pwb.document.parentWindow.frames("searchframe").document.all.btnSearchKoord.click()
return

!x:: 
Click 3
Sleep 420
Send ^+z
return

#z::
BlockInput, on
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
BlockInput, off
return



^Lwin::
Click 3
ClipBoard := 
send ^c
Sleep 420
clipboard = %clipboard%
StringSplit, coordinate, clipboard, `(
StringTrimLeft, coordinate2, coordinate2, 1
StringSplit, coordinate, coordinate2, `)
StringTrimRight, coordinate1, coordinate1, 1
coordinate1 := coordinate1, _skanova

WinActivate ahk_class IEFrame

SetTitleMatchMode, 3
IfWinExist, Spara som
WinActivate, Spara som
pwb := IEGet("Spara som")
send {Tab}
send {Tab}
send {Tab}
send {Tab}
send {Tab}
send ^{BS}
send ^{BS}
sendInput %coordinate1% Skanova
clipboard := coordinate1
return