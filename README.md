# MEG160 Brainstorm 解析手順

<details>

  <summary>Fastrack (廣澤先生記載)</summary>

- D:\HDD_backup\_Gamma\Fastrak\020100_HS_Fastrakの020100_HS_MEG用マーカー　をExcelにドロップして開く
- データのある列を選択
- データタブをアクティブにする。
- 区切り位置をクリック→次へ→次へ→完了
- D:\HDD_backup\Gunma_Templete_MRI_Tool\2014_7_林先生ソフトの座標並び替えシート　を開く
- 先ほどのデータを黄色ハイライトの領域にコピペ
- 平行移動後の座標の値、オレンジでハイライトされた5行をコピーする
- メモ帳にペースト
- 020100_marker5.txtとしてD:\HDD_backup\_Gamma\Fastrak_markersに保存する。
- 平行移動後の座標の値、ハイライトされていない3行をコピーする
- メモ帳にペースト
- 020100_marker3.txtとしてD:\HDD_backup\_Gamma\Fastrak_markersに保存する

- D:\HDD_backup\Gunma_Templete_MRI_Tool\2014_7_林先生ソフト からBambiAnalysis_ver2.exeを起動
- ファイル→開く→体表5点.txt→先ほどの020100_marker5.txtを選択する。
- ファイル→開く→コイルマーカー点（3点）→先ほどの020100_marker3.txtを選択する。
- 解析→体表点傾き補正
- Save CSV→020100tilt_correctedとして保存する。
- 保存したファイルを開いて”post”の下の5×3の数字をコピー
- メモ帳にペーストして020100corrected_5.txtとして保存する。
- ”post coil marker”の下の3×3の数字をコピー
- メモ帳にペーストして020100corrected_3.txtとして保存する。

- BambiAnalysis_ver2.exeに戻る。フォーム→TemplateAnalysisと選択
- 1),5)デフォルト読み込み　ボタンをクリック
- 3)解析対象の体表5点データ読み込み　ボタンをクリック
- 先ほどの020100corrected_5.txtを選択
- 4)解析　ボタンをクリック
- テンプレートパス表示をクリック
- 出てきたパスをコピペする（ここではC:\BambiTempData\体表５点\5y_case05.txt）

</details>
 
<details>

  <summary>FastScan (廣澤先生記載)</summary>

- D:\HDD_backup\Polhemus\FastSCANからFastSCANを起動
- Openをクリック
- .fsnファイルを開く（ここではD:\HDD_backup\_Gamma\FastScan\020213_MKにある020213_MK.fsn）
- Stylus listを開く。一つ一つクリックして、下記の位置になっていることを確認
  - Stylus1 Nasion
  - Stylus 2 Cz
  - Stylus 3 LPL(左耳)
  - Stylus 4 RPL(右耳)
  - Stylus 5 Inion
  - Stylus 6 C3
  - Stylus 7 C4
  - Stylus 8 Fz
- Export as→Sweepsを選択
- ファイル名は020213sweeps、左からBounding Box、Cloud of Points、Text-Windows(CRLF)とチェックしてD:\HDD_backup\_Gammaに保存。
- Do you want to export the stylus points as well? に対し、はいを選択
- ファイル名を 020213stylusとし、左からBounding Box, Points + Normals, Text, windows (CRLF) としてD:\HDD_backup\_Gamma\FastScan_markersに保存する

- こうして生成された二つの.txtファイルを開く。
- 最初のファイルは上の4行を、_stylusファイルは上の3行を削除して上書き保存する。
- 上記でStylus listの順序が違っていた場合、この段階で並び替える

- BambiAnalysis_ver2.exeを起動
- フォーム→For FastScan Analysis
- Open FastScan (marker points) をクリックし、_stylusのファイルを選択
- Open FastScan (Sweep)をクリックし、_sweepsのファイルを選択
- Save CSV transformed marker をクリックし、020222tr_markerとして保存
- できた.csvファイルをエクセルで開く
- ファイル→名前を付けて保存→テキスト（タブ区切り）として保存。ファイル名はそのままでOK。

