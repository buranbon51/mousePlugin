






ohmoupluf_getWithinNumOrErrMsg(value, min, max){
	If value is not integer
	{
		rmopluf_errorOutputMousePlug("数字以外が指定されている`n値  " . value)
		return "error"
	}
	if(value <= min){
		rmopluf_errorOutputMousePlug("数字が小さすぎる`n値  " . value)
		return "error"
	} else if(value >= max){
		rmopluf_errorOutputMousePlug("数字が大きすぎる`n値  " . value)
		return "error"
	}
	return value
}

ohmoupluf_errMsgIfErrorStr(str, viewMsg){
	if( str == "error" ){
		rmopluf_errorOutputMousePlug(viewMsg)
		return True
	}
	return False
}

ohmoupluf_getWithinNumOrBasicAndErrMsg(value, basicValue, min, max, valueName){
	errMsg := valueName . "  の代入のエラー`n初期値を設定する"
	str := ohmoupluf_getWithinNumOrErrMsg(value, min, max)
	if( ohmoupluf_errMsgIfErrorStr(str, errMsg) ){
		return basicValue
	}
	return value
}

ohmoupluf_getFlagByOnOffStrOrBasicAndErrMsg(value, basicValue, valueName){
	errMsg := valueName . "  の代入のエラー`n値  " . value . "`n初期値を設定する"
	flag := func_getFlagByOnOffStrOrErrMsg(value)
	if( ohmoupluf_errMsgIfErrorStr(flag, errMsg) ){
		return basicValue
	}
	return flag
}

; リスト名を更新するときに使う
ohmoupluf_reloadListTitle(iniFile, dir, outList, GuiNum, loopCount){
	;func_fileCheckMakeFolderAndFolder(iniFile, dir)
	buff := "|"
	Loop , %loopCount%
	{
		IniRead, titleTmp, %iniFile%, __listTitle, titleName%A_Index% , set%A_Index%
		titleTmp := Trim(titleTmp)
		if(titleTmp == ""){
			titleTmp := "set" . A_Index
		}
		if(A_Index == 1){
			buff .= titleTmp  . "|"
		} else {
			buff .= "|" . titleTmp
		}
	}

	buff := RTrim(buff, "|")
	guf_setControl( buff, outList, GuiNum )
}

ohmoupluf_deleteAndMakeFile(file, parentFolder=""){
	if( func_myFileExist(file) ){
		func_folderCheckMakeFolder(parentFolder)
		FileDelete, %file%
		FileAppend, %null%, %file%
		if( rmopluf_checkErrorLevelOutput(file  . "`n`tを空にする時にエラー") ){
			return  True
		}
	}
	return  False
}

ohmoupluf_toolTipFunc(text, X, Y, sec=3, toolTipNum=1){
	ToolTip , %text%, %X%, %Y%, %toolTipNum%
	gGloOnHeMoPlu_toolTipNum = %toolTipNum%
	dateTime = %A_Now%
	EnvAdd, dateTime, %sec% , Seconds
	gGloOnHeMoPlu_timerToolTip =  %dateTime%
	SetTimer, ohmouplusub_SubToolTipClose , 1000
}
