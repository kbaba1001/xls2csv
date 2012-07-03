xls2csv
=====================
xls2csv converts xls to csv. xls2csv write one csv file for
each sheet in a xls file.  All csv files are written to specified dir.

## Usage

    xls2csv [input_xls_file] [output_csv_dir]
    xls2csv                  # use default I/O
    xls2csv -h/--help
    xls2csv -v/--version

## Change default I/O
You may omit input_xls_file and/or output_csv_dir.  
Their defaults are defined is bin/xls2csv and
you can change it.

    DEFAULT_XLS_FILE = 'spec/fixture/test.xls'
    DEFAULT_CSV_DIR  = 'spec/fixture/output'

## Options

    h,help     show usage
    v,version  show version

## LICENSE
This library is distributed under the GPLv3.
