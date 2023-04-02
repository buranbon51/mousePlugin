
Mou_Plug_SetO_speed(speed=15){
	Mou_Plug_O_speed := rmopluf_getWithinNumOrBasicAndErrMsg(speed, 15, -1, 100, "Mou_Plug_O_speed")
}

Mou_Plug_SetO_menuPosX(posX=20){
	Mou_Plug_O_menuPosX := rmopluf_getWithinNumOrBasicAndErrMsg(posX, 20, -1, 3000, "Mou_Plug_O_menuPosX")
}

Mou_Plug_SetO_menuPosY(posY=10){
	Mou_Plug_O_menuPosY := rmopluf_getWithinNumOrBasicAndErrMsg(posY, 10, -1, 3000, "Mou_Plug_O_menuPosY")
}

Mou_Plug_assignToAssign(startX, startY, endX, endY, winTitle="A", screenFlag=True){
	rmopluf_beforeWindowControl()
	mous_moveAndDrag(startX, startY, endX, endY, screenFlag, winTitle)
}

Mou_Plug_currentToAssign(endX, endY, dragFlag=False, winTitle="", screenFlag=True){
	rmopluf_beforeWindowControl()
	mous_mouseMoveOrDrag(endX, endY, winTitle, dragFlag, screenFlag)
}

Mou_Plug_currentToPlusPos(plusX, plusY, dragFlag=False, winTitle=""){
	rmopluf_beforeWindowControl()
	mous_moveOrDragRelativ(plusX, plusY, dragFlag, winTitle)
}

Mou_Plug_assignToAssignFromEntryList(listNumber, winTitle=""){
	rmopluf_beforeWindowControlIfA(winTitle)
	mous_mouseDragExecute(listNumber, "", "", "", "", winTitle, "")
}

Mou_Plug_currentToAssignFromEntryList(listNumber, winTitle=""){
	rmopluf_beforeWindowControlIfA(winTitle)
	mous_mouseMoveFromNowExecute(listNumber, "", "", "", winTitle, "")
}

Mou_Plug_currentToPlusPosFromEntryList(listNumber, winTitle=""){
	rmopluf_beforeWindowControlIfA(winTitle)
	mous_mouseRelativExecute(listNumber, "", "", "", winTitle)
}

Mou_Plug_clickPointClickFromEntryList(listNumber, winTitle=""){
	rmopluf_beforeWindowControl()
	mous_mouseClickOnlyExecute(listNumber, "", "", "", "", "", winTitle, "")
}

Mou_Plug_assignToAssignFromEntryListPlusAssign(listNumber, startX="", startY="", endX="", endY="", winTitle="", screenStr=""){
	rmopluf_beforeWindowControlIfA(winTitle)
	mous_mouseDragExecute(listNumber, startX, startY, endX, endY, winTitle, screenStr)
}

Mou_Plug_currentToAssignFromEntryListPlusAssign(listNumber, posX="", posY="", dragFlag=False, winTitle="", screenFlag=True){
	rmopluf_beforeWindowControlIfA(winTitle)
	mous_mouseMoveFromNowExecute(listNumber, posX, posY, dragFlag, winTitle, screenFlag)
}

Mou_Plug_currentToPlusPosFromEntryListPlusAssign(listNumber, plusX="", plusY="", dragStr="", winTitle=""){
	rmopluf_beforeWindowControlIfA(winTitle)
	mous_mouseRelativExecute(listNumber, plusX, plusY, dragStr, winTitle)
}

Mou_Plug_clickPointClickFromEntryListPlusAssign(listNumber, posX="", posY="", dbClickStr="", shiftStr="", ctrlStr="", winTitle="", screenStr=""){
	rmopluf_beforeWindowControl()
	mous_mouseClickOnlyExecute(listNumber, posX, posY, dbClickStr, shiftStr, ctrlStr, winTitle, screenStr)
}

Mou_Plug_assignToAssignSave(listNumber, startX, startY, endX, endY, winTitle="", screenFlag=True, listName=""){
	;rmopluf_beforeWindowControlIfA(winTitle)
	mous_mouseDragEntryFromCommand(listNumber, startX, startY, endX, endY, winTitle, screenFlag, listName)
}

Mou_Plug_currentToAssignSave(listNumber, plusX, plusY, dragFlag=False, winTitle="", screenFlag=True, listName=""){
	;rmopluf_beforeWindowControlIfA(winTitle)
	mous_mouseMoveFromNowEntryFromCommand(listNumber, posX, posY, dragFlag, winTitle, screenFlag, listName)
}

Mou_Plug_currentToPlusPosSave(listNumber, plusX, plusY, dragFlag=False, winTitle="", listName=""){
	;rmopluf_beforeWindowControlIfA(winTitle)
	mous_mouseRelativEntryFromCommand(listNumber, plusX, plusY, dragFlag, winTitle, listName)
}

