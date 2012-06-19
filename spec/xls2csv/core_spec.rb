# coding:utf-8
require 'spec_helper'

module Xls2Csv
  describe Core do
    let(:core){ Core.new('spec/fixture/test.xls', 'spec/fixture/output') }

    it '#initialize' do
      core.class.should == Xls2Csv::Core
    end

    describe '#read' do
      let(:read){ core.read_xls }

      it 'Hashを返す' do
        read.class.should == Hash
      end

      it 'Hashにxlsのシートが格納されている' do
        read.keys.should == %w[Sheet1 Sheet2 Sheet3]
      end

      describe '#write' do
        it '配列をcsvファイルに書き込む' do
          core.write_csv(read.keys.first, read.values.first)
          head = open("spec/fixture/output/#{read.keys.first}.csv").first
          head.should == "\"hello\",\"world\"\n"
        end
      end
    end
  end
end
