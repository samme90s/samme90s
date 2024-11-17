#Requires AutoHotkey v2.0

SetTitleMatchMode(2)

; Only activate the hotkey if Scroll Lock is ON
#HotIf WinActive("Diablo") && GetKeyState("ScrollLock", "T")

min_delay := 250
max_delay := 650

W:: {
    Send("w")
    Sleep(RandSleep())
    Click("right")
    Sleep(RandSleep())
    Send("q")
}

B:: {
    Send("b")
    Sleep(RandSleep())
    Click("right")
    Sleep(RandSleep())
    Send("q")
}

; Function to generate a random sleep duration
; between Min and Max milliseconds
RandSleep() {
    return Random(min_delay, max_delay)
}

#HotIf  ; End of conditional block
