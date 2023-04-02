

Mou_Plug_SubCancel:

	return


Mou_Plug_SubShowAssignToAssignLoad:
	rmopluf_beforeWindowControl()
	mous_AssignMousDrag()
	return

Mou_Plug_SubShowAssignToAssignLoadFromWindow:
	rmopluf_beforeWindowControl()
	mous_AssignMousDragFromWindow()
	return

Mou_Plug_SubShowCurrentToAssign:
	GuiControl,46:Focus , UpDown46_1
	GuiControl,46: , Radio46_3, 1
	guf_showGuiAssign(46)

	return

Mou_Plug_SubShowCurrentToAssignFromWindow:
	mous_AssignMousMoveFromWindow()
	return

Mou_Plug_SubShowCurrentToPlusPos:
	GuiControl,47:Focus , UpDown47_1
	GuiControl,47: , Radio47_1, 1
	guf_showGuiAssign(47)

	return

Mou_Plug_SubShowClickPoint:
	GuiControl,48:Focus , UpDown48_1
	guf_showGuiAssign(48)
	return


; マウスカーソル位置の色をRGBで表示
Mou_Plug_SubColorSetPos:
	rmopluf_beforeWindowControl()
	mous_mousPosColor()
	return

Mou_Plug_SubSearchColorPos:
	rmopluf_beforeWindowControl()
	CoordMode, Mouse, Screen
	mous_setEditMousePos( "&colorSearch", "" )
	GuiControl, 45:, Radio45_1, 1
	return


Mou_Plug_SubSearchImgPos:
	rmopluf_beforeWindowControl()
	CoordMode, Mouse, Screen
	mous_setEditMousePos( "&imageSearch", "40" )
	GuiControl, 45:, Radio45_1, 1
	return

Mou_Plug_SubSearchColorPosFromWindow:
	rmopluf_beforeWindowControl()
	mous_SearchColorPosFromWindow()
	return


Mou_Plug_SubSearchImgPosFromWindow:
	rmopluf_beforeWindowControl()
	mous_ImgSearchFromWindow()
	return


Mou_Plug_SubShowAssignToAssign:
	guf_showGuiAssign(45)
	return


Mou_Plug_SubGetClassNN:
	rmopluf_beforeWindowControl()
	mous_getClassNN()
	return

Mou_Plug_SubGetWindowHandle:
	rmopluf_beforeWindowControl()
	mous_getWindowHandle()
	return

Mou_Plug_SubShowEntryAssignToAssign:
	GuiControl, 40:Choose, Tab40_1 , 1
	Gui, 40:Show
	return

Mou_Plug_SubShowEntryCurrentToAssign:
	GuiControl, 40:Choose, Tab40_1 , 2
	Gui, 40:Show
	return

Mou_Plug_SubShowEntryCurrentToPlusPos:
	GuiControl, 40:Choose, Tab40_1 , 3
	Gui, 40:Show
	return

Mou_Plug_SubShowEntryClickPoint:
	GuiControl, 40:Choose, Tab40_1 , 4
	Gui, 40:Show
	return

Mou_Plug_SubClickPointChange1:
	mous_clickPointChangeAndOutput(1)
	return

Mou_Plug_SubClickPointChange2:
	mous_clickPointChangeAndOutput(2)
	return

Mou_Plug_SubClickPointChange3:
	mous_clickPointChangeAndOutput(3)
	return

Mou_Plug_SubClickPointChange4:
	mous_clickPointChangeAndOutput(4)
	return

Mou_Plug_SubClickPointChange5:
	mous_clickPointChangeAndOutput(5)
	return

Mou_Plug_SubClickPointClick:
	rmopluf_beforeWindowControl()
	mous_clickPointClick()
	return

Mou_Plug_SubMouseMoveFromClickPoint:
	rmopluf_beforeWindowControl()
	mous_mouseMoveFromClickPointPos()
	return

Mou_Plug_SubEntryFromClick:
	gumoplugf_hideGui40()
	mous_mocroClickEntry(1)
	return

Mou_Plug_SubEntryFromClickFromWindow:
	gumoplugf_hideGui40()
	mous_mocroClickEntry(2)
	return

Mou_Plug_SubEntryFromClickFromNowPos:
	gumoplugf_hideGui40()
	mous_mocroClickEntry(3)
	return

Mou_Plug_SubMenuEvery:
	rmopluf_beforeWindowControl()
	CoordMode, Menu , Screen
	Menu, Mou_Plug_MenuEvery, Show, %Mou_Plug_O_menuPosX%, %Mou_Plug_O_menuPosY%
	return

Mou_Plug_SubShowVersion:
	gumoplugf_cleatedDateMousePlug()
	return
