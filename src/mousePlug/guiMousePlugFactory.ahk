




; マウスのエントリー用
guf_guiFontFromSizeAndName(gloma_fontSizeTab, "", 40)
Gui, 40:Margin, X10 Y5
Gui, 40:Add, Tab2, X0 ym+5 w240 h405  vTab40_1 , Tab1|Tab2|Tab3|Tab4
guf_guiFontFromSizeAndName(gloma_fontSize, glomare_fontNameAll, 40)
Gui, 40:Tab, 1
Gui, 40:Add, Text, xm+10 y+10, 指定位置から`n指定位置へドラッグ(&E)
Gui, 40:Add, ListBox, X10 y+5 w200  R10  VScroll AltSubmit vList40_1, set1||set2|set3|set4|set5|set6|set7|set8|set9|set10|set11|set12|set13|set14|set15|set16|set17|set18|set19|set20
guf_guiFontFromSizeAndName(gloma_fontSizeSmall, "", 40)
Gui, 40:Add, Text,  X10 y+13,  リスト名(&T)
Gui, 40:Add, Edit,    x+5 yp-3  w120  vEdit40_1_1
Gui, 40:Add, Button,  xm+10 y+15 gSubButton40_1_1 , 保存(&S)
Gui, 40:Add, Button,    x+15 yp+0 gSubButton40_1_2, 読み出し(&L)
Gui, 40:Add, Button,  xm+10 y+30 gSubButton40_1_3, 実行(&O)


Gui, 40:Tab, 2
guf_guiFontFromSizeAndName(gloma_fontSize, "", 40)
Gui, 40:Add, Text, xm+10 y+10, 今の位置から`n指定位置へ移動(&E)
Gui, 40:Add, ListBox, X10 y+5 w200  R10  VScroll AltSubmit vList40_2, set1||set2|set3|set4|set5|set6|set7|set8|set9|set10|set11|set12|set13|set14|set15|set16|set17|set18|set19|set20
guf_guiFontFromSizeAndName(gloma_fontSizeSmall, "", 40)
Gui, 40:Add, Text,  X10 y+13,  リスト名(&T)
Gui, 40:Add, Edit,    x+5 yp-3  w120  vEdit40_2_1
Gui, 40:Add, Button,  xm+10 y+15 gSubButton40_2_1 , 保存(&S)
Gui, 40:Add, Button,    x+15 yp+0 gSubButton40_2_2, 読み出し(&L)
Gui, 40:Add, Button,  xm+10 y+30 gSubButton40_2_3, 実行(&O)


