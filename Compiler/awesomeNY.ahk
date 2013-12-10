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

;Behövs för kompileringen så att det bara behövs en fil
;FileInstall, Awesome_logga.jpg, Awesome.jpg
FileInstall, favicon.ico, favicon.ico
FileInstall, settingsDefault.ini, settings.ini

;Hämtar en akutell varsion av gemensamma texter 
FileCopy, G:\IT\Program\AutoHotKey\Gemensamma texter\Frekventa_texter_gemensam.ini, Frekventa.ini

;Tömmer papperskorgen 30ggn du startar Awesome
IniRead, dag, settings.ini, Dag, 1
if dag < 29
{
	dag++
	IniWrite, %dag%, settings.ini, Dag, 1
} 
else 
{ 
	dag := 0
	IniWrite, %dag%, settings.ini, Dag, 1
	Run, rensa.bat, G:\IT\Program\AutoHotKey\Compiler
}

;Dölj skräpfiler
FileSetAttrib +H, favicon.ico
;FileSetAttrib +H, Awesome.jpg
FileSetAttrib +H, Frekventa.ini
FileSetAttrib +H, settings.ini


;Sätt ikon på programmet
Menu, Tray, Icon, favicon.ico


;Läs in sparade inställningar här
IniRead, TextW, settings.ini, EgnaTexter, 1
IniRead, TextE, settings.ini, EgnaTexter, 2
IniRead, TextR, settings.ini, EgnaTexter, 3
IniRead, Frekvent1, Frekventa.ini, Texter, 1
IniRead, Frekvent2, Frekventa.ini, Texter, 2
IniRead, Frekvent3, Frekventa.ini, Texter, 3
IniRead, Frekvent4, Frekventa.ini, Texter, 4
IniRead, Frekvent5, Frekventa.ini, Texter, 5
IniRead, Frekvent6, Frekventa.ini, Texter, 6
IniRead, Frekvent7, Frekventa.ini, Texter, 7
IniRead, kartmapp, settings.ini, kartmapp, 1
Egen_textW = %TextW%
Egen_textE = %TextE%
Egen_textR = %TextR%

;Lägg till tabbar.
Gui, Add, Tab, x2 y0 w470 h700 , Egna kortkommandon|Gemensamma kortkommandon| Om

;Lägg till radiobuttons
;Gui, Add, Radio, x320 y495 w110 h20 vCheck1 checked%Checked1%, Med bokmärkesfält
;Gui, Add, Radio, x320 y535 w110 h20 vCheck2 checked%Checked2%, Utan bokmärkesfält

;Textrutor
Gui, Add, Edit, x32 y200 w140 h20 , %TextW%
Gui, Add, Edit, x32 y240 w140 h20 , %TextE%
Gui, Add, Edit, x32 y280 w140 h20 , %TextR%

;Texter
gui, font, s10, Verdana
Gui, Add, Text, x32 y150 w140 h20 , Egen text.
Gui, Add, Text, x192 y150 w160 h40 , Snabbkommando.
gui, font, s8, Verdana
Gui, Add, Text, x192 y200 w140 h20 , Alt + W.
Gui, Add, Text, x192 y240 w140 h20 , Alt + E.
Gui, Add, Text, x192 y280 w140 h20 , Alt + R.
Gui, Add, Text, x32 y340 w140 h20 , Kopiera koordinater
Gui, Add, Text, x192 y340 w140 h20 , §
Gui, Add, Text, x32 y370 w140 h20 , Telefon - kontroll
Gui, Add, Text, x192 y370 w140 h20 , Alt + Z
Gui, Add, Text, x32 y400 w140 h20 , Ringa upp
Gui, Add, Text, x192 y400 w140 h20 , Alt + X
Gui, Add, Text, x32 y430 w140 h20 , Öppna Spara Som
Gui, Add, Text, x192 y430 w140 h20 , Caps Lock
gui, add, text, x10 y180 w425 0x10  ;Horizontal Line > Etched Gray
gui, add, text, x10 y320 w425 0x10  ;Horizontal Line > Etched Gray
gui, add, text, x10 y460 w425 0x10  ;Horizontal Line > Etched Gray


