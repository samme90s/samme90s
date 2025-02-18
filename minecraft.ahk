#Requires AutoHotkey v2.0
#SingleInstance Force

SetTitleMatchMode(2)

; Only activate if the window title contains
; something of the following...
#HotIf WinActive("Minecraft")

;;;;; F - F3 (Debug) ;;;;;;
f:: Send("{F3}")

;;;;; Shift + F - F3 (Debug) ;;;;;;
+f:: Send("+{F3}")

;;;;; Ctrl + F - F3 (Debug) ;;;;;;
^f:: Send("^{F3}")

#HotIf
; End of conditional block
