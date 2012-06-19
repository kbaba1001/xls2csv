# coding:utf-8
require 'spreadsheet'
require 'csv'

module Xls2Csv
  class Core
    def initialize(xls, dir)
      @xls = xls
      @dir = dir
      Spreadsheet.client_encoding = 'UTF-8'
    end

    def convert
      read_xls.each do |filename, value|
        write_csv(filename, value)
      end
    end

    def read_xls(xls = @xls)
      csvs = Hash.new{|hash, key| hash[key] = []}
      Spreadsheet.open(xls).worksheets.each do |sheet|
        sheet.each do |row|
          csvs[sheet.name] << row_to_s(row)
        end
      end
      csvs
    end

    def write_csv(filename, value)
      File.open("#{@dir}/#{filename}.csv", 'w') do |f|
        value.each do |row|
          f.puts "\"#{row.join('","')}\""
        end
      end
    end

    private
    def row_to_s(row)
      row.map do |cell|
        if cell.class == Spreadsheet::Formula
          cell.value
        else
          cell.to_s
        end
      end
    end
  end
end

# value.each do |row|
#   row.each do |s|
#     if s.class == Spreadsheet::Formula
#       f.print s.value.to_s
#     else
#       f.print s.to_s
#     end
#     f.print '","'
#   end
#   f.puts '"'
# end



# INPUT_FILE = 'spec/fixtures/tool_fixtures/master.xls'
# OUTPUT_DIR = 'script/tool_fixtures'

# require 'spreadsheet'
# require 'csv'

# Spreadsheet.client_encoding = 'UTF-8'
# output_files = []
# Spreadsheet.open(INPUT_FILE).worksheets.each do |sheet|
#   output_files << "#{OUTPUT_DIR}/#{sheet.name}.csv"
#   CSV.open(output_files.last, 'w', force_quotes: true) do |writer|
#     sheet.each do |row|
#       writer << row
#     end
#   end
# end

# output_files.each do |output|
#   FileUtils.cp(output, "csv_temp.csv")
#   File.open("csv_temp.csv", 'r') do |source|
#     File.open(output, 'w') do |dest|
#       fix = source.read.sub(/^"#<Spreadsheet::Formula:.*$/, '').gsub('""', '').split("\n")
#       fix.shift if fix.first.empty?
#       dest.write(fix.join("\n"))
#     end
#   end
# end
# FileUtils.rm("csv_temp.csv")


# csvs.each do |key, value|
#   case key[0..1]
#   when 'sm'
#   when 'sp'
#   when 'st'
#   else
#   end
# end
