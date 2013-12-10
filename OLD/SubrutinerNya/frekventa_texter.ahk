IniRead, CtrlQ, Subrutiner\Frekventa.ini, Texter, 1
IniRead, CtrlW, Subrutiner\Frekventa.ini, Texter, 2
IniRead, CtrlE, Subrutiner\Frekventa.ini, Texter, 3
IniRead, CtrlR, Subrutiner\Frekventa.ini, Texter, 4
IniRead, AltQ, Subrutiner\Frekventa.ini, Texter, 7
IniRead, AltS, Subrutiner\Frekventa.ini, Texter, 5
IniRead, AltA, Subrutiner\Frekventa.ini, Texter, 6
$^q::
SendInput %CtrlQ%
return

$^w::
SendInput %CtrlW%
return

$^e::
SendInput %CtrlE%
return

$^r::
SendInput %CtrlR%
return

$!q::
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
SendInput %AltS%
return

$!s::
SendInput %AltA%
return
