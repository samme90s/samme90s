#Requires AutoHotkey v2.0
#SingleInstance Force

SetTitleMatchMode(2)

; Only activate if the window title contains
; something of the following...
#HotIf WinActive("Diablo")

min_delay := 250
max_delay := 650

; Define hotkeys
W:: HandleKeyPress("w")
E:: HandleKeyPress("e")
R:: HandleKeyPress("r")
F:: HandleKeyPress("f")
B:: HandleKeyPress("b")

; Function to handle key press actions
HandleKeyPress(key) {
    Send(key)
    Sleep(RandSleep())
    Click("right")
    Sleep(RandSleep())
    Send("q")
}

; Function to generate a random sleep duration
RandSleep() {
    return Random(min_delay, max_delay)
}

#HotIf
; End of conditional block
