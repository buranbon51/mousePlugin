
; ウインドウの操作をする前の前準備。
; 実行元のテキストを隠して、どれかのウインドウが最前面になるのを待つ
rmopluf_beforeWindowControl(){

/*
	gumoplugf_entryWindowMinimize()
	edi_hideGuiTextPatternAnyWinActiveWait()
*/

	gumoplugf_entryWindowMinimize()
	IfWinExist , %gGloOnHeMoPlu_winTitle35%
	{
		Gui, 35:Minimize
	}
	windc_anyWaitActive()
}

; A が指定されてたら、実行元テキストを隠す
rmopluf_beforeWindowControlIfA(winTitle){

/*
	gumoplugf_entryWindowMinimize()
	edi_hideOrMinimizeGuiTextPatternWinIfA(winTitle)
*/

	if(winTitle == "A"){
		gumoplugf_entryWindowMinimize()
		IfWinExist , %gGloOnHeMoPlu_winTitle35%
		{
			Gui, 35:Minimize
		}
		windc_anyWaitActive()
	}

}

; エラーメッセージ表示用
rmopluf_errorOutputMousePlug(errorMessage){

/*
	guit_errorAppend(errorMessage)
*/

	guf_appendBoxEditCursorMove(errorMessage, "BoxEdit36_1", 36, hwndEditBox36_1)
	guf_showGuiAssign(36, "NA")
}

; 簡単な説明表示用
rmopluf_easyExplainMousePlug(str){

/*
	CoordMode, ToolTip, Relative
	timf_toolTipFunc(str, 30, 350, 3)

	guit_setExplain(str, 71)
*/

	guf_setControl( str, "BoxEdit35_1", 35 )

}

rmopluf_checkErrorLevelOutput(append){

/*
	res := guit_checkErrorLevelOutput(append)
	return res
*/

	if(ErrorLevel >= 1){
		rmopluf_errorOutputMousePlug( "ErrorLevel   " . ErrorLevel  . "`n" . append)
		return False
	}
	return True

}

; value が範囲内の数字かどうか確認する
rmopluf_getWithinNumOrBasicAndErrMsg(value, basicValue, min, max, valueName){
/*
	value := outs_getWithinNumOrBasicAndErrMsg(value, basicValue, min, max, valueName)
	return value
*/

	value := ohmoupluf_getWithinNumOrBasicAndErrMsg(value, basicValue, min, max, valueName)
	return value

}

; value が True か False かを確認
rmopluf_getFlagByOnOffStrOrBasicAndErrMsg(value, basicValue, valueName){
/*
	value := outs_getFlagByOnOffStrOrBasicAndErrMsg(value, basicValue, valueName)
	return value
*/

	value := ohmoupluf_getFlagByOnOffStrOrBasicAndErrMsg(value, basicValue, valueName)
	return value

}

;ファイルがあるか確認し、なかったらエラー表示するだけ
rmopluf_fileCheckIfNotExistErrorMsg(file, ErrMsg){

/*
	if( func_myFileNotExit(file) ){
		rmopluf_errorOutputMousePlug(ErrMsg)
		return False
	}
	return True
*/

	if( func_myFileNotExit(file) ){
		rmopluf_errorOutputMousePlug(ErrMsg)
		return False
	}
	return True

}

; リスト名を更新するときに使う
rmopluf_reloadListTitleMousePlug(iniFile, dir, outList, GuiNum, loopCount){

/*
	outs_reloadListTitle(iniFile, dir, outList, GuiNum, loopCount)
*/

	ohmoupluf_reloadListTitle(iniFile, dir, outList, GuiNum, loopCount)

}

rmopluf_toolTipExplainMousePlug(str, posX, posY, sec, toolTipNum){

/*
	timf_toolTipFunc(str, posX, posY, sec)
*/

	;rmopluf_easyExplainMousePlug(str)
	ohmoupluf_toolTipFunc(str, posX, posY, sec, toolTipNum)

}

rmopluf_toolTipClickPoint(){
	str := "clickPoint"
	if(gloma_clickPointScreenFlag){
		CoordMode, ToolTip, Screen
	} else {
		CoordMode, ToolTip, Relative
		str .= "(相対位置)"
	}
	rmopluf_toolTipExplainMousePlug(str, gloma_clickPointX, gloma_clickPointY, 7, 1)
}

rmopluf_outputAny(out1, out2, out3, out4, out5, out6){

/*
	guf_setControl( out1, "Edit61_2", 61 )
	guf_setControl( out2, "Edit61_3", 61 )
	guf_setControl( out3, "Edit61_4", 61 )
	guf_setControl( out4, "Edit61_5", 61 )
	guf_setControl( out5, "Edit61_6", 61 )
	guf_setControl( out6, "Edit61_7", 61 )
	guf_showGuiAssign(61)
*/

	str := out1 . "`n" . out2 . "`n" . out3 . "`n" . out4 . "`n" . out5 . "`n" . out6
	guf_setControl( str, "BoxEdit35_1", 35 )
}
