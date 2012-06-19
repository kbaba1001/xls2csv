xls2csv
=====================
xls2csvはxlsファイルをcsvに変換するRubyスクリプトです。OSに関わらず使用できます。

## 使い方
bin/xls2csvを書き換えることで、入力ファイルと出力先ディレクトリを指定します。bin/xls2csvはデフォルトでは次のようになっています。

    core = Xls2Csv::Core.new('spec/fixture/test.xls', 'spec/fixture/output')
    core.convert

ここの`Xls2Csv::Core.new`の第1引数に入力ファイルを、第2引数に出力先ディレクトリを指定してください。

出力先ディレクトリには、入力されたxlsの「シート名.csv」という書式でcsvファイルが出力されます。
出力されたcsvファイルは

    "hello","world"
    "a2","b2"
    "a3","b3"
    "a4","b4"

のように、要素がダブルクォートで囲まれた形で出力されます。