Gui, 40:Tab, 3
guf_guiFontFromSizeAndName(gloma_fontSize, "", 40)
Gui, 40:Add, Text, xm+10 y+10, 今の位置から`nプラスした位置へ移動(&E)
Gui, 40:Add, ListBox, X10 y+5 w200  R10  VScroll AltSubmit vList40_3, set1||set2|set3|set4|set5|set6|set7|set8|set9|set10|set11|set12|set13|set14|set15|set16|set17|set18|set19|set20
guf_guiFontFromSizeAndName(gloma_fontSizeSmall, "", 40)
Gui, 40:Add, Text,  X10 y+13,  リスト名(&T)
Gui, 40:Add, Edit,    x+5 yp-3  w120  vEdit40_3_1
Gui, 40:Add, Button,  xm+10 y+15 gSubButton40_3_1 , 保存(&S)
Gui, 40:Add, Button,    x+15 yp+0 gSubButton40_3_2, 読み出し(&L)
Gui, 40:Add, Button,  xm+10 y+30 gSubButton40_3_3, 実行(&O)


Gui, 40:Tab, 4
guf_guiFontFromSizeAndName(gloma_fontSize, "", 40)
Gui, 40:Add, Text, xm+10 y+10, 指定位置をクリック(&E)
Gui, 40:Add, ListBox, X10 y+5 w200  R10  VScroll AltSubmit vList40_4, set1||set2|set3|set4|set5|set6|set7|set8|set9|set10|set11|set12|set13|set14|set15|set16|set17|set18|set19|set20
guf_guiFontFromSizeAndName(gloma_fontSizeSmall, "", 40)
Gui, 40:Add, Text,  X10 y+13,  リスト名(&T)
Gui, 40:Add, Edit,    x+5 yp-3  w120  vEdit40_4_1
Gui, 40:Add, Button,  xm+10 y+15 gSubButton40_4_1 , 保存(&S)
Gui, 40:Add, Button,    x+15 yp+0 gSubButton40_4_2, 読み出し(&L)
Gui, 40:Add, Button,  xm+10 y+30 gSubButton40_4_3, クリック(&O)
Gui, 40:Add, Button,  xm+10 y+20 gSubButton40_4_4, 今のマウスの位置を読み出し(&R)

Gui, 40:+Resize




; マウスの位置とドラッグ位置指定
guf_guiFontFromSizeAndName(gloma_fontSize, glomare_fontNameAll, 45)
Gui, 45:Add, Text, X30 Y5, 指定位置から`n指定位置へドラッグ
guf_guiFontFromSizeAndName(gloma_fontSizeSmall, "", 45)
Gui, 45:Add, Text, X55 y+5, X
Gui, 45:Add, Text, X125 yp+0, Y
Gui, 45:Add, Text, X10 y+5, From
Gui, 45:Add, Edit, xp+35 yp+0 w60  Number  Limit4  vUpDown45_1
Gui, 45:Add, UpDown, Range-1500-2000 128 ,100

Gui, 45:Add, Edit, x+10 yp+0 w60  Number  Limit4  vUpDown45_2
Gui, 45:Add, UpDown, Range-1500-1500 128 ,100

guf_guiFontFromSizeAndName(gloma_fontSize, "", 45)
Gui, 45:Add, Text, X10 y+20, To
Gui, 45:Add, Edit, xp+35 yp+0 w60  Number  Limit4  vUpDown45_3
Gui, 45:Add, UpDown, Range-1500-2000 128 ,500

Gui, 45:Add, Edit, x+10 yp+0 w60  Number  Limit4  vUpDown45_4
Gui, 45:Add, UpDown, Range-1500-1500 128 ,400

Gui, 45:Add, Button, X10 y+10 gSubButton45_1 Default, On(&O)

Gui, 45:Add, Text, X10 y+20, From Screen Or ActiveWindow
Gui, 45:Add, Radio, xp+5 y+5 vRadio45_1  Checked, Screen(&S)
Gui, 45:Add, Radio, x+10 yp+0 vRadio45_2, Window(&W)
Gui, 45:Add, Text,  X10 y+10, ウインドウタイトル(&T)
Gui, 45:Add, Edit,  xp+5 y+5 w150  vEdit45_1

Gui, 45:+Resize
Gui, 45:+AlwaysOnTop
;Gui, 45:-Border



;  マウスの位置ドラッグ指定。入力欄２つのみ
guf_guiFontFromSizeAndName(gloma_fontSize, glomare_fontNameAll, 46)
Gui, 46:Add, Text, X30 Y5, 今の位置から`n指定位置へ移動
Gui, 46:Add, Text,  X20  y+5, X
Gui, 46:Add, Text,  X90  yp+0, Y
Gui, 46:Add, Edit,  X10  y+5 w60   Number  Limit4  vUpDown46_1
Gui, 46:Add, UpDown, Range-1500-2000 128 ,20

Gui, 46:Add, Edit,  x+10 yp+0 w60  Number  Limit4  vUpDown46_2
Gui, 46:Add, UpDown, Range-1500-2000 128 ,100

guf_guiFontFromSizeAndName(gloma_fontSizeSmall, "", 46)
Gui, 46:Add, Button,X10  y+5 gSubButton46_1 Default, On(&O)

Gui, 46:Add, Radio, X10  y+10 vRadio46_1  Checked, Move(&M)
Gui, 46:Add, Radio, x+10 yp+0 vRadio46_2, Drag(&D)

Gui, 46:Add, Text,  X10  y+20, From Screen Or ActiveWindow
Gui, 46:Add, Radio, xp+5  y+5 vRadio46_3  Checked , Screen(&S)
Gui, 46:Add, Radio, x+10 yp+0 vRadio46_4, Window(&W)
Gui, 46:Add, Text,  X10  y+10, ウインドウタイトル(&T)
Gui, 46:Add, Edit,  xp+5  y+5 w150  vEdit46_1

Gui, 46:+Resize
Gui, 46:+AlwaysOnTop


; マウスの位置ドラッグ指定。２つのみ指定。の、相対位置バージョン
guf_guiFontFromSizeAndName(gloma_fontSize, glomare_fontNameAll, 47)
Gui, 47:Add, Text, X30 Y5, 今の位置から`nプラスした位置へ移動
Gui, 47:Add, Text,  X20  y+5, X
Gui, 47:Add, Text,  X90  yp+0, Y
Gui, 47:Add, Edit,  X10  y+5 w60    Limit4  vUpDown47_1
Gui, 47:Add, UpDown, Range-1500-2000 128 ,20

