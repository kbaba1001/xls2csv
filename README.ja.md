xls2csv
============================
xls2csvはxlsファイルをcsvに変換するRubyスクリプトです。OSに関わらず使用できます。

## 使い方
xls2csvはコンソール上で次のコマンドを実行することで使用できます。

    ./bin/xls2csv <xlsファイルパス> <出力先ディレクトリパス>

引数を付けずに実行した場合デフォルトパスを参照します。
デフォルトパスはbin/xls2csvを書き換えることで変更できます。bin/xls2csvは次のようになっているので、必要なら書き換えてください。

    DEFAULT_XLS_FILE = 'spec/fixture/test.xls'
    DEFAULT_CSV_DIR  = 'spec/fixture/output'

出力先ディレクトリには、入力されたxlsの「シート名.csv」という書式でcsvファイルが出力されます。
出力されたcsvファイルは

    "hello","world"
    "a2","b2"
    "a3","b3"
    "a4","b4"

のように、要素がダブルクォートで囲まれた形で出力されます。

## ライセンス
GPLv3
