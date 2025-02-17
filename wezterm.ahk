#Requires AutoHotkey v2.0
#SingleInstance Force

; # = Windows key
; ^ = Ctrl
; ! = Alt
; + = Shift

; Ctrl + Ö
^ö:: {
    if WinExist("ahk_exe wezterm-gui.exe") {
        WinActivate
    } else {
        Run '"C:\Program Files\WezTerm\wezterm-gui.exe"'
    }
}
