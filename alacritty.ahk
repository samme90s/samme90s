#Requires AutoHotkey v2.0
#SingleInstance Force

; # = Windows key
; ^ = Ctrl
; ! = Alt
; + = Shift

; Ctrl + Ö
^ö:: {
    if WinExist("ahk_exe alacritty.exe") {
        WinActivate
    } else {
        Run '"C:\Program Files\Alacritty\alacritty.exe"'
    }
}
