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

大雑把な処理の流れは、
1. MEG波形ファイル(.con)にマーカーファイル(.mrk)とMRIファイル(.mri)を紐付ける
2. MRIの座標を左右耳介(LPA,RPA)と鼻根点(nasion)から設定する
3. MRIの座標系とMEGのチャンネル位置を対応させるために、マーカーファイルのマーカー位置(MEGチャンネル位置と紐付いている)とMRI上のマーカー位置を合わせる。
4. (FastScanを使用しない場合)脳表面の座標をプロットして保存したファイル(.spf)を作成する。
5. 上記で処理した、MRIとマーカーと紐付いたMEG波形ファイル(.con)と、FastScanもしくはspfを合体して出力する(MEG160exportという別exe)

以下で順を追って説明
0. 画面解像度を**1280*800**にする。
1. .conファイル、.mrkファイル、.mriファイル、(FastScanを用いる場合).fsnファイル　があることを確認。無い場合は一旦飛ばす(存在の有無を問い合わせるが、結局無くて除外となる可能性が高い)
2. 開く→.conファイルを開く（例えばC:\Users\home\meg\020456\020456_gazing.con）
3. MRI→MRIファイル名→ C:\Users\home\meg\020456\020456.mri→**相対パス指定にチェック**→開く ※複数ある場合はどれでもよいがfreesurferがあるもの且つなるだけ画像が綺麗なもので。
4. MRI→MRIマーカー拾い→LPAにチェックしPickをクリックし左耳介前点を指定する→RPAにチェックしPickをクリック、右耳介前点を指定する→Prefrontal(Center)をチェックしPickをクリックし、Prefrontalを指定する。
