xls2csv
=====================
xls2csvはxlsファイルをcsvに変換するRubyスクリプトです。OSに関わらず使用できます。

## 使い方
xls2csvはコンソール上で次のコマンドを実行することで使用できます。

    ./bin/xls2csv <xlsファイルパス> <出力先ディレクトリパス>

引数を付けずに実行した場合デフォルトパスを参照します。
デフォルトパスはbin/xls2csvを書き換えることで変更できます。bin/xls2csvは次のようになっています。

    input = ARGV[0] || 'spec/fixture/test.xls'
    output = ARGV[1] || 'spec/fixture/output'

ここの`spec/fixture/test.xls`や`spec/fixture/output`を変更してください。

出力先ディレクトリには、入力されたxlsの「シート名.csv」という書式でcsvファイルが出力されます。
出力されたcsvファイルは

    "hello","world"
    "a2","b2"
    "a3","b3"
    "a4","b4"

のように、要素がダブルクォートで囲まれた形で出力されます。

## LICENSE
This library is distributed under the GPLv3.