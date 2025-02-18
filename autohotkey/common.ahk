#Requires AutoHotkey v2.0
#SingleInstance Force

; Remaps the "Windows Copilot" key to RCTRL
<+<#f23::Send "{Blind}{LShift Up}{LWin Up}{RControl Down}"
<+<#f23 Up:: Send "{RControl Up}"
