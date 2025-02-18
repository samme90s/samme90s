#Requires AutoHotkey v2.0
#SingleInstance Force

; # = Windows key
; ^ = Ctrl
; ! = Alt
; + = Shift

; Ctrl + Ö
^ö:: {
    if WinExist("ahk_exe WindowsTerminal.exe") {
        WinActivate("ahk_exe WindowsTerminal.exe")
    } else {
        Run("wt")
    }
}
