# coding:utf-8
require 'slop'

module Xls2Csv
  module Options
spec = <<-SPEC
---
h,help     show usage
v,version  show version
SPEC

    begin
      opts = Slop.optspec(spec, strict: true)
      opts.parse
    rescue Slop::InvalidOptionError
      puts "xls2csv: illegal option"
      puts "usage: xls2csv -h"
    end


help = <<-EOF
xls2csv convert xls to csv. xls2csv output csv_files by
sheet haved xls_file to dir.

Usage:

    xls2csv [input_xls_file] [output_csv_dir]
    xls2csv -h/--help
    xls2csv -v/--version

Default I/O:

    DEFAULT_XLS_FILE = 'spec/fixture/test.xls'
    DEFAULT_CSV_DIR  = 'spec/fixture/output'

    If you want to change default I/O, you will rewrite
    "xls2csv/bin/xls2csv" of source code.

Options:
#{opts.to_s}
EOF

    if opts.help?
      puts help
      exit
    end

    if opts.version?
      puts "xls2csv version #{Xls2Csv::VERSION.to_s}"
      exit
    end
  end
end