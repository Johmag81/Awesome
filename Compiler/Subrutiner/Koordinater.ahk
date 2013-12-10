§::
Click 3
ClipBoard := 
send ^c
Sleep 100
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
{
    WinActivate, - Windows Internet Explorer ; Activate IE if it does
	Send ^1
Sleep 100
}

if (pwb.document.parentWindow.frames("searchframe").document.all.rbKoord.checked = 0)
{
pwb.document.parentWindow.frames("searchframe").document.all.rbKoord.click()
Sleep 100
}

pwb.document.parentWindow.frames("searchframe").document.all.txtXKoord.value := coordinate1
pwb.document.parentWindow.frames("searchframe").document.all.txtYKoord.value := coordinate2
pwb.document.parentWindow.frames("searchframe").document.all.btnSearchKoord.click()

SetTitleMatchMode, 2
WinActivate, https://proxy.evy.telia.se/?TYP=LGK&TLO

coordinate1 := 
coordinate2 :=
return