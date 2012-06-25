Gem::Specification.new do |s|
  s.name        = 'xls2csv'
  s.version     = Xls2Csv::VERSION
  s.summary     = 'Convert xls to csv'
  s.description = 'xls2csv output csv_files by sheet haved xls_file to dir'

  s.author      = 'baba kazuki'
  s.email       = 'kbaba1001@gmail.com'
  s.homepage    = 'https://github.com/kbaba1001/xls2csv'
  s.files       = `git ls-files`.split("\n")
  s.test_files  = `git ls-files -- test/*`.split("\n")
  s.add_development_dependency 'rake'
  s.add_development_dependency 'minitest'
end