;Loggan
;första advent
if A_YWeek = 201349
{
Gui, Add, Picture, x52 y35 w320 h100 gPicProc, G:\IT\Program\AutoHotKey\Compiler\Awesome_logga_snoe_1.gif
}else if A_YWeek = 201350 ;andra advent
{
Gui, Add, Picture, x52 y35 w320 h100 gPicProc, G:\IT\Program\AutoHotKey\Compiler\Awesome_logga_snoe_2.gif
}else if A_YWeek = 201351 ;tredje advent
{
Gui, Add, Picture, x52 y35 w320 h100 gPicProc, G:\IT\Program\AutoHotKey\Compiler\Awesome_logga_snoe_3.gif
}else if A_YWeek = 201352 ;fjärde advent
{
Gui, Add, Picture, x52 y35 w320 h100 gPicProc, G:\IT\Program\AutoHotKey\Compiler\Awesome_logga_snoe_4.gif
} else
{
;Vanliga logga
Gui, Add, Picture, x52 y35 w320 h100 gPicProc, G:\IT\Program\AutoHotKey\Compiler\Awesome_logga.jpg
} 
;Knappar
Gui, Add, Button, x57 y530 w140 h40 +Center, Uppdatera
Gui, Add, Button, x57 y480 w140 h40 , Spara
Gui, Add, Button, x247 y480 w140 h40 , Minimera
Gui, Add, Button, x247 y530 w140 h40 , Stäng
Gui, Add, Button, x392 y35 w40 h40 , Kartmapp

; Tab 2
Gui, Tab, 2
gui, font, s10, Verdana
Gui, Add, Text, x30 y30 w140 h20 , Frekvent text
Gui, Add, Text, x320 y30 w160 h40 , Snabbkommando
gui, font, s8, Verdana
Gui, Add, Text, x320 y70 w140 h20 , Ctrl + Q.
Gui, Add, Text, x320 y140 w140 h20 , Ctrl + W.
Gui, Add, Text, x320 y210 w140 h20 , Ctrl + E.
Gui, Add, Text, x320 y280 w140 h20 , Ctrl + R.
Gui, Add, Text, x320 y350 w140 h20 , Alt + A.
Gui, Add, Text, x320 y420 w140 h20 , Alt + S.
Gui, Add, Text, x320 y490 w140 h20 , Alt + Q.
Gui, Add, Edit, +Disabled x30 y60 w250 h50, %Frekvent1%
Gui, Add, Edit, +Disabled x30 y130 w250 h50, %Frekvent2%
Gui, Add, Edit, +Disabled x30 y200 w250 h50, %Frekvent3%
Gui, Add, Edit, +Disabled x30 y270 w250 h50, %Frekvent4%
Gui, Add, Edit, +Disabled x30 y340 w250 h50, %Frekvent5%
Gui, Add, Edit, +Disabled x30 y410 w250 h50, %Frekvent6%
Gui, Add, Edit, +Disabled x30 y480 w250 h50, %Frekvent7%
Gui, Add, Button, x30 y550 w120 h30 , Ändra
Gui, Add, Button, +Disabled x192 y550 w120 h30 , Spara_Som

; Tab 3
Gui, Tab, 3
gui, font, s14, Verdana
gui, font, cCC3300
Gui, Add, Text, x120 y40 w160 h40 , A
gui, font, cCC9900
Gui, Add, Text, x140 y40 w160 h40 , w
gui, font, c99CC00
Gui, Add, Text, x160 y40 w160 h40 , e
gui, font, c33CC00
Gui, Add, Text, x180 y40 w160 h40 , s
gui, font, cCC0033
Gui, Add, Text, x200 y40 w160 h40 , o
gui, font, cFF470A
Gui, Add, Text, x220 y40 w160 h40 , m
gui, font, cFF7547
Gui, Add, Text, x240 y40 w160 h40 , e
gui, font, c00CC33
Gui, Add, Text, x260 y40 w160 h40 , 1
gui, font, cCC0099
Gui, Add, Text, x275 y40 w160 h40 , .
gui, font, c47D1FF
Gui, Add, Text, x285 y40 w160 h40 , 1

gui, font, s8, Verdana
gui, font, c000000
gui, add, text, x10 y70 w425 0x10  ;Horizontal Line > Etched Gray
Gui, Add, Text, x100 y90 w300 h40 , Kodat av Johan Magnusson och Rickard Qvist
Gui, Add, Text, x130 y110 w300 h40 , johan.magnusson@geomatikk.se rickard.qvist@geomatikk.se
Gui, Add, Text, x160 y160 w250 h40 , © 23/10 2013

;Ladda igång UI
Gui, Show, x127 y87 h593 w440, Awesome 1.1


;Händer lite roliga saker när man klickar på bilden
PicProc:
if A_Wday = 6
{
Loop, 4
{
SetCapsLockState, on
Sleep 100
SetScrollLockState, on
Sleep 100
SetNumlockState, on
Sleep 100
SetCapsLockState, off
Sleep 100
SetNumLockState, off
Sleep 100
SetScrollLockState, off 
Sleep 100
SetNumlockState, on
}
}
return

;Döljer stängknappen för alla fönster som heter något på Awesome 1.
DisableCloseButton()
Return

