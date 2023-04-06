

gumoplugf_cleatedDateMousePlug(){

	version := "v1.00"
	cleatedDate := "2023年4月6日"
	softName := "MousePlug"
	message := "`nプラグイン名　　：　" . softName . "`nバージョン　：　" . version . "`n作成日　　 ：　" . cleatedDate . "`n作者　　　　：　ブランボン`n"

	func_msgBoxOnlyOk(message, "バージョン情報")
}

gumoplugf_hideGui49(){
	Gui, 49:Hide
	ToolTip, , , , 2
}


gumoplugf_hideGui40(){
	Gui, 40:Hide
	Gui, 45:Hide
	Gui, 46:Hide
	Gui, 47:Hide
	Gui, 48:Hide
	WinWaitNotActive, %gloma_winTitleMouseEntry%, ,1
	WinWaitNotActive, %gloma_winTitleDrag%, ,1
	WinWaitNotActive, %gloma_winTitleMoveOrDrag%, ,1
	WinWaitNotActive, %gloma_winTitleMoveOrDragRelativ%, ,1
	WinWaitNotActive, %gloma_winTitleClickPoint%, ,1
}

gumoplugf_entryWindowMinimize(){
	IfWinExist , %gloma_winTitleMouseEntry%
	{
		Gui, 40:Minimize
		WinWaitNotActive, %gloma_winTitleMouseEntry%, ,1
	}
}

gumoplugf_getNumFromDpiMou(lessThan110, lessThan140, moreThan140){
	if(glomare_dpiNum <= 110){
		return lessThan110
	} else if(glomare_dpiNum <= 140){
		return lessThan140
	} else if(glomare_dpiNum >= 140){
		return moreThan140
	}
	return lessThan110
}

; 設定したフォントのサイズとDPI（PCの解像度）によって、取得する値が変えられる。
gumoplugf_getFontNumFromDpiAndOptionMou(lessThan110, lessThan140, moreThan140){
	plus = 0
	if(glomare_fontSizeAllOption == 1){
		plus := -3
	} else if(glomare_fontSizeAllOption == 2){
		plus := -2
	} else if(glomare_fontSizeAllOption == 3){
		plus := -1
	} else if(glomare_fontSizeAllOption == 5){
		plus := 1
	} else if(glomare_fontSizeAllOption == 6){
		plus := 2
	} else if(glomare_fontSizeAllOption == 7){
		plus := 3
	} else if(glomare_fontSizeAllOption == 8){
		plus := 4
	}
	lessThan110 += plus
	lessThan140 += plus
	moreThan140 += plus
	returnValue := gumoplugf_getNumFromDpiMou(lessThan110, lessThan140, moreThan140)
	return returnValue
}

gumoplugf_initGui40(){
	posX := glomare_maxWinWidth - 300
	Gui, 40:Show, Hide x%posX% y33   AutoSize , %gloma_winTitleMouseEntry%
}


gumoplugf_initGui45(){
	posX := glomare_maxWinWidth - 540
	Gui, 45:Show, Hide x%posX% y30 AutoSize, %gloma_winTitleDrag%
}

gumoplugf_initGui46(){
	posX := glomare_maxWinWidth - 540
	Gui, 46:Show, Hide x%posX% y30 AutoSize, %gloma_winTitleMoveOrDrag%
}

gumoplugf_initGui47(){
	posX := glomare_maxWinWidth - 540
	Gui, 47:Show, Hide x%posX% y30 AutoSize, %gloma_winTitleMoveOrDragRelativ%
}

gumoplugf_initGui48(){
	posX := glomare_maxWinWidth - 540
	Gui, 48:Show, Hide x%posX% y30 AutoSize, %gloma_winTitleClickPoint%
}

gumoplugf_initGui49(){
	Gui, 49:Show, Hide x0 y0 w%A_ScreenWidth% h%A_ScreenHeight%, __Mouse_Macro_
}
