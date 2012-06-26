xls2csv
=====================
xls2csv convert xls to csv. xls2csv output csv_files by
sheet haved xls_file to dir.

## Usage

    xls2csv [input_xls_file] [output_csv_dir]
    xls2csv                  # use default I/O
    xls2csv -h/--help
    xls2csv -v/--version

## Change default I/O
If you want to change default I/O, you will rewrite
"xls2csv/bin/xls2csv" of source code.

    DEFAULT_XLS_FILE = 'spec/fixture/test.xls'
    DEFAULT_CSV_DIR  = 'spec/fixture/output'

## Options

    h,help     show usage
    v,version  show version

## LICENSE
This library is distributed under the GPLv3.
