

40GuiEscape:
	gumoplugf_hideGui40()
	return

40GuiContextMenu:
	Menu, Mou_Plug_MenuEvery, Show, %A_GuiX%, %A_GuiY%
	return

45GuiEscape:
	Gui, 45:Show, Hide
	return

46GuiEscape:
	Gui, 46:Show, Hide
	return

47GuiEscape:
	Gui, 47:Show, Hide
	return

48GuiEscape:
	Gui, 48:Hide
	return

49GuiClose:
	gumoplugf_hideGui49()
	return

49GuiEscape:
	gumoplugf_hideGui49()
	return

; 半透明のウインドウ
49GuiContextMenu:
	Edit49_1 := guf_getControl( "Edit49_1", 49 )
	mous_mocroClickSelect(Edit49_1)
	return



; マウス、のエントリー用
SubButton40_1_1:
	Gui, 45:Submit, NoHide
	Gui, 40:Submit, NoHide
	mous_mouseDragEntry(UpDown45_1, UpDown45_2, UpDown45_3, UpDown45_4, Radio45_1, Edit45_1, List40_1, Edit40_1_1)
	return

SubButton40_1_2:
	Gui, 40:Submit, NoHide
	mous_mouseDragLoad(List40_1)
	return

SubButton40_1_3:
	Gui, 40:Submit, NoHide
	mous_mouseDragExecute(List40_1, "", "", "", "", "", "")
	return

SubButton40_2_1:
	Gui, 46:Submit, NoHide
	Gui, 40:Submit, NoHide
	mous_mouseMoveFromNowEntry(List40_2, UpDown46_1, UpDown46_2, Radio46_2, Edit46_1, Radio46_3, Edit40_2_1)
	return

SubButton40_2_2:
	Gui, 40:Submit, NoHide
	mous_mouseMoveFromNowLoad(List40_2)
	return

SubButton40_2_3:
	Gui, 40:Submit, NoHide
	mous_mouseMoveFromNowExecute(List40_2, "", "", "", "", "")
	return

SubButton40_3_1:
	Gui, 47:Submit, NoHide
	Gui, 40:Submit, NoHide
	mous_mouseRelativEntry(UpDown47_1, UpDown47_2, Radio47_2, Edit47_1, List40_3, Edit40_3_1)
	return

SubButton40_3_2:
	Gui, 40:Submit, NoHide
	mous_mouseRelativLoad(List40_3)
	return

SubButton40_3_3:
	Gui, 40:Submit, NoHide
	mous_mouseRelativExecute(List40_3, "", "", "", "")
	return


SubButton40_4_1:
	Gui, 48:Submit, NoHide
	Gui, 40:Submit, NoHide
	mous_mouseClickPointEntry(UpDown48_1, UpDown48_2, Radio48_1, Edit48_1, List40_4, Edit40_4_1)
	return

SubButton40_4_2:
	Gui, 40:Submit, NoHide
	mous_mouseClickPointLoad(List40_4)
	return

SubButton40_4_3:
	Gui, 40:Submit, NoHide
	mous_mouseClickOnlyExecute(List40_4, "", "", "", "", "", "", "")
	return

SubButton40_4_4:
	mous_mousePosInClickPointGui()
	return



SubButton45_1:
	Gui, 45:Submit, NoHide
	mous_guiHideAndMoveAndDrag(UpDown45_1, UpDown45_2, UpDown45_3, UpDown45_4, Radio45_1, Edit45_1)
	return

SubButton46_1:
	Gui, 46:Submit, NoHide
	mous_guiHideAndMoveOrDrag(UpDown46_1, UpDown46_2, Edit46_1, Radio46_2, Radio46_3)
	return

SubButton47_1:
	Gui, 47:Submit, NoHide
	mous_guiHideAndMoveOrDragRelativ(UpDown47_1, UpDown47_2, Radio47_2, Edit47_1)
	return

SubButton48_1:
	Gui, 48:Submit, NoHide
	mous_guiHideAndClickOnly(UpDown48_1, UpDown48_2, Radio48_1, Checkbox48_1, Checkbox48_2, Checkbox48_3, Edit48_1)
	return

