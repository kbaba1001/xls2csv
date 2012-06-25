# -*- encoding: utf-8 -*-
require File.expand_path('../lib/xls2csv/version', __FILE__)

Gem::Specification.new do |s|
  s.author      = ['Kazuki BABA']
  s.email       = ['kbaba1001@gmail.com']
  s.description = 'xls2csv output csv_files by sheet haved xls_file to dir'
  s.summary     = 'Convert xls to csv'
  s.homepage    = 'https://github.com/kbaba1001/xls2csv'

  s.files       = `git ls-files`.split("\n")
  s.executables = s.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  s.test_files  = s.files.grep(%r{^(test|spec|features)/})
  s.name        = 'xls2csv'
  s.require_paths = ['lib']
  s.version     = Xls2Csv::VERSION
end