Mou_Plug_clickPointSave(listNumber, posX, posY, dbClickFlag=False, shiftFlag=False, ctrlFlag=False, winTitle="", screenFlag=True, listName=""){
	;rmopluf_beforeWindowControlIfA(winTitle)
	mous_mouseClickPointEntryFromCommand(listNumber, posX, posY, dbClickFlag, shiftFlag, ctrlFlag, winTitle, screenFlag, listName)
}

Mou_Plug_assignToAssignLoad(listNumber){
	mous_mouseDragLoadFromCommand(listNumber)
}

Mou_Plug_currentToAssignLoad(listNumber){
	mous_mouseMoveFromNowLoadFromCommand(listNumber)
}

Mou_Plug_currentToPlusPosLoad(listNumber){
	mous_mouseRelativLoadFromCommand(listNumber)
}

Mou_Plug_clickPointLoad(listNumber){
	mous_mouseClickPointLoadFromCommand(listNumber)
}

Mou_Plug_clickPointSaveFromMousePos(listNumber, dbClickFlag=False, shiftFlag=False, ctrlFlag=False, screenFlag=True, listName=""){
	if( screenFlag == False ){
		rmopluf_beforeWindowControl()
	}
	mous_mousePosInClickPointEntryFromCommand(listNumber, dbClickFlag, shiftFlag, ctrlFlag, screenFlag, listName)
}

Mou_Plug_click(posX, posY, dbClickFlag=False, shiftFlag=False, ctrlFlag=False, winTitle="", screenFlag=True){
	rmopluf_beforeWindowControlIfA(winTitle)
	mous_clickOnlyByGui(posX, posY, screenFlag, dbClickFlag, shiftFlag, ctrlFlag, winTitle)
}

Mou_Plug_clickPointClick(){
	if( gloma_clickPointScreenFlag == False ){
		rmopluf_beforeWindowControl()
	}
	mous_clickPointClick()
}

Mou_Plug_clickPointClickPlusMoveTmp(moveX, moveY=0){
	if( gloma_clickPointScreenFlag == False ){
		rmopluf_beforeWindowControl()
	}
	mous_clickPointClickPlusMoveTmp(moveX, moveY)
}

Mou_Plug_clickPointChange(number){
	number := rmopluf_getWithinNumOrBasicAndErrMsg(number, "1", 0, 1000, "clickPointの番号")
	mous_clickPointChangeAndOutput(number)
}

; 1が通常  2はCtrl 3はShift 4はCtrl+Shift 5は右クリック
Mou_Plug_clickPointClickAssigin(pattern=1, dbClickFlag=False){
	if( gloma_clickPointScreenFlag == False ){
		rmopluf_beforeWindowControl()
	}
	mous_clickPointClickAssigin(pattern, doubleFlag)
}

Mou_Plug_clickPointMovePlus(plusX="", plusY=0){
	if( gloma_clickPointScreenFlag == False ){
		rmopluf_beforeWindowControl()
	}
	mous_clickPointMovePlus(plusX, plusY)
	rmopluf_toolTipClickPoint()
}

Mou_Plug_clickPointMove(posX="", posY=""){
	if( gloma_clickPointScreenFlag == False ){
		rmopluf_beforeWindowControl()
	}
	mous_clickPointMove(posX, posY)
	rmopluf_toolTipClickPoint()
}

Mou_Plug_clickPointMoveFromMousePos(){
	if( gloma_clickPointScreenFlag == False ){
		rmopluf_beforeWindowControl()
	}
	mous_mousePosClickPoint()
}

Mou_Plug_showClickPointSetFromMousePos(screenFlag=True){
	if( screenFlag == False ){
		rmopluf_beforeWindowControl()
	}
	mous_mousePosInClickPointGuiFromCommand(screenFlag)
}

Mou_Plug_clickPointMoveFromCursor(){
	if( gloma_clickPointScreenFlag == False ){
		rmopluf_beforeWindowControl()
	}
	mous_cursorPosSetClickPoint()
}

Mou_Plug_mouseMoveFromClickPoint(){
	if( gloma_clickPointScreenFlag == False ){
		rmopluf_beforeWindowControl()
	}
	mous_mouseMoveFromClickPointPos()
}

Mou_Plug_clickPointSaveFromCurrentClickPoint(listNumber, winTitle="", listName=""){
	mous_mouseClickPointEntryFromCommand(listNumber, gloma_clickPointX, gloma_clickPointY, gloma_clickPointDobleFlag, gloma_clickPointShiftFlag, gloma_clickPointCtrlFlag, winTitle, gloma_clickPointScreenFlag, listName)
}

Mou_Plug_clickPointLoadFromCurrentClickPoint(){
	mous_clickPointLoadFromCurrentClickPoint()
}