DisableCloseButton(hWnd="") {

 If hWnd=

    hWnd:=WinExist("Awesome 1.")

 hSysMenu:=DllCall("GetSystemMenu","Int",hWnd,"Int",FALSE)

 nCnt:=DllCall("GetMenuItemCount","Int",hSysMenu)

 DllCall("RemoveMenu","Int",hSysMenu,"UInt",nCnt-1,"Uint","0x400")

 DllCall("RemoveMenu","Int",hSysMenu,"UInt",nCnt-2,"Uint","0x400")

 DllCall("DrawMenuBar","Int",hWnd)

Return ""

}

;Visa scriptet från minimerat läge
^0::
Gui Show
return

;Ladda om scriptet
ButtonReload:
FileDelete Frekventa.ini ;För att uppdatera Frekventa texter
Run, Update_awesome.exe, G:\IT\Program\AutoHotKey
return

;Stäng ner scriptet
ButtonStäng:
MsgBox, 4, Stänga, Är du säker på att du vill stänga av Awesome? :(
IfMsgBox Yes
{
FileDelete Frekventa.ini 
ExitApp
}

IfMsgBox, No
{
return
}

ButtonKartmapp:
FileSelectFolder, kartmapp
return

ButtonSpara:
;Sparar ner egna texterna
ControlGetText, Egen_textW, Edit1
ControlGetText, Egen_textE, Edit2
ControlGetText, Egen_textR, Edit3
IniWrite, %Egen_textW%, settings.ini, EgnaTexter, 1
IniWrite, %Egen_textE%, settings.ini, EgnaTexter, 2
IniWrite, %Egen_textR%, settings.ini, EgnaTexter, 3
IniWrite, %kartmapp%, settings.ini, kartmapp, 1

;Sparar ner state på radiobuttons
;GuiControlGet, Check1
;GuiControlGet, Check2
;IniWrite, %Check1%, settings.ini, RadioButtons , 1
;IniWrite, %Check2%, settings.ini, RadioButtons , 2
;FileSetAttrib +H, settings.ini
return

ButtonSpara_Som:
ControlGetText, Frekvent1, Edit4
ControlGetText, Frekvent2, Edit5
ControlGetText, Frekvent3, Edit6
ControlGetText, Frekvent4, Edit7
ControlGetText, Frekvent5, Edit8
ControlGetText, Frekvent6, Edit9
ControlGetText, Frekvent7, Edit10
IniWrite, %Frekvent1%, G:\IT\Program\AutoHotKey\Gemensamma texter\Frekventa_texter_gemensam.ini, Texter, 1
IniWrite, %Frekvent2%, G:\IT\Program\AutoHotKey\Gemensamma texter\Frekventa_texter_gemensam.ini, Texter, 2
IniWrite, %Frekvent3%, G:\IT\Program\AutoHotKey\Gemensamma texter\Frekventa_texter_gemensam.ini, Texter, 3
IniWrite, %Frekvent4%, G:\IT\Program\AutoHotKey\Gemensamma texter\Frekventa_texter_gemensam.ini, Texter, 4
IniWrite, %Frekvent5%, G:\IT\Program\AutoHotKey\Gemensamma texter\Frekventa_texter_gemensam.ini, Texter, 5
IniWrite, %Frekvent6%, G:\IT\Program\AutoHotKey\Gemensamma texter\Frekventa_texter_gemensam.ini, Texter, 6
IniWrite, %Frekvent7%, G:\IT\Program\AutoHotKey\Gemensamma texter\Frekventa_texter_gemensam.ini, Texter, 7
FileDelete Frekventa.ini ;För att uppdatera Frekventa texter
MsgBox Ändringarna är sparade! Alla klienter måste nu trycka på Uppdatera.
Reload
FileCopy, G:\IT\Program\AutoHotKey\Gemensamma texter\Frekventa_texter_gemensam.ini, Frekventa.ini
return

;Minimera fönstret till tray
ButtonMinimera:
MsgBox Fönstret minimeras. För att öppna fönstret klicka Ctrl + 0.
 Gui Hide
return

ButtonÄndra:
InputBox, password, Skriv in lösenord, , hide 
if(password != "admin")
{
    MsgBox, Det krävs ett korrekt lösenord för att ändra texterna.
}else {
	GuiControl, enabled, Spara_Som
	GuiControl, enabled, %Frekvent1%
	GuiControl, enabled, %Frekvent2%
	GuiControl, enabled, %Frekvent3%
	GuiControl, enabled, %Frekvent4%
	GuiControl, enabled, %Frekvent5%
	GuiControl, enabled, %Frekvent6%
	GuiControl, enabled, %Frekvent7%
}
return


#include Subrutiner\frekventa_texter.ahk
#include Subrutiner\Koordinater.ahk
#include Subrutiner\uppringning.ahk
#include Subrutiner\tfn_filter.ahk
#include Subrutiner\Aerende_klipp.ahk
#include Subrutiner\nyfunktion1.ahk

GuiClose:
ExitApp


