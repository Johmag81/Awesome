$^q::
IniRead, CtrlQ, Frekventa.ini, Texter, 1
SendInput %CtrlQ%
return

$^w::
IniRead, CtrlW, Frekventa.ini, Texter, 2
SendInput %CtrlW%
return

$^e::
IniRead, CtrlE, Frekventa.ini, Texter, 3
SendInput %CtrlE%
return

$^r::
IniRead, CtrlR, Frekventa.ini, Texter, 4
SendInput %CtrlR%
return

$!q::
IniRead, AltQ, Frekventa.ini, Texter, 7
SendInput %AltQ%
return

$!w::
SendInput %Egen_textW%
return

$!e::
SendInput %Egen_textE%
return

$!r::
SendInput %Egen_textR%
return

$!a::
IniRead, AltS, Frekventa.ini, Texter, 5
SendInput %AltS%
return

$!s::
IniRead, AltA, Frekventa.ini, Texter, 6
SendInput %AltA%
return