- BambiAnalysis_ver2に戻る。
- ファイル→開く→FastScan変換後StylusData→上でできた_marker.txtを選択（ここでは020222_marker.txt）
- ファイル→名前を付けて保存→CSV data→体表5点→番号_5として保存（ここでは020222_5.csvとなる）
- できたcsvファイルをエクセルで開き、ファイル→名前を付けて保存→テキスト（タブ区切り）として保存（ここでは020222_5.txtとなる）

- D:\2014_7_林先生ソフト\MATLAB送付用プログラムにあるBambiBrain_ver01を起動
（MATLAB2014a compiler runtimeが必要-http://www.mathworks.com/products/compiler/mcr/index.html）
- DB 5-points Open without correcti…をクリック
- D:\2014_7_林先生ソフト\MATLAB送付用プログラム\TiltCorrect_ALL_Surf-5-points_ForKUにあるすべてのファイルを選択し、開くをクリック。
- OPEN MEG 5 pointsをクリック
- 先ほど作成した020222_5.txtを選択する。この際、ダミーで04y_case01.txtも選択する。
- Results auto Saveにチェック
- Tilt correction for MEGをクリック
- Analysis for 5-pointsをクリック
- TemplateSelected_020222_5.txtが目的のファイル。
- 開くと、B1が最適なテンプレートのNoになっている。今回は27なので、D:\2014_7_林先生ソフト\MATLAB送付用プログラム- \TiltCorrect_ALL_Surf-5-points_ForKU フォルダの中にあるNo_027_TiltCorrect_5points_03y_case17.txt、すなわち03y_case17.rawが目的のファイルとなる。（C:\BambiTempData\ 3y_case17）

- ImageJを開く（https://imagej.nih.gov/ij/download.htmlからダウンロード、zipを展開するだけで使用可能）
- File→Import→Rawと選択
- 対応する.rawファイル（ここではD:\HDD_backup\_Gamma\Fastrak_markersにある020100corrected_5.txt_template_64_withAffine_Ver7_lank1.raw）を選択
- パラメータは上から 16 bit Unsigned, 256, 256, 0, 256, 0で、Little-endian byte orderにチェック。
- File→Save As→Analyze 7.5で、D:\HDD_backup\_Gamma\Fastrak_markersに保存する。名前はデフォルトでOK

- MegLaboratoryを起動
- ファイル→ MRIファイル→ANALYZE形式データからMRIファイルを作成
- Addをクリック
- ImageJで作成したAnalyze形式データのうち、.hdrを選択（ここでは5y_case05.hdr）
- OKを選択し、020100MRIとして保存する。

</details>

(以下、相馬がファイルの整理を済ませているものとします。具体的には各個人のフォルダ内に.con、.mrk、.mri、(FastScanを使用するなら).fsnファイルがある状態です。バッチで自動処理するため、ファイルの整理は必ずしも全ファイルが揃っていることを確認・保証するものではありません。)

## MEG160 (相馬・廣澤先生記載)

#### 大雑把な処理の流れは、
1. MEG波形ファイル(.con)にマーカーファイル(.mrk)とMRIファイル(.mri)を紐付ける
2. MRIの座標を左右耳介(LPA,RPA)と鼻根点(nasion)から設定する。MRI上のマーカー位置を目視で設定する。
3. MRIの座標系とMEGのチャンネル位置を対応させるために、マーカーファイルのマーカー位置(MEGチャンネル位置と紐付いている)とMRI上のマーカー位置を合わせる。
4. 脳表面の座標をプロットして保存したファイル(.spf)を作成する。
5. 上記で処理した、MRIとマーカーと紐付いたMEG波形ファイル(.con)と、FastScanもしくはspfを合体して出力する(YokogawaMegExportToolという別exe)

#### 以下で順を追って説明
1. 画面解像度を**1280*800**にする。
2. conファイル、mrkファイル、mriファイル、(FastScanを用いる場合)fsnファイル　があることを確認。無い場合は一旦飛ばす(存在の有無を問い合わせるが、結局無くて除外となる可能性が高い)
3. 開く→.conファイルを開く（例えばC:\Users\home\meg\020456\020456_gazing.con）
4. MRI→MRIファイル名→ C:\Users\home\meg\020456\020456.mri→**相対パス指定にチェック**して開く ※複数ある場合はどれでもよいがfreesurferがあるもの且つなるだけ画像が綺麗なもので。

