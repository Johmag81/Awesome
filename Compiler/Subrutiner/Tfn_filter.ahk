!z::
Click 3
clipboard := 
Send, ^c
ClipBoard = %clipboard%
sleep 100
filterlaenk = http://www.geokollen.se/inquiries?filter=sta=1:2;hkt=
Run %filterlaenk%%clipboard%;
return