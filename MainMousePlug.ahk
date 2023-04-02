
#SingleInstance FORCE	;終了してから再起動

#KeyHistory 0
;#NoTrayIcon

; 後で設定
;DetectHiddenWindows, Off
DetectHiddenText, Off

SetWorkingDir, %A_ScriptDir%



;#Include %A_ScriptDir%\src\mousePlug\useForPlug\mousePlugStartUp.ahk

#Include %A_ScriptDir%\onlyHere\splitCommon\globalMousePlugReplace.ahk

#Include %A_ScriptDir%\src\mousePlug\globalMousePlug.ahk

#Include %A_ScriptDir%\src\mousePlug\easyToUse\easyToUseVarMousePlug.ahk

#Include %A_ScriptDir%\onlyHere\onlyHereMousePlugValue.ahk

#Include %A_ScriptDir%\src\mousePlug\option\beforehandMousePlug.ahk

#Include %A_ScriptDir%\src\mousePlug\guiMousePlugFactory.ahk

#Include %A_ScriptDir%\src\mousePlug\menuMousePlugFactory.ahk

#Include %A_ScriptDir%\src\mousePlug\initSettingMousePlug.ahk


#Include %A_ScriptDir%\onlyHere\onlyHereMousePlugStartup.ahk

optmouplugf_checkFileAndFolderMakeFolderAndFile()

optmouplugf_startUpStartUpBuffOutput()





IfNotExist,  %A_ScriptDir%\icon.ico
{
	if(A_IsCompiled == 1){
		Menu, Tray, Icon, %A_ScriptFullPath%
	} else {
		Menu, Tray, Icon, %A_AhkPath%
	}
} else {
	Menu, Tray, Icon, %A_ScriptDir%\icon.ico
}


Menu, Mou_Plug_MenuEvery, Add, 終了(&X), ohmouplusub_mousePlugSoftExitApp

Menu, Tray, Add, 結果表示(&K), ohmouplusub_showExplain
Menu, Tray, Add, マウスのメニュー(&A), :Mou_Plug_MenuEvery
Menu, Tray, Add, 登録のウインドウ(&H), Mou_Plug_SubShowEntryAssignToAssign
Menu, Tray, Add, エラーの表示(&E), ohmouplusub_showErrorMouse
Menu, Tray, Add
Menu, Tray, Add, MousePlugの終了(&X), ohmouplusub_mousePlugSoftExitApp

Menu, Tray, NoStandard
Menu, Tray, Default, 結果表示(&K)
Menu, Tray, Click, 1

Menu, Tray, Tip, MousePlugSoft



DetectHiddenWindows, Off

return

#Include %A_ScriptDir%\onlyHere\onlyHereMousePlugSubLutin.ahk


;#Include %A_ScriptDir%\src\mousePlug\useForPlug\mousePlugSubrouAndFunc.ahk

#Include %A_ScriptDir%\src\mousePlug\mousePlugSubLutins.ahk

#Include %A_ScriptDir%\src\mousePlug\guiMousePlugSubLutin.ahk

#Include %A_ScriptDir%\src\mousePlug\guiMousePlugFunc.ahk

#Include %A_ScriptDir%\src\mousePlug\mousePlugFunc.ahk

#Include %A_ScriptDir%\src\mousePlug\easyToUse\easyToUseMousePlugFunc.ahk

#Include %A_ScriptDir%\src\mousePlug\option\optionMousePlugFunc.ahk


#Include %A_ScriptDir%\onlyHere\splitCommon\replaceMousePlugFunc.ahk

#Include %A_ScriptDir%\onlyHere\onlyHereMousePlugFunc.ahk



#Include %A_ScriptDir%\src\commonSrc\guiCommonFunction.ahk

#Include %A_ScriptDir%\src\commonSrc\functionCommon.ahk

#Include %A_ScriptDir%\src\commonSrc\windowCommonFunc.ahk

#Include %A_ScriptDir%\src\commonSrc\otherLibFunc.ahk

