



35GuiEscape:
	Gui, 35:Hide
	return

35GuiSize:
	winTmpWidth := A_GuiWidth - 20
	winTmpHeight := A_GuiHeight - 50
	winTmpPosY := winTmpHeight + 15
	GuiControl, 35:Move, BoxEdit35_1, w%winTmpWidth%  h%winTmpHeight%
	GuiControl, 35:Move, Text35_1, y%winTmpPosY%
	return

35GuiContextMenu:
	Menu, Mou_plug_MenuEvery, Show, %A_GuiX%, %A_GuiY%
	return

36GuiEscape:
	Gui, 36:Hide
	return

36GuiSize:
	winTmpWidth := A_GuiWidth - 20
	winTmpHeight := A_GuiHeight - 20
	GuiControl, 36:Move, BoxEdit36_1, w%winTmpWidth%  h%winTmpHeight%
	return

ohmouplusub_showExplain:
	guf_showGuiAssign(35)
	return

ohmouplusub_showErrorMouse:
	guf_showGuiAssign(36)
	return

ohmouplusub_mousePlugSoftExitApp:
	ExitApp
	return

ohmouplusub_SubToolTipClose:
	if(gGloOnHeMoPlu_timerToolTip < A_Now){
		SetTimer, ohmouplusub_SubToolTipClose , Off
		func_toolTipClose(gGloOnHeMoPlu_toolTipNum)
	}
	return
