;Kolla om installationsmappen finns, om den gör det så tar den bort nuvarande exe för att uppdatera subrutinerna.
IfNotExist, H:\Awesome
{
FileCreateDir, H:\Awesome
}else {
FileDelete, H:\Awesome\*.exe
}

;Kompilera scriptet och spara det lokalt på H:
Run, G:\IT\Program\AutoHotKey\Compiler\Ahk2exe.exe /in "G:\IT\Program\AutoHotKey\Compiler\awesome.ahk" /out "H:\Awesome\Awesome.exe" /icon "G:\IT\Program\AutoHotKey\Compiler\favicon.ico"

;Om det inte finns någon genväg till scriptet i autostart skapas det. 
IfNotExist, %A_Startup%\Awesome.lnk
{
;Dödar alla nuvarande awesomeprocesser, tar bort allt gammalt som heter awesome i startup och lägger in det nya.
Run, taskkill.exe /F /IM awesome_*
FileDelete, %A_Startup%\*awesome*.*
MsgBox, 4, Autostart, Vill du lägga in Awesome i autostart?
IfMsgBox, Yes, FileCreateShortCut, G:\IT\Program\AutoHotKey\Update_awesome.exe, %A_Startup%\Awesome.lnk, G:\IT\Program\AutoHotKey\Update_awesome.exe
}

;Fin splash
SplashImage, G:\IT\Program\AutoHotKey\Compiler\Awesome_logga.jpg,b fs18, Uppdaterar filer...
Sleep, 2000

;Starta awesome.
Run, H:\Awesome\Awesome.exe, H:\Awesome
ExitApp