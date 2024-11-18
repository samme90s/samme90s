#Requires AutoHotkey v2.0

SetTitleMatchMode(2)

; Only activate the hotkey if Scroll Lock is ON
#HotIf WinActive("Warcraft") && GetKeyState("ScrollLock")

;;;;; W - Up ;;;;;;
w:: Send("{Up Down}")
w up:: Send("{Up Up}")

;;;;; A - Left ;;;;;;
a:: Send("{Left Down}")
a up:: Send("{Left Up}")

;;;;; S - Down ;;;;;;
s:: Send("{Down Down}")
s up:: Send("{Down Up}")

;;;;; D - Right ;;;;;;
d:: Send("{Right Down}")
d up:: Send("{Right Up}")

#HotIf  ; End of conditional block
