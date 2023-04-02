

optmouplugf_appendStartUpStartUpBuff(append){
	gloma_startUpStartUpBuff .= append . "`n"
}

optmouplugf_startUpStartUpBuffOutput(){
	if(gloma_startUpStartUpBuff != ""){
		rmopluf_errorOutputMousePlug(gloma_startUpStartUpBuff)
	}
}

optmouplugf_easyFileCheckMakeFolderAndFile(file, parentFolder, defaultStr=""){
	IfNotExist, %file%
	{
		type := FileExist(parentFolder)
		if(type == ""){
			FileCreateDir, %parentFolder%
		} else {
			IfNotInString, type, D
			{
				optmouplugf_appendStartUpStartUpBuff(parentFolder . "`nはフォルダ名ではない")
				return
			}
		}
		FileAppend , %defaultStr%, %file%
	}
}

optmouplugf_checkFileAndFolderMakeFolderAndFile(){
	defaultWord := "#設定をする。何も記入しなければ初期値を使用する。`n#fontSize=12`n#fontSizeSmall=10`n#fontSizeTab=10`n#fontName=`n"
	optmouplugf_easyFileCheckMakeFolderAndFile(glomare_userDirCommon . gloma_optionTxtFileName, glomare_userDirCommon . gloma_userMousePlugDirName, defaultWord)
}

; 指定した文字の 右の文字を返す。なければ 空の文字を返す
optmouplugf_rightStrOrNullFromSearchStr(str, searchStr){
	IfNotInString, str, %searchStr%
	{
		return  ""
	}
	StringGetPos, count, str, %searchStr%
	StringLen, length, searchStr
	count += length
	StringTrimLeft, rStr , str, %count%
	rStr  := Trim(rStr )
	return  rStr 
}

; 指定した文字の 左の文字を返す。なければ 空の文字を返す
optmouplugf_leftStrOrNullFromSearchStr(str, searchStr){
	IfNotInString, str, %searchStr%
	{
		return  ""
	}
	StringGetPos, count, str, %searchStr%
	StringLeft, leftStr, str, %count%
	leftStr := Trim(leftStr)
	return  leftStr
}

optmouplugf_fontSizeOptionSet(oneLineText, basicValue){
	rightStr := optmouplugf_rightStrOrNullFromSearchStr(oneLineText, "=")
	if(rightStr == ""){
		rightStr = %basicValue%
	}
	If rightStr is integer
	{
		if(rightStr <= 0){
			optmouplugf_appendStartUpStartUpBuff("MousePlugのフォントサイズのエラー`n0 以下の値になっているのでエラー`n" . oneLineText . "`n")
			rightStr = %basicValue%
		} else if(rightStr >= 51){
			optmouplugf_appendStartUpStartUpBuff("MousePlugのフォントサイズのエラー`n数字が大きすぎるのでエラーにする`n" . oneLineText . "`n")
			rightStr = %basicValue%
		}
		return rightStr
	}
	optmouplugf_appendStartUpStartUpBuff("MousePlugのフォントサイズのエラー`n数字以外が指定されているのでエラー`n" . oneLineText . "`n")
	rightStr = %basicValue%
	return rightStr
}

optmouplugf_optionSettingAny(oneLineText, fromTxtFlag){
	leftStr := optmouplugf_leftStrOrNullFromSearchStr(oneLineText, "=")
	if(leftStr == ""){

	} else {
		StringLower, leftStr, leftStr
		if(leftStr == "fontsize"){
			gloma_fontSize := optmouplugf_fontSizeOptionSet(oneLineText, 12)
		} else if(leftStr == "fontsizesmall"){
			gloma_fontSizeSmall := optmouplugf_fontSizeOptionSet(oneLineText, 10)
		} else if(leftStr == "fontsizetab"){
			gloma_fontSizeTab := optmouplugf_fontSizeOptionSet(oneLineText, 10)
		} else if(leftStr == "fontname"){
			glomare_fontNameAll := optmouplugf_rightStrOrNullFromSearchStr(oneLineText, "=")
			glomare_fontNameAll := Trim(glomare_fontNameAll)
		} else {
			errorMsg := "MousePlugのエラー`n使用できないオプションがある`n"
			optmouplugf_appendStartUpStartUpBuff(errorMsg . oneLineText)
		}
	}
}

optmouplugf_optionSettingFromTxtFile(){
	comment := "#"		; コメントの文字
	loopCount = 0

	IfNotExist, %glomare_userDirCommon%%gloma_optionTxtFileName%
	{
		return
	}

	Loop, Read, %glomare_userDirCommon%%gloma_optionTxtFileName%
	{
		; 現時点では 5 回までのループ
		if(loopCount >= 5){
			break
		}

		oneLineText := Trim(A_LoopReadLine)
		if(oneLineText != ""){
			StringLeft, leftChar, oneLineText, 1
			if(leftChar != comment){		; # が左にあったらコメント扱い
				loopCount++
				optmouplugf_optionSettingAny(oneLineText, True)
			}
		}
	}
}