##### 以下は解析手法ごとにパターンが分かれるようです。
#### ①マーカーを用いた位置合わせ (相馬記載、廣澤先生記載)
1. MRI→頭部座標系の設定→mri画像からNasion、LPA、RPAの位置を指定する。Nasionは鼻根、LPA、RPAは耳介腹側(解剖学的に適切な点を指定すべきか、マーカーの一番核の分厚い部分を指定すべきか不明。理屈から言えば前者)

![image](https://github.com/sirsoldano/brainstorm_BCT/assets/25501011/c30b7cda-5929-41ff-ae99-e03b309fe6af)

2. MRI→MRIマーカー拾い→LPAにチェックしPickをクリックし左耳介マーカーを指定する→RPAにチェックしPickをクリック、右耳介マーカーを指定する→

  - **(ASDの場合)** Prefrontal(Center)をチェックしPickをクリックし、頭頂部背側マーカーを指定する→Prefrontal(Left)をチェックしPickをクリックし頭頂部腹側マーカーを指定する　*※どう見ても場所が外れているマーカーをどうすべきかは不明、相馬は本来あるであろう場所を勝手に置いてました。*

![image](https://github.com/sirsoldano/brainstorm_BCT/assets/25501011/cfbea2e2-4519-42ad-b807-f9600cca2d8f)

  - **(Alzheimerの場合)** Prefrontal(Center)をチェックしPickをクリックし、前頭部マーカーを指定する。261以降の被験者はPrefrontal(Left)をチェックしPickをクリックし、頭頂部マーカーを指定する。 **FastScanからfsnファイルを開きそれを参考に指定する**

![image](https://github.com/sirsoldano/brainstorm_BCT/assets/25501011/4c4ef4fc-80f5-4b60-9b13-4f8ac31fe939)

3. MRI→MEGマーカー位置推定→**相対パス指定**でmrkファイル読み込み→マーカー数が3もしくは4の規定数と同じとなっていることを確認して位置推定実行→失敗しましたと出るが気にしない。→ GOFをチェック
4. (Alzheimerの場合のみ?) 解析→球体モデル定義→Autoをクリック→OK
5. MRI→位置合わせ実行→位置合わせ実行 *※どれだけmriマーカーとmrkマーカーが離れていてもそのまま一回位置合わせを実行して終了する方法もありますし、errorを小さくするようにマーカーをずらして調整する方法もあります。*
6. 画面下のMRI画像の上で右クリック → MEGセンサー表示にチェック → MEGセンサーが現れるのでセンサーの位置がおおむねあっていることを確認する。
**以下、SurfacePointFile作成、エクスポートへ**

#### ②聴覚野ダイポールを使った位置の確認 (廣澤先生記載)
1. NeneのMEGの.conファイル（たとえば314.prosody_neNE1_アナ雪_314_AK）を開き、これに該当するMRIファイル（この症例では3G19）を読み込むということ
2. 209～212のどれかのチャンネルがトリガーになっているので、一番トリガーが多いチャンネルをチェック（例　この症例では211。数がトリガーのチャネル）
3. このために右のセンサーの図の上でマウス右クリック→チャネル選択

![image](https://github.com/sirsoldano/brainstorm_BCT/assets/25501011/2e6fb158-ba09-4449-b28a-aebb43e73f78)

4. 同期加算のアイコンをクリック

![image](https://github.com/sirsoldano/brainstorm_BCT/assets/25501011/0a701e04-7169-434d-b5ea-797bf6a35b7d)

5. Level triggerを211にして、探索をクリック。パラメータを設定し、Executeをクリック。

![image](https://github.com/sirsoldano/brainstorm_BCT/assets/25501011/8328bdc9-5136-43c2-88de-7dc550808f40)

6. .aveファイルが作成される。編集→基線補正。パラメータは -50から0。
7. MRIマーカー拾いと、MEGマーカー読み込み、位置合わせは前述の「マーカーを用いた位置合わせ」と同じ手順。
8. 80-120msくらいにでる成分に注目。被験者にもよって波形は微妙に異なる
（きれいに出る人）

![image](https://github.com/sirsoldano/brainstorm_BCT/assets/25501011/1fd2e3ff-66ac-4a41-8c63-e42f858002e9)
（ややぼやける人）

![image](https://github.com/sirsoldano/brainstorm_BCT/assets/25501011/b55adcbf-8190-4546-a195-307a183a3fb9)

10. ダイポールは左右それぞれに推定していく。その際にはsinkとsourceに注目し、Sinkとsourceの反応がきれいに出ている80-120msくらいを選んで（この人は120より遅め）

![image](https://github.com/sirsoldano/brainstorm_BCT/assets/25501011/8d2d51cb-6fe1-4eb8-8fd1-9fc985bba863)

11. まずは右のセンサーの画面から、ダイポールが出ていそうなところの周辺のセンサーだけを選び

![image](https://github.com/sirsoldano/brainstorm_BCT/assets/25501011/ac706dcc-47a1-42e4-89e8-2256bfac1dc3)

![image](https://github.com/sirsoldano/brainstorm_BCT/assets/25501011/c8918a6c-c311-47e1-9686-f7cb2436da06)

12. 解析→等価電流双極子推定→上のパラメータに設定し、推定＃１をクリック。ダイポールの場所を確認する。
13. MRIマーカー拾いで、脳の位置を調整する。この時、下の図左にあるような場所にダイポールが推定されることを目指す。現実には下図くらいで妥協。

![image](https://github.com/sirsoldano/brainstorm_BCT/assets/25501011/6946faf0-497b-4106-b379-459d2f2646d4)

![image](https://github.com/sirsoldano/brainstorm_BCT/assets/25501011/700fd1fd-30f2-41c9-8d5c-f7b0e5559892)

14. ダイポールがいい位置にくるまで「MRIマーカー拾い→位置合わせ→電流双極子推定」を繰り返す。
15. 画面下のMRIを右クリック→MEGセンサー表示で、下のような画面になるので確認に便利
（センサーが大きくずれている例）

![image](https://github.com/sirsoldano/brainstorm_BCT/assets/25501011/59aad27b-d4fd-4bec-b4c6-5af45293e364)

16. 調整が終わったら、.aveを上書き保存。
17. あらためて.conを開く。
18. 先ほどの.mriをあらためて読み込む
19. .mrkを読み込み、位置合わせ。


### SurfacePointFile作成保存、con保存およびエクスポート
1. ファイル→インポートとエクスポート→BESAテキストエクスポート→Surface point file→fiducial…と聞かれるので、はいをクリック→Surface point listの中にある点をクリックしてdeleteを繰り返し、すべて消す→NewをクリックしPickをクリック、脳の表面を選んで指定する→同じくNewをクリックしPickをクリック、脳の表面を選んで指定することを繰り返す。高さを変えつつ、20点以上選ぶこと（なるべく多い方が、あとでbrainstorm上で位置合わせをするときに精度がよい）。最初の3点は順にLPA、RPA、nasion（小さい赤、黄色、青の点）とする。→OKをクリック→ファイル名を決めて保存。日本語を入れない、被験者番号を入れないことが重要
2. ファイル→名前を付けて保存→末尾に_analysisとつけて保存
3. YokogawaMegExportToolを起動
4. MEG filenameの右のSearchをクリック→先ほど作った_analysis.conを選択→SurfacePointfileは先ほど作った.sfpファイルを選択→Create Export Fileをクリック
(Digitizerファイルがある場合)
5. YokogawaMegExportToolを起動
6. MEG filenameの右のSearchをクリック→先ほど作った_analysis.conを選択→IdenticalMRI.txtファイルを選択→Create Export Fileをクリック(すでにsurfacepointfileでexportしている場合上書きされてしまうのでExportFilenameの末尾を_digi.conなどに変更する)
