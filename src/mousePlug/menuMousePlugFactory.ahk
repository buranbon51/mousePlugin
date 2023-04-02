





; マウス関係
Menu, Mou_Plug_MenuEntry, Add, 指定位置から指定位置(&D), Mou_Plug_SubShowEntryAssignToAssign
Menu, Mou_Plug_MenuEntry, Add, 今の位置から指定位置(&A), Mou_Plug_SubShowEntryCurrentToAssign
Menu, Mou_Plug_MenuEntry, Add, 今の位置からプラス(&R), Mou_Plug_SubShowEntryCurrentToPlusPos
Menu, Mou_Plug_MenuEntry, Add, クリックポイント(&P), Mou_Plug_SubShowEntryClickPoint

Menu, Mou_Plug_MenuClickPoint, Add, クリックポイント１(&1), Mou_Plug_SubClickPointChange1
Menu, Mou_Plug_MenuClickPoint, Add, クリックポイント２(&2), Mou_Plug_SubClickPointChange2
Menu, Mou_Plug_MenuClickPoint, Add, クリックポイント３(&3), Mou_Plug_SubClickPointChange3
Menu, Mou_Plug_MenuClickPoint, Add, クリックポイント４(&4), Mou_Plug_SubClickPointChange4
Menu, Mou_Plug_MenuClickPoint, Add, クリックポイント５(&5), Mou_Plug_SubClickPointChange5
Menu, Mou_Plug_MenuClickPoint, Add
Menu, Mou_Plug_MenuClickPoint, Add, クリックポイントの位置にマウスをもってくる(&M), Mou_Plug_SubMouseMoveFromClickPoint
Menu, Mou_Plug_MenuClickPoint, Add
Menu, Mou_Plug_MenuClickPoint, Add, キャンセル(&C), Mou_Plug_SubCancel


Menu, Mou_Plug_MenuEntryFromClick, Add, スクリーンを指定する(&M), Mou_Plug_SubEntryFromClick
Menu, Mou_Plug_MenuEntryFromClick, Add, ウインドウを指定する(&W), Mou_Plug_SubEntryFromClickFromWindow
Menu, Mou_Plug_MenuEntryFromClick, Add, 今の位置から(&R), Mou_Plug_SubEntryFromClickFromNowPos

;Menu, Mou_Plug_MenuGetControl, Add, クラスハンドル(&C), Mou_Plug_SubGetClassNN
;Menu, Mou_Plug_MenuGetControl, Add, ウインドウハンドル(&W), Mou_Plug_SubGetWindowHandle

Menu, Mou_Plug_AssignToAssign, Add, スクリーン(&S), Mou_Plug_SubShowAssignToAssignLoad
Menu, Mou_Plug_AssignToAssign, Add, ウインドウ(&A), Mou_Plug_SubShowAssignToAssignLoadFromWindow
Menu, Mou_Plug_AssignToAssign, Add, 以前の状態を表示(&B), Mou_Plug_SubShowAssignToAssign

Menu, Mou_Plug_MenuCurrentToAssign, Add, スクリーン(&S), Mou_Plug_SubShowCurrentToAssign
Menu, Mou_Plug_MenuCurrentToAssign, Add, ウインドウ(&A), Mou_Plug_SubShowCurrentToAssignFromWindow

;Menu, Mou_Plug_MenuColorMove, Add, スクリーン(&S), Mou_Plug_SubSearchColorPos
;Menu, Mou_Plug_MenuColorMove, Add, ウインドウ(&A), Mou_Plug_SubSearchColorPosFromWindow

;Menu, Mou_Plug_MenuImgMove, Add, スクリーン(&S), Mou_Plug_SubSearchImgPos
;Menu, Mou_Plug_MenuImgMove, Add, ウインドウ(&A), Mou_Plug_SubSearchImgPosFromWindow

Menu, Mou_Plug_MenuEvery, Add, 指定位置から指定位置(&D) , :Mou_Plug_AssignToAssign
Menu, Mou_Plug_MenuEvery, Add, 今の位置から指定位置(&P) , :Mou_Plug_MenuCurrentToAssign
Menu, Mou_Plug_MenuEvery, Add, 今の位置からプラス(&R) , Mou_Plug_SubShowCurrentToPlusPos
Menu, Mou_Plug_MenuEvery, Add, クリックポイント(&K) , Mou_Plug_SubShowClickPoint
Menu, Mou_Plug_MenuEvery, Add, クリックポイント切り替え(&L) , :Mou_Plug_MenuClickPoint
Menu, Mou_Plug_MenuEvery, Add
Menu, Mou_Plug_MenuEvery, Add, マウスで登録(&E), :Mou_Plug_MenuEntryFromClick
Menu, Mou_Plug_MenuEvery, Add
Menu, Mou_Plug_MenuEvery, Add, 登録を表示(&M), :Mou_Plug_MenuEntry
Menu, Mou_Plug_MenuEvery, Add
Menu, Mou_Plug_MenuEvery, Add, 色を取得(&G), Mou_Plug_SubColorSetPos
;Menu, Mou_Plug_MenuEvery, Add, 指定した色に移動(&S)  ,:Mou_Plug_MenuColorMove
;Menu, Mou_Plug_MenuEvery, Add, 指定した画像に移動(&I)  ,:Mou_Plug_MenuImgMove
;Menu, Mou_Plug_MenuEvery, Add
;Menu, Mou_Plug_MenuEvery, Add, コントロールを取得(&H) , :Mou_Plug_MenuGetControl
Menu, Mou_Plug_MenuEvery, Add
Menu, Mou_Plug_MenuEvery, Add, バージョン情報(&V), Mou_Plug_SubShowVersion
Menu, Mou_Plug_MenuEvery, Add, キャンセル(&C), Mou_Plug_SubCancel

