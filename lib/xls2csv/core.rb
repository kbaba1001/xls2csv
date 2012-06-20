# coding:utf-8
require 'spreadsheet'
require 'csv'

module Xls2Csv
  class Core
    def initialize(xls, dir, logger = Logger.new(STDOUT))
      @xls = xls
      @dir = dir
      @logger = logger
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
    rescue Errno::ENOENT
      @logger.info $!.message
    rescue Ole::Storage::FormatError
      @logger.info "#{xls} is not xls-file."
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
