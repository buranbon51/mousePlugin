; 必須 glob  func  guf  


mous_dragBefore(screen, Title="A") {
	if (screen == 1) {						;Screenかウインドウから相対位置か
		CoordMode, Mouse, Screen
		; ウインドウのタイトルが  見つかったら  Trueを返す
		;if(func_foundWindow(Title)){
		IfWinExist , %Title%
		{
			; タイトルの指定があった場合のみアクティブ
			if(Title != "A") {
				WinActivate, %Title%
				WinWaitActive, %Title%, , 1
			}
		}
	} else {
		CoordMode, Mouse, Relative
		;if(func_foundWindow(Title)){
		IfWinExist , %Title%
		{
			; 指定のウインドウが空でも、Aをアクティブに
			WinActivate, %Title%
			WinWaitActive, %Title%, , 1
		} else {
			rmopluf_easyExplainMousePlug("ウインドウが見つからず : " . Title)
			return False					; 指定のウインドウが見つからなければ中止
		}
	}
	return  True
}


mous_moveAndDrag(mous1, mous2, mous3, mous4, radio1, mous5){
	mous5 := Trim(mous5)
	if(mous5 == "") {
		mous_dragBefore(radio1, "A")
		;if( mous_dragBefore(radio1, "A") == False ) {
		;	return
		;}
	} else {
		if( mous_dragBefore(radio1 ,mous5) ) {
			windc_anyWaitActive()
		} else {
			return
		}
	}
	MouseClickDrag, LEFT, %mous1%, %mous2%, %mous3%, %mous4%, %Mou_Plug_O_speed%
}

mous_guiHideAndMoveAndDrag(mous1, mous2, mous3, mous4, radio1, mous5){
	moveAndDragGuiFlag := False
	entryGuiFlag := False
	IfWinExist, %gloma_winTitleDrag%
	{
		Gui, 45:Hide
		moveAndDragGuiFlag := True
		WinWaitNotActive, %gloma_winTitleDrag%, ,1
	}

	IfWinExist, %gloma_winTitleMouseEntry%
	{
		Gui, 40:Hide
		entryGuiFlag := True
		WinWaitNotActive, %gloma_winTitleMouseEntry%, ,1
	}
	mous_moveAndDrag(mous1, mous2, mous3, mous4, radio1, mous5)
	if( moveAndDragGuiFlag ){
		Gui, 45:Show
	}
	if( entryGuiFlag ){
		Gui, 40:Show
	}
}

mous_moveOrDragRelativ(upDown1, upDown2, dragFlag, winTitle){
	winTitle := Trim(winTitle)
	if(winTitle == "") {
		mous_dragBefore(1, "A")
		;if ( mous_dragBefore(1, "A") == False ) {
		;	return
		;}
	} else {
		if ( mous_dragBefore(1 ,winTitle) ) {
			windc_anyWaitActive()
		} else {
			return
		}
	}
	if( dragFlag ){
		MouseClickDrag, LEFT, 0, 0, %upDown1%, %upDown2%, %Mou_Plug_O_speed%, R
	} else {
		MouseMove, %upDown1%, %upDown2%, %Mou_Plug_O_speed%, R
	}
}

mous_guiHideAndMoveOrDragRelativ(upDown1, upDown2, dragFlag, winTitle){
	moveOrDragRelativGuiFlag := False
	entryGuiFlag := False
	IfWinExist, %gloma_winTitleMoveOrDragRelativ%
	{
		Gui, 47:Hide
		moveOrDragRelativGuiFlag := True
		WinWaitNotActive, %gloma_winTitleMoveOrDragRelativ%, ,1
	}

	IfWinExist, %gloma_winTitleMouseEntry%
	{
		Gui, 40:Hide
		entryGuiFlag := True
		WinWaitNotActive, %gloma_winTitleMouseEntry%, ,1
	}

	mous_moveOrDragRelativ(upDown1, upDown2, dragFlag, winTitle)
	if( moveOrDragRelativGuiFlag ){
		Gui, 47:Show
	}
	if( entryGuiFlag ){
		Gui, 40:Show
	}
}

mous_mousePosRelativeLeft(posX, speed, relativeWin=False){
	if(relativeWin) {
		CoordMode, Mouse, Relative
	} else {
		CoordMode, Mouse, Screen
	}
	MouseGetPos, OutputVarX, OutputVarY
	MouseMove, %posX%, %OutputVarY%, %speed%
}

mous_mousePosRelativeUp(posY, speed, relativeWin=False){
	if(relativeWin) {
		CoordMode, Mouse, Relative
	} else {
		CoordMode, Mouse, Screen
	}
	MouseGetPos, OutputVarX, OutputVarY
	MouseMove, %OutputVarX%, %posY%, %speed%
}

mous_mousePosRelativeRight(xFromRight, speed, relativeWin=False){
	if(relativeWin) {
		CoordMode, Mouse, Relative
		WinGetActiveStats, Title, Width, Height, X, Y
		x2 := Width - xFromRight
	} else {
		CoordMode, Mouse, Screen
		x2 := A_ScreenWidth - xFromRight
	}
	MouseGetPos, OutputVarX, OutputVarY
	MouseMove, %x2%, %OutputVarY%, %speed%
}

mous_mousePosRelativeDown(yFromDown, speed, relativeWin=False){
	if(relativeWin) {
		CoordMode, Mouse, Relative
		WinGetActiveStats, Title, Width, Height, X, Y
		y2 := Height - yFromDown
	} else {
		CoordMode, Mouse, Screen
		y2 := A_ScreenHeight - yFromDown
	}
	MouseGetPos, OutputVarX, OutputVarY
	MouseMove, %OutputVarX%, %y2%, %speed%
}


mous_mousePosCenterLeft(posX, speed, relativeWin=False){
	if(relativeWin) {
		CoordMode, Mouse, Relative
		WinGetActiveStats, Title, Width, Height, X, Y
		y2 := Height // 2
	} else {
		CoordMode, Mouse, Screen
		y2 := A_ScreenHeight // 2
	}
	MouseMove, %posX%, %y2%, %speed%
}

mous_mousePosCenterUp(posY, speed, relativeWin=False){
	if(relativeWin) {
		CoordMode, Mouse, Relative
		WinGetActiveStats, Title, Width, Height, X, Y
		x2 := Width // 2
	} else {
		CoordMode, Mouse, Screen
		x2 := A_ScreenWidth // 2
	}
	MouseMove, %x2%, %posY%, %speed%
}

mous_mousePosCenterRight(xFromRight, speed, relativeWin=False){
	if(relativeWin) {
		CoordMode, Mouse, Relative
		WinGetActiveStats, Title, Width, Height, X, Y
		x2 := Width - xFromRight
		y2 := Height // 2
	} else {
		CoordMode, Mouse, Screen
		x2 := A_ScreenWidth - xFromRight
		y2 := A_ScreenHeight // 2
	}
	MouseMove, %x2%, %y2%, %speed%
}

mous_mousePosCenterDown(yFromDown, speed, relativeWin=False){
	if(relativeWin) {
		CoordMode, Mouse, Relative
		WinGetActiveStats, Title, Width, Height, X, Y
		x2 := Width // 2
		y2 := Height - yFromDown
	} else {
		CoordMode, Mouse, Screen
		x2 := A_ScreenWidth // 2
		y2 := A_ScreenHeight - yFromDown
	}
	MouseMove, %x2%, %y2%, %speed%
}




mous_mousePosWindowRightDown(xFromRight, yFromDown, speed, relativeWin=False){
	if(relativeWin){
		CoordMode, Mouse, Relative
		WinGetActiveStats, Title, Width, Height, X, Y
		x2 := Width - xFromRight
		y2 := Height - yFromDown
	} else {
		CoordMode, Mouse, Screen
		x2 := A_ScreenWidth - xFromRight
		y2 := A_ScreenHeight - yFromDown
	}
	MouseMove, %x2%, %y2%, %speed%
}

mous_mousePosWindowRight(xFromRight, posY, speed, relativeWin=False){
	if(relativeWin){
		CoordMode, Mouse, Relative
		WinGetActiveStats, Title, Width, Height, X, Y
		x2 := Width - xFromRight
	} else {
		CoordMode, Mouse, Screen
		x2 := A_ScreenWidth - xFromRight
	}
	MouseMove, %x2%, %posY%, %speed%
}

mous_mousePosWindowDown(posX, yFromDown, speed, relativeWin=False){
	if(relativeWin){
		CoordMode, Mouse, Relative
		WinGetActiveStats, Title, Width, Height, X, Y
		y2 := Height - yFromDown
	} else {
		CoordMode, Mouse, Screen
		y2 := A_ScreenHeight - yFromDown
	}
	MouseMove, %posX%, %y2%, %speed%
}

mous_mousePosCenter(relativeWin=False) {
	if(relativeWin) {
		CoordMode, Mouse, Relative
		WinGetActiveStats, Title, Width, Height, X, Y
		mX := Width // 2
		mY := Height // 2
	} else {
		CoordMode, Mouse, Screen
		mX := A_ScreenWidth // 2
		mY := A_ScreenHeight // 2
	}
	MouseMove, %mX%, %mY%, 10
}

mous_AssignMousDrag(){
	CoordMode, Mouse, Screen
	GuiControl,45:Focus , UpDown45_3
	GuiControl,45: , Radio45_1, 1
	MouseGetPos, mousX, mousY
	moveMousX := mousX + 400
	GuiControl,45: , UpDown45_1, %mousX%
	GuiControl,45: , UpDown45_2, %mousY%
	GuiControl,45: , UpDown45_3, %moveMousX%
	GuiControl,45: , UpDown45_4, %mousY%
	guf_showGuiAssign(45)
}

mous_AssignMousDragFromWindow(){
	CoordMode, Mouse, Relative
	WinGetActiveTitle, OutputVar
	StringLen, num, OutputVar
	if(num > 30) {				; タイトルが長い場合カットする (ミスすることが多いため)
		StringLeft, OutputVar, OutputVar, 30
	}
	OutputVar := RTrim(OutputVar)

	GuiControl,45:Focus , UpDown45_3
	GuiControl,45: , Radio45_2, 1
	MouseGetPos, mousX, mousY
	moveMousX := mousX + 400
	GuiControl,45: , UpDown45_1, %mousX%
	GuiControl,45: , UpDown45_2, %mousY%
	GuiControl,45: , UpDown45_3, %moveMousX%
	GuiControl,45: , UpDown45_4, %mousY%
	GuiControl,45: , Edit45_1, %OutputVar%
	guf_showGuiAssign(45)
}

mous_AssignMousMoveFromWindow(){
	WinGetActiveTitle, OutputVar
	StringLen, num, OutputVar
	if(num > 30) {				; タイトルが長い場合カットする (ミスすることが多いため)
		StringLeft, OutputVar, OutputVar, 30
	}
	OutputVar := RTrim(OutputVar)

	GuiControl,46:Focus , UpDown46_1
	GuiControl,46: , Radio46_1, 1
	GuiControl,46: , Radio46_4, 1
	GuiControl,46: , Edit46_1, %OutputVar%
	guf_showGuiAssign(46)

}

mous_SearchColorPosFromWindow(){
	Gui,45:Show, Hide
	Gui,46:Show, Hide
	WinGetActiveTitle, OutputVar
	WinWaitActive, A, , 1
	StringLen, num, OutputVar
	if(num > 30) {				; タイトルが長い場合カットする (ミスすることが多いため)
		StringLeft, OutputVar, OutputVar, 30
	}
	OutputVar := RTrim(OutputVar)
	guf_setControl( OutputVar, "Edit45_1", 45 )
	CoordMode, Mouse, Relative
	mous_setEditMousePos( "&colorSearch", "" )
	GuiControl,45: , Radio45_2, 1
}

mous_ImgSearchFromWindow(){
	Gui,45:Show, Hide
	Gui,46:Show, Hide
	WinWaitNotActive, ahk_class AutoHotkeyGUI, , 3
	WinGetActiveTitle, OutputVar
	StringLen, num, OutputVar
	if(num > 30) {				; タイトルが長い場合カットする (ミスすることが多いため)
		StringLeft, OutputVar, OutputVar, 30
	}
	OutputVar := RTrim(OutputVar)
	guf_setControl( OutputVar, "Edit45_1", 45 )
	CoordMode, Mouse, Relative
	mous_setEditMousePos( "imageSearch", "40" )
	GuiControl,45: , Radio45_2, 1
}

mous_mouseDragEntry(x1, y1, x2, y2, Screen, Title, setNum, listName) {
	Gui, 45:Show, NA
	MsgBox, 4097, 登録の確認, 今の状態を`nset%setNum% に上書きします。`nよろしいですか?, 60
	IfMsgBox, OK
	{
		setName := "set" . setNum
		listName := Trim(listName)
		Title := Trim(Title)
		if(Title == ""){
			Title = A
		}
		mouseDragIni := glomare_userDirCommon . gloma_mouseDragIniName
		func_folderCheckMakeFolder(glomare_userDirCommon . gloma_userMousePlugDirName)
		MsgBox, 4100, 2つめの確認, ウインドウのタイトルを指定して登録しません。`nよろしい?`nYes  指定しない`nNo タイトル指定, 60
		IfMsgBox, No
		{
			IniWrite, %Title%, %mouseDragIni%, %setName%, winTitle
		} else {
			IniWrite, A, %mouseDragIni%, %setName%, winTitle
		}
		IniWrite, %x1%, %mouseDragIni%, %setName%, formX
		IniWrite, %y1%, %mouseDragIni%, %setName%, formY
		IniWrite, %x2%, %mouseDragIni%, %setName%, toX
		IniWrite, %y2%, %mouseDragIni%, %setName%, toY
		IniWrite, %Screen%, %mouseDragIni%, %setName%, ScreenNum
		IniWrite, %listName%, %mouseDragIni%, %setName%, listTitle
		; リスト名を　__listTitle　のカテゴリーに保存
		IniWrite, %listName%, %mouseDragIni%, __listTitle, titleName%setNum%

		res := rmopluf_checkErrorLevelOutput("保存のエラー")
		if(res) {
			rmopluf_easyExplainMousePlug(setName . "に「今の位置から指定位置へ移動の処理」を登録")
		}

		;リストを更新
		rmopluf_reloadListTitleMousePlug(mouseDragIni, glomare_userDirCommon . gloma_userMousePlugDirName, "List40_1", 40, 20)
		;今のリストを選択状態に
		guf_GuiControl("List40_1", 40, "Choose", setNum)
		rmopluf_checkErrorLevelOutput("リスト の更新時にエラーあり")
	}
}

mous_mouseDragEntryFromCommand(listNumber, startX, startY, endX, endY, winTitle, screenFlag, listName){
	listNumber := rmopluf_getWithinNumOrBasicAndErrMsg(listNumber, "1", "0", 101, "listNumber")
	startX := rmopluf_getWithinNumOrBasicAndErrMsg(startX, 100, -3000, 3000, "startX")
	startY := rmopluf_getWithinNumOrBasicAndErrMsg(startY, 100, -3000, 3000, "startY")
	endX := rmopluf_getWithinNumOrBasicAndErrMsg(endX, 200, -3000, 3000, "endX")
	endY := rmopluf_getWithinNumOrBasicAndErrMsg(endY, 200, -3000, 3000, "endY")
	screenFlag := rmopluf_getFlagByOnOffStrOrBasicAndErrMsg(screenFlag, False, "screenFlag")

	setName := "set" . listNumber
	listName := Trim(listName)

	mouseDragIni := glomare_userDirCommon . gloma_mouseDragIniName
	func_folderCheckMakeFolder(glomare_userDirCommon . gloma_userMousePlugDirName)
	IniWrite, %winTitle%, %mouseDragIni%, %setName%, winTitle
	IniWrite, %startX%, %mouseDragIni%, %setName%, formX
	IniWrite, %startY%, %mouseDragIni%, %setName%, formY
	IniWrite, %endX%, %mouseDragIni%, %setName%, toX
	IniWrite, %endY%, %mouseDragIni%, %setName%, toY
	IniWrite, %screenFlag%, %mouseDragIni%, %setName%, ScreenNum
	IniWrite, %listName%, %mouseDragIni%, %setName%, listTitle
	; リスト名を　__listTitle　のカテゴリーに保存
	IniWrite, %listName%, %mouseDragIni%, __listTitle, titleName%listNumber%

	res := rmopluf_checkErrorLevelOutput("保存のエラー")
	if(res) {
		rmopluf_easyExplainMousePlug(setName . "にドラッグ位置を登録")
		;リストを更新
		rmopluf_reloadListTitleMousePlug(mouseDragIni, glomare_userDirCommon . gloma_userMousePlugDirName, "List40_1", 40, 20)
		rmopluf_checkErrorLevelOutput("リスト の更新時にエラーあり")
	}
}

mous_mouseDragLoad(setNum){
	MsgBox, 4097, 読み込みの確認, 今の状態を変更します。`nよろしいですか?, 60
	IfMsgBox, OK
	{
		setName := "set" . setNum
		mouseDragIni := glomare_userDirCommon . gloma_mouseDragIniName
		res := rmopluf_fileCheckIfNotExistErrorMsg(mouseDragIni, "保存してあるファイルが見つからない。`nマウスドラッグ保存ファイル")
		if( res == False ){
			return
		}
		mous_iniReadToGlobal(setName, mouseDragIni, True)
		guf_setControl( gloma_mouseFormX, "UpDown45_1", 45 )
		guf_setControl( gloma_mouseFormY, "UpDown45_2", 45 )
		guf_setControl( gloma_mouseToX, "UpDown45_3", 45 )
		guf_setControl( gloma_mouseToY, "UpDown45_4", 45 )

		guf_switchRadio2Pattern(gloma_mouseScreenNum ,"Radio45_1", "Radio45_2", 45)

		guf_setControl( gloma_mouseWinTitle, "Edit45_1", 45 )
		IniRead, varListTitle,%mouseDragIni%, %setName%, listTitle , %A_Space%
		guf_setControl( varListTitle, "Edit40_1_1", 40 )
		Gui, 45:Show, NA
	}
}

mous_mouseDragLoadFromCommand(listNumber){
	listNumber := rmopluf_getWithinNumOrBasicAndErrMsg(listNumber, "1", "0", 101, "listNumber")

	setName := "set" . listNumber
	mouseDragIni := glomare_userDirCommon . gloma_mouseDragIniName
	res := rmopluf_fileCheckIfNotExistErrorMsg(mouseDragIni, "保存してあるファイルが見つからない。`nマウスドラッグ保存ファイル")
	if( res == False ){
		return
	}
	mous_iniReadToGlobal(setName, mouseDragIni, True)
	guf_setControl( gloma_mouseFormX, "UpDown45_1", 45 )
	guf_setControl( gloma_mouseFormY, "UpDown45_2", 45 )
	guf_setControl( gloma_mouseToX, "UpDown45_3", 45 )
	guf_setControl( gloma_mouseToY, "UpDown45_4", 45 )

	guf_switchRadio2Pattern(gloma_mouseScreenNum ,"Radio45_1", "Radio45_2", 45)
	guf_setControl( gloma_mouseWinTitle, "Edit45_1", 45 )
	IniRead, varListTitle,%mouseDragIni%, %setName%, listTitle , %A_Space%
	guf_setControl( varListTitle, "Edit40_1_1", 40 )
	guf_GuiControl("List40_1", 40, "Choose", listNumber)
	Gui, 45:Show, NA
}

mous_iniReadToGlobal(setName, iniFile, fromFlag=False) {
	if(fromFlag) {
		IniRead, gloma_mouseFormX,   %iniFile%, %setName%, formX , 100
		IniRead, gloma_mouseFormY,   %iniFile%, %setName%, formY , 100
	}
	IniRead, gloma_mouseToX,     %iniFile%, %setName%, toX , 200
	IniRead, gloma_mouseToY,     %iniFile%, %setName%, toY , 200
	IniRead, gloma_mouseScreenNum, %iniFile%, %setName%, ScreenNum , 1
	IniRead, gloma_mouseDragFlag, %iniFile%, %setName%, dragFlag , 0
	IniRead, gloma_mouseWinTitle,%iniFile%, %setName%, winTitle , A
}

mous_mouseDragExecute(setNum, startX, startY, endX, endY, winTitle, screenStr){
	setName := "set" . setNum
	res := rmopluf_fileCheckIfNotExistErrorMsg(glomare_userDirCommon . gloma_mouseDragIniName, "保存してあるファイルが見つからない。`nマウスドラッグ保存ファイル")
	if( res == False ){
		return
	}
	mous_iniReadToGlobal(setName, glomare_userDirCommon . gloma_mouseDragIniName, True)
	if( startX == "" ){
		startX = %gloma_mouseFormX%
	}
	if( startY == "" ){
		startY = %gloma_mouseFormY%
	}
	if( endX == "" ){
		endX = %gloma_mouseToX%
	}
	if( endY == "" ){
		endY = %gloma_mouseToY%
	}
	if( winTitle == "" ){
		winTitle = %gloma_mouseWinTitle%
	}
	screenFlag = 1
	if( screenStr == "" ){
		screenFlag = %gloma_mouseScreenNum%
	} else {
		screenFlag := rmopluf_getFlagByOnOffStrOrBasicAndErrMsg(screenStr, True, "screenFlag")
	}
	startX := rmopluf_getWithinNumOrBasicAndErrMsg(startX, 100, -1000, 3000, "startX")
	startY := rmopluf_getWithinNumOrBasicAndErrMsg(startY, 100, -1000, 3000, "startY")
	endX := rmopluf_getWithinNumOrBasicAndErrMsg(endX, 200, -1000, 3000, "endX")
	endY := rmopluf_getWithinNumOrBasicAndErrMsg(endY, 200, -1000, 3000, "endY")
	mous_guiHideAndMoveAndDrag(startX, startY, endX, endY, screenFlag, winTitle)
}

mous_mouseMoveFromNowEntry(listNumber, posX, posY, dragFlag, winTitle, screenFlag, listName){
	Gui, 46:Show, NA
	MsgBox, 4097, 登録の確認, 今の状態を`nset%listNumber% に上書きします。`nよろしいですか?, 60
	IfMsgBox, OK
	{
		setName := "set" . listNumber
		listName := Trim(listName)
		winTitle := Trim(winTitle)

		iniFile := glomare_userDirCommon . gloma_mouseMoveFromNowIniName
		func_folderCheckMakeFolder(glomare_userDirCommon . gloma_userMousePlugDirName)
		MsgBox, 4100, 2つめの確認, ウインドウのタイトルを指定して登録しません。`nよろしい?`nYes  指定しない`nNo タイトル指定, 60
		IfMsgBox, No
		{
			IniWrite, %winTitle%, %iniFile%, %setName%, winTitle
		} else {
			IniWrite, A, %iniFile%, %setName%, winTitle
		}
		IniWrite, %posX%, %iniFile%, %setName%, toX
		IniWrite, %posY%, %iniFile%, %setName%, toY
		IniWrite, %dragFlag%, %iniFile%, %setName%, dragFlag
		IniWrite, %screenFlag%, %iniFile%, %setName%, ScreenNum
		IniWrite, %listName%, %iniFile%, %setName%, listTitle
		; リスト名を　__listTitle　のカテゴリーに保存
		IniWrite, %listName%, %iniFile%, __listTitle, titleName%listNumber%

		res := rmopluf_checkErrorLevelOutput("保存のエラー")
		if(res) {
			rmopluf_easyExplainMousePlug(setName . "に登録")
			;リストを更新
			rmopluf_reloadListTitleMousePlug(iniFile, glomare_userDirCommon . gloma_userMousePlugDirName, "List40_2", 40, 20)
			;今のリストを選択状態に
			guf_GuiControl("List40_2", 40, "Choose", listNumber)
			rmopluf_checkErrorLevelOutput("リスト の更新時にエラーあり")
		}
	}
}

mous_mouseMoveFromNowEntryFromCommand(listNumber, posX, posY, dragFlag, winTitle, screenFlag, listName){
	listNumber := rmopluf_getWithinNumOrBasicAndErrMsg(listNumber, "1", "0", 101, "listNumber")
	posX := rmopluf_getWithinNumOrBasicAndErrMsg(posX, 100, -3000, 3000, "posX")
	posY := rmopluf_getWithinNumOrBasicAndErrMsg(posY, 100, -3000, 3000, "posY")
	dragFlag := rmopluf_getFlagByOnOffStrOrBasicAndErrMsg(dragFlag, False, "dragFlag")
	screenFlag := rmopluf_getFlagByOnOffStrOrBasicAndErrMsg(screenFlag, False, "screenFlag")

	setName := "set" . listNumber
	listName := Trim(listName)

	iniFile := glomare_userDirCommon . gloma_mouseMoveFromNowIniName
	func_folderCheckMakeFolder(glomare_userDirCommon . gloma_userMousePlugDirName)
	IniWrite, %winTitle%, %iniFile%, %setName%, winTitle
	IniWrite, %posX%, %iniFile%, %setName%, toX
	IniWrite, %posY%, %iniFile%, %setName%, toY
	IniWrite, %dragFlag%, %iniFile%, %setName%, dragFlag
	IniWrite, %screenFlag%, %iniFile%, %setName%, ScreenNum
	IniWrite, %listName%, %iniFile%, %setName%, listTitle
	; リスト名を　__listTitle　のカテゴリーに保存
	IniWrite, %listName%, %iniFile%, __listTitle, titleName%listNumber%

	res := rmopluf_checkErrorLevelOutput("保存のエラー")
	if(res) {
		rmopluf_easyExplainMousePlug(setName . "に登録")
		;リストを更新
		rmopluf_reloadListTitleMousePlug(iniFile, glomare_userDirCommon . gloma_userMousePlugDirName, "List40_2", 40, 20)
		rmopluf_checkErrorLevelOutput("リスト の更新時にエラーあり")
	}
}

mous_mouseMoveFromNowLoad(listNumber){
	MsgBox, 4097, 読み込みの確認, 今の状態を変更します。`nよろしいですか?, 60
	IfMsgBox, OK
	{
		setName := "set" . listNumber
		iniFile := glomare_userDirCommon . gloma_mouseMoveFromNowIniName
		res := rmopluf_fileCheckIfNotExistErrorMsg(iniFile, "保存してあるファイルが見つからない`nマウスの移動を登録するファイル")
		if( res == False ){
			return
		}
		mous_iniReadToGlobal(setName, iniFile, False)
		guf_setControl( gloma_mouseToX, "UpDown46_1", 46 )
		guf_setControl( gloma_mouseToY, "UpDown46_2", 46 )
		guf_switchRadio2Pattern(gloma_mouseDragFlag ,"Radio46_2", "Radio46_1", 46)
		guf_switchRadio2Pattern(gloma_mouseScreenNum ,"Radio46_3", "Radio46_4", 46)

		guf_setControl( gloma_mouseWinTitle, "Edit46_1", 46 )
		IniRead, varListTitle,%iniFile%, %setName%, listTitle , %A_Space%
		guf_setControl( varListTitle, "Edit40_2_1", 40 )
		Gui, 46:Show, NA
	}
}

mous_mouseMoveFromNowLoadFromCommand(listNumber){
	listNumber := rmopluf_getWithinNumOrBasicAndErrMsg(listNumber, "1", "0", 101, "listNumber")

	setName := "set" . listNumber
	iniFile := glomare_userDirCommon . gloma_mouseMoveFromNowIniName
	res := rmopluf_fileCheckIfNotExistErrorMsg(iniFile, "保存してあるファイルが見つからない`nマウスの移動を登録するファイル")
	if( res == False ){
		return
	}
	mous_iniReadToGlobal(setName, iniFile, False)
	guf_setControl( gloma_mouseToX, "UpDown46_1", 46 )
	guf_setControl( gloma_mouseToY, "UpDown46_2", 46 )
	guf_switchRadio2Pattern(gloma_mouseDragFlag ,"Radio46_2", "Radio46_1", 46)
	guf_switchRadio2Pattern(gloma_mouseScreenNum ,"Radio46_3", "Radio46_4", 46)

	guf_setControl( gloma_mouseWinTitle, "Edit46_1", 46 )
	IniRead, varListTitle,%iniFile%, %setName%, listTitle , %A_Space%
	guf_setControl( varListTitle, "Edit40_2_1", 40 )
	guf_GuiControl("List40_2", 40, "Choose", listNumber)
	Gui, 46:Show, NA
}

mous_mouseMoveFromNowExecute(listNumber, posX, posY, dragStr, winTitle, screenStr){
	listNumber := rmopluf_getWithinNumOrBasicAndErrMsg(listNumber, "1", "0", 101, "listNumber")
	setName := "set" . listNumber
	res := rmopluf_fileCheckIfNotExistErrorMsg(glomare_userDirCommon . gloma_mouseMoveFromNowIniName, "保存してあるファイルが見つからない。`nマウスを相対位置から移動ファイル")
	if( res == False ){
		return
	}
	mous_iniReadToGlobal(setName, glomare_userDirCommon . gloma_mouseMoveFromNowIniName, False)
	if( posX == "" ){
		posX = %gloma_mouseToX%
	}
	if( posY == "" ){
		posY = %gloma_mouseToY%
	}
	if( winTitle == "" ){
		winTitle = %gloma_mouseWinTitle%
	}
	dragFlag := False
	if( dragStr == "" ){
		dragFlag = %gloma_mouseDragFlag%
	} else {
		dragFlag := rmopluf_getFlagByOnOffStrOrBasicAndErrMsg(dragStr, False, "dragFlag")
	}
	screenFlag := False
	if( screenStr == "" ){
		screenFlag = %gloma_mouseScreenNum%
	} else {
		screenFlag := rmopluf_getFlagByOnOffStrOrBasicAndErrMsg(screenStr, False, "screenFlag")
	}

	posX := rmopluf_getWithinNumOrBasicAndErrMsg(posX, 100, -3000, 3000, "posX")
	posY := rmopluf_getWithinNumOrBasicAndErrMsg(posY, 100, -3000, 3000, "posY")
	mous_guiHideAndMoveOrDrag(posX, posY, winTitle, dragFlag, screenFlag)
}

mous_mouseRelativEntry(x2, y2, dragFlag, Title, setNum, listName) {
	Gui, 47:Show, NA
	MsgBox, 4097, 登録の確認, 今の状態を`nset%setNum% に上書きします。`nよろしいですか?, 60
	IfMsgBox, OK
	{
		setName := "set" . setNum
		listName := Trim(listName)
		Title := Trim(Title)
		if(Title == ""){
			Title = A
		}
		mouseRelativIni := glomare_userDirCommon . gloma_mouseRelativIniName
		func_folderCheckMakeFolder(glomare_userDirCommon . gloma_userMousePlugDirName)
		MsgBox, 4100, 2つめの確認, ウインドウのタイトルを指定して登録しません。`nよろしい?`nYes  指定しない`nNo タイトル指定, 60

		IfMsgBox, No
		{
			IniWrite, %Title%, %mouseRelativIni%, %setName%, winTitle
		} else {
			IniWrite, A, %mouseRelativIni%, %setName%, winTitle
		}
		IniWrite, %x2%, %mouseRelativIni%, %setName%, toX
		IniWrite, %y2%, %mouseRelativIni%, %setName%, toY
		IniWrite, %dragFlag%, %mouseRelativIni%, %setName%, dragFlag
		IniWrite, %listName%, %mouseRelativIni%, %setName%, listTitle
		; リスト名を　__listTitle　のカテゴリーに保存
		IniWrite, %listName%, %mouseRelativIni%, __listTitle, titleName%setNum%

		res := rmopluf_checkErrorLevelOutput("保存のエラー")
		if(res) {
			rmopluf_easyExplainMousePlug(setName . "に登録")
		}

		;リストを更新
		rmopluf_reloadListTitleMousePlug(mouseRelativIni, glomare_userDirCommon . gloma_userMousePlugDirName, "List40_3", 40, 20)
		;今のリストを選択状態に
		guf_GuiControl("List40_3", 40, "Choose", setNum)
		rmopluf_checkErrorLevelOutput("リスト の更新時にエラーあり")
	}
}

mous_mouseRelativEntryFromCommand(listNumber, plusX, plusY, dragFlag, winTitle, listName){
	listNumber := rmopluf_getWithinNumOrBasicAndErrMsg(listNumber, "1", "0", 101, "listNumber")
	plusX := rmopluf_getWithinNumOrBasicAndErrMsg(plusX, 100, -3000, 3000, "plusX")
	plusY := rmopluf_getWithinNumOrBasicAndErrMsg(plusY, 100, -3000, 3000, "plusY")

	setName := "set" . listNumber
	listName := Trim(listName)

	mouseRelativIni := glomare_userDirCommon . gloma_mouseRelativIniName
	func_folderCheckMakeFolder(glomare_userDirCommon . gloma_userMousePlugDirName)

	IniWrite, %winTitle%, %mouseRelativIni%, %setName%, winTitle
	IniWrite, %plusX%, %mouseRelativIni%, %setName%, toX
	IniWrite, %plusY%, %mouseRelativIni%, %setName%, toY
	IniWrite, %dragFlag%, %mouseRelativIni%, %setName%, dragFlag
	IniWrite, %listName%, %mouseRelativIni%, %setName%, listTitle
	; リスト名を　__listTitle　のカテゴリーに保存
	IniWrite, %listName%, %mouseRelativIni%, __listTitle, titleName%listNumber%

	res := rmopluf_checkErrorLevelOutput("保存のエラー")
	if(res) {
		rmopluf_easyExplainMousePlug(setName . "に「今の位置からプラスした位置にマウスを移動する処理」を登録")
		;リストを更新
		rmopluf_reloadListTitleMousePlug(mouseRelativIni, glomare_userDirCommon . gloma_userMousePlugDirName, "List40_3", 40, 20)
		rmopluf_checkErrorLevelOutput("リスト の更新時にエラーあり")
	}
}

mous_mouseRelativLoad(setNum){
	MsgBox, 4097, 読み込みの確認, 今の状態を変更します。`nよろしいですか?, 60
	IfMsgBox, OK
	{
		setName := "set" . setNum
		mouseRelativIni := glomare_userDirCommon . gloma_mouseRelativIniName
		res := rmopluf_fileCheckIfNotExistErrorMsg(mouseRelativIni, "保存してあるファイルが見つからない。`nマウスを相対位置から移動ファイル")
		if( res == False ){
			return
		}
		mous_iniReadToGlobal(setName, mouseRelativIni, False)
		guf_setControl( gloma_mouseToX, "UpDown47_1", 47 )
		guf_setControl( gloma_mouseToY, "UpDown47_2", 47 )

		guf_switchRadio2Pattern(gloma_mouseDragFlag ,"Radio47_2", "Radio47_1", 47)

		guf_setControl( gloma_mouseWinTitle, "Edit47_1", 47 )
		IniRead, varListTitle,%mouseRelativIni%, %setName%, listTitle , %A_Space%
		guf_setControl( varListTitle, "Edit40_3_1", 40 )
		Gui, 47:Show, NA
	}
}

mous_mouseRelativLoadFromCommand(listNumber){
	listNumber := rmopluf_getWithinNumOrBasicAndErrMsg(listNumber, "1", "0", 101, "listNumber")
	setName := "set" . listNumber
	mouseRelativIni := glomare_userDirCommon . gloma_mouseRelativIniName
	res := rmopluf_fileCheckIfNotExistErrorMsg(mouseRelativIni, "保存してあるファイルが見つからない。`nマウスを相対位置から移動ファイル")
	if( res == False ){
		return
	}
	mous_iniReadToGlobal(setName, mouseRelativIni, False)
	guf_setControl( gloma_mouseToX, "UpDown47_1", 47 )
	guf_setControl( gloma_mouseToY, "UpDown47_2", 47 )

	guf_switchRadio2Pattern(gloma_mouseDragFlag ,"Radio47_2", "Radio47_1", 47)

	guf_setControl( gloma_mouseWinTitle, "Edit47_1", 47 )
	IniRead, varListTitle,%mouseRelativIni%, %setName%, listTitle , %A_Space%
	guf_setControl( varListTitle, "Edit40_3_1", 40 )
	guf_GuiControl("List40_3", 40, "Choose", listNumber)
	Gui, 47:Show, NA
}

mous_mouseRelativExecute(setNum, plusX, plusY, dragStr, winTitle){
	setName := "set" . setNum
	res := rmopluf_fileCheckIfNotExistErrorMsg(glomare_userDirCommon . gloma_mouseRelativIniName, "保存してあるファイルが見つからない。`nマウスを相対位置から移動ファイル")
	if( res == False ){
		return
	}
	mous_iniReadToGlobal(setName, glomare_userDirCommon . gloma_mouseRelativIniName, False)
	if( plusX == "" ){
		plusX = %gloma_mouseToX%
	}
	if( plusY == "" ){
		plusY = %gloma_mouseToY%
	}
	if( winTitle == "" ){
		winTitle = %gloma_mouseWinTitle%
	}
	dragFlag := False
	if( dragStr == "" ){
		dragFlag = %gloma_mouseDragFlag%
	} else {
		dragFlag := rmopluf_getFlagByOnOffStrOrBasicAndErrMsg(dragStr, False, "dragFlag")
	}
	plusX := rmopluf_getWithinNumOrBasicAndErrMsg(plusX, 100, -3000, 3000, "plusX")
	plusY := rmopluf_getWithinNumOrBasicAndErrMsg(plusY, 100, -3000, 3000, "plusY")
	mous_guiHideAndMoveOrDragRelativ(plusX, plusY, dragFlag, winTitle)
}

mous_mouseClickPointEntry(x2, y2, Screen, Title, setNum, listName) {
	Gui, 48:Show, NA
	MsgBox, 4097, 登録の確認, 今の状態を`nset%setNum% に上書きします。`nよろしいですか?, 60
	IfMsgBox, OK
	{
		setName := "set" . setNum
		listName := Trim(listName)
		Title := Trim(Title)
		if(Title == ""){
			Title = A
		}
		mouseClickPointIni := glomare_userDirCommon . gloma_mouseClickPointIniName
		func_folderCheckMakeFolder(glomare_userDirCommon . gloma_userMousePlugDirName)
		MsgBox, 4100, 2つめの確認, ウインドウのタイトルを指定して登録しません。`nよろしい?`nYes  指定しない`nNo タイトル指定, 60

		IfMsgBox, No
		{
			IniWrite, %Title%, %mouseClickPointIni%, %setName%, winTitle
		} else {
			IniWrite, A, %mouseClickPointIni%, %setName%, winTitle
		}
		IniWrite, %x2%, %mouseClickPointIni%, %setName%, toX
		IniWrite, %y2%, %mouseClickPointIni%, %setName%, toY
		IniWrite, %Screen%, %mouseClickPointIni%, %setName%, ScreenNum
		IniWrite, %listName%, %mouseClickPointIni%, %setName%, listTitle

		check1 := guf_getControl( "Checkbox48_1", 48 )
		check2 := guf_getControl( "Checkbox48_2", 48 )
		check3 := guf_getControl( "Checkbox48_3", 48 )

		IniWrite, %check1%, %mouseClickPointIni%, %setName%, doubleClick
		IniWrite, %check2%, %mouseClickPointIni%, %setName%, shiftClick
		IniWrite, %check3%, %mouseClickPointIni%, %setName%, ctrlClick

		; リスト名を　__listTitle　のカテゴリーに保存
		IniWrite, %listName%, %mouseClickPointIni%, __listTitle, titleName%setNum%

		res := rmopluf_checkErrorLevelOutput("保存のエラー")
		if(res) {
			rmopluf_easyExplainMousePlug(setName . "に登録")
		}

		;リストを更新
		rmopluf_reloadListTitleMousePlug(mouseClickPointIni, glomare_userDirCommon . gloma_userMousePlugDirName, "List40_4", 40, 20)
		;今のリストを選択状態に
		guf_GuiControl("List40_4", 40, "Choose", setNum)
		rmopluf_checkErrorLevelOutput("リスト の更新時にエラーあり")
	}
}

mous_mouseClickPointEntryFromCommand(listNumber, posX, posY, dbClickFlag, shiftFlag, ctrlFlag, winTitle, screenFlag, listName){
	listNumber := rmopluf_getWithinNumOrBasicAndErrMsg(listNumber, "1", "0", 101, "listNumber")
	posX := rmopluf_getWithinNumOrBasicAndErrMsg(posX, 100, -3000, 3000, "posX")
	posY := rmopluf_getWithinNumOrBasicAndErrMsg(posY, 100, -3000, 3000, "posY")
	dbClickFlag := rmopluf_getFlagByOnOffStrOrBasicAndErrMsg(dbClickFlag, False, "dbClickFlag")
	shiftFlag := rmopluf_getFlagByOnOffStrOrBasicAndErrMsg(shiftFlag, False, "shiftFlag")
	ctrlFlag := rmopluf_getFlagByOnOffStrOrBasicAndErrMsg(ctrlFlag, False, "ctrlFlag")
	screenFlag := rmopluf_getFlagByOnOffStrOrBasicAndErrMsg(screenFlag, False, "screenFlag")

	setName := "set" . listNumber
	listName := Trim(listName)

	mouseClickPointIni := glomare_userDirCommon . gloma_mouseClickPointIniName
	func_folderCheckMakeFolder(glomare_userDirCommon . gloma_userMousePlugDirName)

	IniWrite, %winTitle%, %mouseClickPointIni%, %setName%, winTitle
	IniWrite, %posX%, %mouseClickPointIni%, %setName%, toX
	IniWrite, %posY%, %mouseClickPointIni%, %setName%, toY
	IniWrite, %screenFlag%, %mouseClickPointIni%, %setName%, ScreenNum
	IniWrite, %listName%, %mouseClickPointIni%, %setName%, listTitle

	IniWrite, %dbClickFlag%, %mouseClickPointIni%, %setName%, doubleClick
	IniWrite, %shiftFlag%, %mouseClickPointIni%, %setName%, shiftClick
	IniWrite, %ctrlFlag%, %mouseClickPointIni%, %setName%, ctrlClick
	; リスト名を　__listTitle　のカテゴリーに保存
	IniWrite, %listName%, %mouseClickPointIni%, __listTitle, titleName%listNumber%

	res := rmopluf_checkErrorLevelOutput("保存のエラー")
	if(res) {
		rmopluf_easyExplainMousePlug(setName . "に登録")
		;リストを更新
		rmopluf_reloadListTitleMousePlug(mouseClickPointIni, glomare_userDirCommon . gloma_userMousePlugDirName, "List40_4", 40, 20)
		rmopluf_checkErrorLevelOutput("リスト の更新時にエラーあり")
	}
}

mous_iniReadClickPointToGlobal(setName, mouseClickPointIni){
	IniRead, gloma_clickPointX,     %mouseClickPointIni%, %setName%, toX , 200
	IniRead, gloma_clickPointY,     %mouseClickPointIni%, %setName%, toY , 200
	IniRead, gloma_clickPointScreenFlag, %mouseClickPointIni%, %setName%, ScreenNum , 1
	IniRead, gloma_clickPointWinTitle,%mouseClickPointIni%, %setName%, winTitle , A
	
	IniRead, gloma_clickPointDobleFlag,  %mouseClickPointIni%, %setName%, doubleClick , 0
	IniRead, gloma_clickPointShiftFlag,  %mouseClickPointIni%, %setName%, shiftClick , 0
	IniRead, gloma_clickPointCtrlFlag,  %mouseClickPointIni%, %setName%, ctrlClick , 0
}

mous_mouseClickPointLoad(setNum){
	MsgBox, 4097, 読み込みの確認, 今の状態を変更します。`nよろしいですか?, 60
	IfMsgBox, OK
	{
		mous_iniReadClickPointChange(setNum)
		rmopluf_toolTipClickPoint()
		Gui, 48:Show, NA
	}
}

mous_mouseClickPointLoadFromCommand(listNumber){
	listNumber := rmopluf_getWithinNumOrBasicAndErrMsg(listNumber, "1", "0", 101, "listNumber")
	mous_iniReadClickPointChange(listNumber)
	guf_GuiControl("List40_4", 40, "Choose", listNumber)
	rmopluf_toolTipClickPoint()
	Gui, 48:Show, NA
}

mous_clickPointLoadFromCurrentClickPoint(){
	guf_setControl( gloma_clickPointX, "UpDown48_1", 48 )
	guf_setControl( gloma_clickPointY, "UpDown48_2", 48 )
	guf_switchRadio2Pattern(gloma_clickPointScreenFlag, "Radio48_1", "Radio48_2", 48)
	guf_setControl( gloma_clickPointWinTitle, "Edit48_1", 48 )

	guf_setControl( gloma_clickPointDobleFlag, "Checkbox48_1", 48 )
	guf_setControl( gloma_clickPointShiftFlag, "Checkbox48_2", 48 )
	guf_setControl( gloma_clickPointCtrlFlag, "Checkbox48_3", 48 )
	rmopluf_toolTipClickPoint()
	Gui, 48:Show, NA
}

mous_iniReadClickPointChange(setNum){
	setName := "set" . setNum
	mouseClickPointIni := glomare_userDirCommon . gloma_mouseClickPointIniName
	;起動時に読み込むので、ファイルがなくてもエラー表示をしない
	;res := rmopluf_fileCheckIfNotExistErrorMsg(mouseClickPointIni, "保存してあるファイルが見つからない。`nクリック位置指定ファイル")
	;if( res == False ){
	;	return
	;}

	mous_iniReadClickPointToGlobal(setName, mouseClickPointIni)

	guf_setControl( gloma_clickPointX, "UpDown48_1", 48 )
	guf_setControl( gloma_clickPointY, "UpDown48_2", 48 )
	guf_switchRadio2Pattern(gloma_clickPointScreenFlag, "Radio48_1", "Radio48_2", 48)
	guf_setControl( gloma_clickPointWinTitle, "Edit48_1", 48 )

	guf_setControl( gloma_clickPointDobleFlag, "Checkbox48_1", 48 )
	guf_setControl( gloma_clickPointShiftFlag, "Checkbox48_2", 48 )
	guf_setControl( gloma_clickPointCtrlFlag, "Checkbox48_3", 48 )

	IniRead, varListTitle,%mouseClickPointIni%, %setName%, listTitle , %A_Space%
	guf_setControl( varListTitle, "Edit40_4_1", 40 )
}

mous_mouseClickOnlyExecute(listNumber, posX, posY, dbClickStr, shiftStr, ctrlStr, winTitle, screenStr){
	listNumber := rmopluf_getWithinNumOrBasicAndErrMsg(listNumber, "1", "0", 101, "listNumber")
	setName := "set" . listNumber
	res := rmopluf_fileCheckIfNotExistErrorMsg(glomare_userDirCommon . gloma_mouseClickPointIniName, "保存してあるファイルが見つからない。`nクリック位置指定ファイル")
	if( res == False ){
		return
	}
	mous_iniReadClickPointToGlobal(setName, glomare_userDirCommon . gloma_mouseClickPointIniName)

	if( posX == "" ){
		posX = %gloma_clickPointX%
	}
	if( posY == "" ){
		posY = %gloma_clickPointY%
	}
	if( winTitle == "" ){
		winTitle = %gloma_clickPointWinTitle%
	}
	screenFlag = 1
	if( screenStr == "" ){
		screenFlag = %gloma_clickPointScreenFlag%
	} else {
		screenFlag := rmopluf_getFlagByOnOffStrOrBasicAndErrMsg(screenStr, False, "screenFlag")
	}

	dbClickFlag = 1
	if( dbClickStr == "" ){
		dbClickFlag = %gloma_clickPointDobleFlag%
	} else {
		dbClickFlag := rmopluf_getFlagByOnOffStrOrBasicAndErrMsg(dbClickStr, False, "dbClickFlag")
	}

	shiftFlag = 1
	if( shiftStr == "" ){
		shiftFlag = %gloma_clickPointShiftFlag%
	} else {
		shiftFlag := rmopluf_getFlagByOnOffStrOrBasicAndErrMsg(shiftStr, False, "shiftFlag")
	}

	ctrlFlag = 1
	if( ctrlStr == "" ){
		ctrlFlag = %gloma_clickPointCtrlFlag%
	} else {
		ctrlFlag := rmopluf_getFlagByOnOffStrOrBasicAndErrMsg(ctrlStr, False, "ctrlFlag")
	}
	posX := rmopluf_getWithinNumOrBasicAndErrMsg(posX, 100, -3000, 3000, "posX")
	posY := rmopluf_getWithinNumOrBasicAndErrMsg(posY, 100, -3000, 3000, "posY")

	mous_guiHideAndClickOnly(posX, posY, screenFlag, dbClickFlag, shiftFlag, ctrlFlag, winTitle)
}

mous_clickPointChange(setNum){
	guf_GuiControl("List40_4", 40, "Choose", setNum)
	mous_iniReadClickPointChange(setNum)
}

mous_clickPointChangeAndOutput(setNum){
	mous_clickPointChange(setNum)
	rmopluf_toolTipClickPoint()
	rmopluf_easyExplainMousePlug("clickPointを " . setNum  . " に変更した")
}

mous_mousePosInClickPointGui(){
	OutputVarX = 0
	OutputVarY = 0
	winTitle = %A_Space%
	MsgBox, 4100, マウス位置の読み出し, ウインドウを基準ではなく、`nスクリーンを基準に読み出すでいいか？`nはい  スクリーンを基準`nいいえ  最前面のウインドウを基準, 60
	IfMsgBox, Yes
	{
		CoordMode, Mouse, Screen
		guf_setControl( 1, "Radio48_1", 48 )
		MouseGetPos, OutputVarX, OutputVarY
	}
	IfMsgBox, No
	{
		CoordMode, Mouse, Relative
		guf_setControl( 1, "Radio48_2", 48 )
		gumoplugf_hideGui40()
		WinWaitActive , A, ,2
		MouseGetPos, OutputVarX, OutputVarY
		WinGetActiveTitle, winTitle
		Gui, 40:Show
	}
	guf_setControl( OutputVarX, "UpDown48_1", 48 )
	guf_setControl( OutputVarY, "UpDown48_2", 48 )
	guf_setControl( winTitle, "Edit48_1", 48 )
	Gui, 48:Show, NA
}

mous_mousePosInClickPointGuiFromCommand(screenFlag){
	OutputVarX = 0
	OutputVarY = 0
	winTitle = %A_Space%
	if( screenFlag ){
		CoordMode, Mouse, Screen
		guf_setControl( 1, "Radio48_1", 48 )
		MouseGetPos, OutputVarX, OutputVarY
	} else {
		CoordMode, Mouse, Relative
		guf_setControl( 1, "Radio48_2", 48 )
		WinWaitActive , A, ,2
		MouseGetPos, OutputVarX, OutputVarY
		WinGetActiveTitle, winTitle
	}
	guf_setControl( OutputVarX, "UpDown48_1", 48 )
	guf_setControl( OutputVarY, "UpDown48_2", 48 )
	guf_setControl( winTitle, "Edit48_1", 48 )
	Gui, 48:Show, NA
}

mous_mousePosInClickPointEntryFromCommand(listNumber, dbClickFlag, shiftFlag, ctrlFlag, screenFlag, listName){
	posX = 0
	posY = 0
	winTitle = %A_Space%
	if( screenFlag ){
		CoordMode, Mouse, Screen
		MouseGetPos, posX, posY
	} else {
		CoordMode, Mouse, Relative
		WinWaitActive , A, ,2
		WinGetActiveTitle, winTitle
		MouseGetPos, posX, posY
	}
	mous_mouseClickPointEntryFromCommand(listNumber, posX, posY, dbClickFlag, shiftFlag, ctrlFlag, winTitle, screenFlag, listName)
}

mous_mousePosClickPoint(){
	if(gloma_clickPointScreenFlag){
		CoordMode, Mouse, Screen
	} else {
		CoordMode, Mouse, Relative
		WinWaitActive , A, ,2
	}
	MouseGetPos, OutputVarX, OutputVarY
	mous_clickPointMove(OutputVarX, OutputVarY)
	rmopluf_toolTipClickPoint()
	guf_setControl( OutputVarX, "UpDown48_1", 48 )
	guf_setControl( OutputVarY, "UpDown48_2", 48 )
}

mous_cursorPosSetClickPoint(){
	if(gloma_clickPointScreenFlag){
		CoordMode,Caret,Screen
	}
	posX := A_CaretX
	posY := A_CaretY
	mous_clickPointMove(posX, posY)
	rmopluf_toolTipClickPoint()
	guf_setControl( posX, "UpDown48_1", 48 )
	guf_setControl( posY, "UpDown48_2", 48 )
}

mous_mouseMoveFromClickPointPos(){
	if(gloma_clickPointScreenFlag){
		CoordMode, Mouse, Screen
	} else {
		CoordMode, Mouse, Relative
		WinWaitActive , A, ,2
	}
	MouseMove, %gloma_clickPointX%, %gloma_clickPointY%, 10
	rmopluf_toolTipClickPoint()
}

mous_mocroClickEntry(type=1) {
	DetectHiddenWindows, On
	if(type == 1) {
		WinSet, Transparent, 20, __Mouse_Macro_
		WinGetActiveTitle, Title
		Title := func_cutStringMoreLength(Title, 30)	; タイトルが長い場合カットする (ミスすることが多いため)
		guf_setControl( 1, "Edit49_1", 49 )
		guf_setControl( Title, "Edit49_2", 49 )
		Gui, 49:Show, x0 y0 w%A_ScreenWidth% h%A_ScreenHeight%, __Mouse_Macro_
	} else if(type == 2){
		WinSet, Transparent, 100, __Mouse_Macro_
		WinGetActiveStats, Title, Width, Height, winX, winY
		Title := func_cutStringMoreLength(Title, 30)	; タイトルが長い場合カットする (ミスすることが多いため)
		guf_setControl( 3, "Edit49_1", 49 )
		guf_setControl( Title, "Edit49_2", 49 )
		Gui, 49:Show, x%winX% y%winY% w%Width% h%Height%, __Mouse_Macro_
	} else if(type == 3) {
		WinSet, Transparent, 20, __Mouse_Macro_
		WinGetActiveTitle, Title
		Title := func_cutStringMoreLength(Title, 30)	; タイトルが長い場合カットする (ミスすることが多いため)
		guf_setControl( 5, "Edit49_1", 49 )
		guf_setControl( Title, "Edit49_2", 49 )
		Gui, 49:Show, x0 y0 w%A_ScreenWidth% h%A_ScreenHeight%, __Mouse_Macro_
	}
	CoordMode, Mouse, Screen
	CoordMode, ToolTip, Screen
	MouseGetPos, OutputVarX, OutputVarY
	x := OutputVarX + 20
	ToolTip, ドラッグ開始位置を右クリック, %x%, %OutputVarY%, 2
}

mous_mocroClickSelect(num){
	if( num == 1 ){
		mous_mocroClickFirst(1)
	} else if(num == 2) {
		mous_mocroClickSecond(False)
	} else if(num == 3) {
		mous_mocroClickFirst(2)
	} else if(num == 4) {
		mous_mocroClickSecond(True)
	} else if(num == 5) {
		mous_mocroClickFirst(3)
	} else if(num == 6) {
		mous_mocroClickSecondRelative()
	}
}

mous_mocroClickFirst(type=1) {
	if(type == 1) {
		guf_setControl( 2, "Edit49_1", 49 )
		Edit49_2 := guf_getControl( "Edit49_2", 49 )
		guf_setControl( Edit49_2, "Edit46_1", 46 )
		guf_setControl( 1, "Radio46_3", 46 )
	} else if(type == 2) {
		guf_setControl( 4, "Edit49_1", 49 )
		Edit49_2 := guf_getControl( "Edit49_2", 49 )
		guf_setControl( Edit49_2, "Edit46_1", 46 )
		guf_setControl( 1, "Radio46_4", 46 )
	} else if(type == 3) {
		guf_setControl( 6, "Edit49_1", 49 )
		Edit49_2 := guf_getControl( "Edit49_2", 49 )
		guf_setControl( Edit49_2, "Edit46_1", 46 )
		guf_setControl( 1, "Radio46_2", 46 )
		guf_setControl( 1, "Radio46_3", 46 )
	}
	CoordMode, Mouse, Screen
	CoordMode, ToolTip, Screen
	MouseGetPos, OutputVarX2, OutputVarY
	guf_setControl( A_GuiX, "UpDown46_1", 46 )
	guf_setControl( A_GuiY, "UpDown46_2", 46 )
	guf_showGuiParams(46, "NA")
	x := OutputVarX2 + 20
	ToolTip, ドラッグ終了位置を右クリック, %x%, %OutputVarY%, 2
}

mous_mocroClickSecond(winFlag=False) {
	if(winFlag) {
		guf_setControl( 1, "Radio45_2", 45 )
	} else {
		guf_setControl( 1, "Radio45_1", 45 )
	}
	Edit46_1 := guf_getControl( "Edit46_1", 46 )
	guf_setControl( Edit46_1, "Edit45_1", 45 )

	UpDown46_1 := guf_getControl( "UpDown46_1", 46 )
	UpDown46_2 := guf_getControl( "UpDown46_2", 46 )
	guf_setControl( UpDown46_1, "UpDown45_1", 45 )
	guf_setControl( UpDown46_2, "UpDown45_2", 45 )
	guf_setControl( A_GuiX, "UpDown45_3", 45 )
	guf_setControl( A_GuiY, "UpDown45_4", 45 )
	Gui, 46:Hide
	gumoplugf_hideGui49()
	guf_showGuiAssign(45)
	GuiControl, 40:Choose, Tab40_1 , 1
	guf_showGuiAssign(40)
}


mous_mocroClickSecondRelative() {
	Edit46_1 := guf_getControl( "Edit46_1", 46 )
	guf_setControl( Edit46_1, "Edit47_1", 47 )
	UpDown46_1 := guf_getControl( "UpDown46_1", 46 )
	UpDown46_2 := guf_getControl( "UpDown46_2", 46 )
	moveX := A_GuiX - UpDown46_1
	moveY := A_GuiY - UpDown46_2

	guf_setControl( moveX, "UpDown47_1", 47 )
	guf_setControl( moveY, "UpDown47_2", 47 )
	guf_setControl( 1, "Radio47_2", 47 )		; ドラッグに設定

	Gui, 46:Hide
	gumoplugf_hideGui49()
	guf_showGuiAssign(47)
	GuiControl, 40:Choose, Tab40_1 , 2
	guf_showGuiAssign(40)
}

mous_getClassNN(){
	MouseClick, LEFT
	windc_anyWaitActive()
	WinGetActiveTitle, Title
	MouseGetPos, OutputVarX, OutputVarY, OutputVarWin, OutputVarControl
	rmopluf_outputAny(OutputVarControl, Title, "", "", "", "")
}

mous_getWindowHandle(){
	windc_anyWaitActive()
	MouseGetPos, OutputVarX, OutputVarY, OutputVarWin, OutputVarControl, 2
	rmopluf_outputAny("ahk_id ", OutputVarControl, "", "", "", "")
}

mous_mouseMoveOrDrag(upDown1, upDown2, winTitle, dragFlag, screenFlag){
	winTitle := Trim(winTitle)
	if(winTitle == "") {
		mous_dragBefore(screenFlag, "A")
		;if ( mous_dragBefore(screenFlag, "A") == False ) {
		;	return
		;}
	} else {
		res := mous_dragBefore(screenFlag ,winTitle)
		if ( res == False ) {
			return
		}
		windc_anyWaitActive()
	}

	if( dragFlag ){
		MouseGetPos, OutputVarX, OutputVarY
		MouseClickDrag, LEFT, %OutputVarX%, %OutputVarY%, %upDown1%, %upDown2%, %Mou_Plug_O_speed%
	} else {
		MouseMove, %upDown1%, %upDown2%, %Mou_Plug_O_speed%
	}
}

mous_guiHideAndMoveOrDrag(upDown1, upDown2, winTitle, dragFlag, screenFlag){
	moveOrDragGuiFlag := False
	entryGuiFlag := False
	IfWinExist, %gloma_winTitleMoveOrDrag%
	{
		Gui, 46:Hide
		moveOrDragGuiFlag := True
		WinWaitNotActive, %gloma_winTitleMoveOrDrag%, ,1
	}

	IfWinExist, %gloma_winTitleMouseEntry%
	{
		Gui, 40:Hide
		entryGuiFlag := True
		WinWaitNotActive, %gloma_winTitleMouseEntry%, ,1
	}

	mous_mouseMoveOrDrag(upDown1, upDown2, winTitle, dragFlag, screenFlag)
	if( entryGuiFlag ){
		Gui, 40:Show, NA
	}
	if( moveOrDragGuiFlag ){
		Gui, 46:Show, NA
	}
}

mous_clickPointMovePlus(moveX, moveY=0){
	if(moveX != ""){
		gloma_clickPointX += moveX
		gloma_clickPointY += moveY
	}
}

mous_clickPointMove(moveX="", moveY=""){
	if(moveX != ""){
		gloma_clickPointX = %moveX%
	}
	if(moveY != ""){
		gloma_clickPointY = %moveY%
	}
}

mous_clickPointClickPlusMoveTmp(moveX, moveY=0){
	gloma_clickPointX += moveX
	gloma_clickPointY += moveY
	mous_clickPointClick()
	rmopluf_toolTipClickPoint()
	gloma_clickPointX -= moveX
	gloma_clickPointY -= moveY
}

mous_clickOnlyByGui(upDown1, upDown2, radio1, checkFlag1, checkFlag2, checkFlag3, title){
	title := Trim(title)
	if(title == ""){
		title := "A"
	}
	if ( mous_dragBefore(radio1, title) == False ) {
		return
	}

	gloma_clickPointScreenFlag := radio1
	gloma_clickPointDobleFlag := checkFlag1
	gloma_clickPointShiftFlag := checkFlag2
	gloma_clickPointCtrlFlag := checkFlag3

	mous_clickPointMove(upDown1, upDown2)
	mous_clickPointClick()
}

mous_guiHideAndClickOnly(upDown1, upDown2, radio1, checkFlag1, checkFlag2, checkFlag3, title){
	clickOnlyGuiFlag := False
	entryGuiFlag := False
	IfWinExist, %gloma_winTitleClickPoint%
	{
		Gui, 48:Hide
		clickOnlyGuiFlag := True
		WinWaitNotActive, %gloma_winTitleClickPoint%, ,1
	}

	IfWinExist, %gloma_winTitleMouseEntry%
	{
		Gui, 40:Hide
		entryGuiFlag := True
		WinWaitNotActive, %gloma_winTitleMouseEntry%, ,1
	}
	mous_clickOnlyByGui(upDown1, upDown2, radio1, checkFlag1, checkFlag2, checkFlag3, title)
	if( clickOnlyGuiFlag ){
		Gui, 48:Show
	}
	if( entryGuiFlag ){
		Gui, 40:Show
	}
}

mous_clickPointClick(){
	pattern = 1
	if(gloma_clickPointCtrlFlag){
		pattern += 1
	}
	if(gloma_clickPointShiftFlag){
		pattern += 2
	}
	; pattern　が　１なら通常　２ならCtrl　3ならShift　4ならCtrl+Shift
	mous_clickPointClickAssigin(pattern, gloma_clickPointDobleFlag)
}


; pattern　が　１なら通常　２ならCtrl　3ならShift　4ならCtrl+Shift
; 5なら右クリック
mous_clickPointClickAssigin(pattern=1, doubleFlag=False){
	;ToolTip
	clickCount = 1
	if(gloma_clickPointScreenFlag){
		CoordMode, Mouse, Screen
	} else {
		CoordMode, Mouse, Relative
	}
	if(doubleFlag){
		clickCount = 2
	}

	MouseGetPos , OutputVarX, OutputVarY
	if(pattern == 1){
		Click,L,%gloma_clickPointX%, %gloma_clickPointY%, %clickCount%
	} else if(pattern == 2){
		Send,^{Click,L,%gloma_clickPointX%, %gloma_clickPointY%, %clickCount%}
	} else if(pattern == 3){
		Send,+{Click,L,%gloma_clickPointX%, %gloma_clickPointY%, %clickCount%}
	} else if(pattern == 4){
		Send,+^{Click,L,%gloma_clickPointX%, %gloma_clickPointY%, %clickCount%}
	} else if(pattern == 5){
		Click,R,%gloma_clickPointX%, %gloma_clickPointY%
		Sleep, 1000
		windc_anyWaitActive()
	}
	MouseMove, %OutputVarX%, %OutputVarY%
}

mous_setEditRGB(outColor) {
	StringRight, RR, outColor, 2
	StringRight, GGRR, outColor, 4
	StringLeft, GG, GGRR, 2
	StringTrimLeft, BBGGRR, outColor, 2
	StringLeft, BB, BBGGRR, 2
	RRGGBB := RR . GG . BB
	StringLeft, R, RR, 1
	StringLeft, G, GG, 1
	StringLeft, B, BB, 1
	RGB := R . G . B
	rmopluf_outputAny(RRGGBB, outColor, RGB, "", "", "")
}

mous_mousPosColor(){
	CoordMode, Mouse, Screen
	MouseGetPos, outX, outY
	CoordMode, Pixel, Screen
	MouseMove, -100, -100, 8 , R			;マウスが邪魔な場合があるのでどかす
	PixelGetColor, outColor, %outX%, %outY%, Slow
	MouseMove, %outX%, %outY%, 8
	mous_setEditRGB(outColor)
}

mous_setEditMousePos( command, Variation="" ) {

	MouseGetPos, outX, outY
	moveOutX := outX + 700
	if(moveOutX > 1024 ) {
		moveOutX := 1024
	}
	moveOutY := outY + 500
	if( moveOutY > 768 ) {
		moveOutY := 768
	}
	GuiControl,45:Focus , UpDown45_3
	GuiControl,45: ,UpDown45_1,%outX%
	GuiControl,45: ,UpDown45_2,%outY%
	GuiControl,45: ,UpDown45_3,%moveOutX%
	GuiControl,45: ,UpDown45_4,%moveOutY%

	guf_showGuiAssign(45)
	Gui, 46:Show, Hide
	rmopluf_outputAny(command, Variation, "", "", "", "")
}
