~CapsLock::
SetTitleMatchMode, 2
IfWinActive, Utskriftskarta
{
WinMaximize, A
MouseClick, left, 56, 58
WinWaitActive, Print
SendInput {Enter}
SetCapsLockState, off
}
return