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

^q::SendInput LMV eller ber�rd kommun
^w::SendInput Vid innehav av trygghetslarm eller hemarbetsplats och fastighets�garen anser att kabeluts�ttning beh�vs, v�nligen kontakta Geomatikk igen.
^e::SendInput Ledningar i kartan kan vara i os�kert l�ge. Vid behov av kabeluts�ttning v�nligen kontakta Geomatikk p� telefonnummer 026-123500.
^r::SendInput Uts�ttare kommer att kontakta dig f�r att avtala en n�rmare tid f�r uts�ttning. 
!q::SendInput �versikt endast f�r orientering - ej till kund.

�::
Click 3
ClipBoard := 
send ^c
Sleep 420
clipboard = %clipboard%
StringSplit, coordinate, clipboard, `;
StringTrimLeft, coordinate2, coordinate2, 1

kartTitel = Utskriftskarta
kartURL = https://proxy.evy.telia.se/kartf/AdvancedPrint/PrintMap.aspx
titel = Telia - Kartf�nster
url = https://proxy.evy.telia.se/kartf/start/autdefault.asp 
pwb := IEGet("Telia - Kartf�nster")


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

pwb := IEGet("Telia - Kartf�nster")
pwb.document.parentWindow.frames("searchframe").document.all.txtXKoord.value := coordinate1
pwb.document.parentWindow.frames("searchframe").document.all.txtYKoord.value := coordinate2
pwb.document.parentWindow.frames("searchframe").document.all.btnSearchKoord.click()



