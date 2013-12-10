echo off 
rd /s /q "%systemdrive%\$recycle.bin" 
md "%systemdrive%\$recycle.bin" && attrib +h "%systemdrive%\$recycle.bin"