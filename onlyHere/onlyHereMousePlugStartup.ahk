



guf_guiFontFromSizeAndName(gloma_fontSize, glomare_fontNameAll, 35)
Gui, 35:Add, Edit, X10 Y5 h180 vBoxEdit35_1 Multi VScroll
Gui, 35:Add, Text, X10 y+10 vText35_1, 右クリック位置
Gui, 35:+Resize
Gui, 35:Color, FFFFB2


guf_guiFontFromSizeAndName(gloma_fontSize, glomare_fontNameAll, 36)
Gui, 36:Add, Edit, X10 Y5 h200 vBoxEdit36_1 Multi VScroll HwndhwndEditBox36_1
Gui, 36:+AlwaysOnTop
Gui, 36:+Resize
Gui, 36:Color, FF6400


Gui, 35:Show, Hide x200 y300 w270 h200, %gGloOnHeMoPlu_winTitle35%
Gui, 36:Show, Hide x200 y30 w270 h220, %gGloOnHeMoPlu_winTitle36%