Gui, 47:Add, Edit,  x+10 yp+0 w60   Limit4  vUpDown47_2
Gui, 47:Add, UpDown, Range-1500-1500 128 ,100

guf_guiFontFromSizeAndName(gloma_fontSizeSmall, "", 47)
Gui, 47:Add, Button,X10  y+5 gSubButton47_1 Default, On(&O)

Gui, 47:Add, Radio, X10  y+10 vRadio47_1  Checked, Move(&M)
Gui, 47:Add, Radio, x+10 yp+0 vRadio47_2, Drag(&D)

Gui, 47:Add, Text,  X10  y+10, ウインドウタイトル(&T)
Gui, 47:Add, Edit,  xp+5  y+5 w150  vEdit47_1

Gui, 47:+Resize
Gui, 47:+AlwaysOnTop



;  クリックポイントの指定。
guf_guiFontFromSizeAndName(gloma_fontSize, glomare_fontNameAll, 48)
Gui, 48:Add, Text, X30 Y5, 指定位置をクリック
Gui, 48:Add, Text,  X20  y+5, X
Gui, 48:Add, Text,  X90  yp+0, Y
Gui, 48:Add, Edit,  X10  y+5 w60   Number  Limit4  vUpDown48_1
Gui, 48:Add, UpDown, Range-0-2000 128 ,10

Gui, 48:Add, Edit,  x+10 yp+0 w60  Number  Limit4  vUpDown48_2
Gui, 48:Add, UpDown, Range-0-1500 128 ,10

guf_guiFontFromSizeAndName(gloma_fontSizeSmall, "", 48)
Gui, 48:Add, Button,X10  y+5 gSubButton48_1 Default, On(&O)

Gui, 48:Add, Text,  X10  y+20, From Screen Or ActiveWindow
Gui, 48:Add, Radio, xp+5  y+5 vRadio48_1  Checked , Screen(&S)
Gui, 48:Add, Radio, x+10 yp+0 vRadio48_2, Window(&W)
Gui, 48:Add, Checkbox, X20 y+15  vCheckbox48_1  , ダブルクリック(&D)
Gui, 48:Add, Checkbox, X20 y+20  vCheckbox48_2  , Shiftを押す(&H)
Gui, 48:Add, Checkbox, X20 y+5  vCheckbox48_3  , Ctrlを押す(&R)
Gui, 48:Add, Text,  X10  y+10, ウインドウタイトル(&T)
Gui, 48:Add, Edit,  xp+5  y+5 w150  vEdit48_1

Gui, 48:+Resize
Gui, 48:+AlwaysOnTop


; 半透明のウインドウ
Gui, 49:Add, Edit, X0 Y0  Hidden Disabled  vEdit49_1
Gui, 49:Add, Edit, X0  y+0  Hidden Disabled  vEdit49_2
Gui, 49:-Caption
Gui, 49:+ToolWindow
Gui, 49:Color, 0000FF
