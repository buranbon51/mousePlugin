
名称：MousePlug
作者：ブランボン  
Web：https://textrunrunburanbon.com  


マウスの動きを保存するものです。
簡易的なものです。

TextRunRun から切り離した機能の様なものです。


TextRunRun のプラグインとしての使い方と、
単体のソフトとしての使い方があります。


＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝
# TextRunRun のプラグインとしての使い方
＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝

このソフトの
src の中にある
mousePlug
のフォルダを


TextRunRun の
trrEvery\Plugins
の中にコピーします。


そして、
trrEvery\Plugins
の中にある

pluginsStartUpExecute.ahk
のファイルに以下の行を記入します。

#Include %A_ScriptDir%\trrEvery\Plugins\mousePlug\useForPlug\mousePlugStartUp.ahk



pluginsSubroutineAndFunction.ahk
のファイルにも以下の行を記入します。

#Include %A_ScriptDir%\trrEvery\Plugins\mousePlug\useForPlug\mousePlugSubrouAndFunc.ahk

ーーーーーーーーーーーーーーーーーーーーーーーーーー
## 使い方
ーーーーーーーーーーーーーーーーーーーーーーーーーー

Gosub, Mou_Plug_SubMenuEvery
を使うとこのプラグインのメインといえるメニューが表示します。

基本、このスクリプトを TextRunRun の常時使用のキーとして登録して使います。



＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝
# 単体のソフトとしての使い方
＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝


MainMousePlug.ahk
のファイルと同じフォルダ内に
AutoHotkey.exe
を配置します。

	AutoHotkey.exe は、
	AutoHotkeyU32.exe  や  AutoHotkeyU64.exe
	の事を指しています。

AutoHotkey.exe  に  MainMousePlug.ahk  のファイルをパラメータとして指定して起動します。
（ AutoHotkey.exe  に  MainMousePlug.ahk  をマウスドラッグでも可能。 ）


ただし、単体で使ったとしても使い方に工夫を凝らす事はできません。

ーーーーーーーーーーーーーーーーーーーーーーーーーー
## 使い方
ーーーーーーーーーーーーーーーーーーーーーーーーーー

タスクトレイにこのソフトのアイコンがあります。
それをクリックするとウインドウが表示します。

その中に、右クリック位置と書いてる場所があります。
そこを右クリックすると、
このプラグインのメインといえるメニューが表示します。

ーーーーーーーーーーー
###  終了の仕方
ーーーーーーーーーーー

タスクトレイにあるこのソフトのアイコンを右クリックします。
そのメニューの中にある 
MousePlugの終了  を選んで終了します。


