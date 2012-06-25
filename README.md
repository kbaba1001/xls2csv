xls2csv
=====================
xls2csv convert xls to csv. xls2csv output csv_files by
sheet haved xls_file to dir.

## Usage

    xls2csv [input_xls_file] [output_csv_dir]
    xls2csv  # use default I/O
    xls2csv -h/--helop
    xls2csv -v/--version

## Change default I/O
If you want to change default I/O, you will rewrite
"xls2csv/bin/xls2csv" of source code.

    DEFAULT_XLS_FILE = 'spec/fixture/test.xls'
    DEFAULT_CSV_DIR  = 'spec/fixture/output'

## Options

    h,help     show usage
    v,version  show version

==========================
xls2csvはxlsファイルをcsvに変換するRubyスクリプトです。OSに関わらず使用できます。

## 使い方
xls2csvはコンソール上で次のコマンドを実行することで使用できます。

    ./bin/xls2csv <xlsファイルパス> <出力先ディレクトリパス>

引数を付けずに実行した場合デフォルトパスを参照します。
デフォルトパスはbin/xls2csvを書き換えることで変更できます。

    DEFAULT_XLS_FILE = 'spec/fixture/test.xls'
    DEFAULT_CSV_DIR  = 'spec/fixture/output'

出力先ディレクトリには、入力されたxlsの「シート名.csv」という書式でcsvファイルが出力されます。
出力されたcsvファイルは

    "hello","world"
    "a2","b2"
    "a3","b3"
    "a4","b4"

のように、要素がダブルクォートで囲まれた形で出力されます。

## LICENSE
This library is distributed under the GPLv3.