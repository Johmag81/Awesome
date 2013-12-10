LShift::
WinActivate ahk_class IEFrame

pwb := IEGet("MapMenu - ")
pwb.document.all.selectForm.value := 5
return