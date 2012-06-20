# coding:utf-8
require 'spec_helper'

module Xls2Csv
  describe Core do
    let(:input_path){ 'spec/fixture/test.xls' }
    let(:sheets){ %w[Sheet1 Sheet2 Sheet3] }
    let(:output_path){ 'spec/fixture/output' }

    describe '【正常系】xlsを入力する' do
      let(:core){ Core.new(input_path, output_path) }

      it '#initialize' do
        core.class.should == Xls2Csv::Core
      end

      describe '#read_xls' do
        let(:read){ core.read_xls }

        it 'Hashを返す' do
          read.class.should == Hash
        end

        it 'Hashにxlsのシートが格納されている' do
          read.keys.should == sheets
        end

        describe '#write_csv' do
          it '配列をcsvファイルに書き込む' do
            core.write_csv(read.keys.first, read.values.first)
            check_hello_world read.keys.first
          end

          it 'Excelの関数は計算結果をcsvに書き込む' do
            core.write_csv(read.keys[1], read.values[1])
            check_hello_world read.keys.first
          end
        end
      end

      describe '#convert' do
        it 'convertを実行すると全部自動でやってくれる' do
          core.convert
          sheets.each { |s| check_hello_world s }
        end
      end

      def check_hello_world(sheet)
        head = open("#{output_path}/#{sheet}.csv").first
        head.should == "\"hello\",\"world\"\n"
      end
    end

    describe '【異常系】' do
      let(:logger){ mock('logger') }

      describe '#read_xls' do
        it '存在しないファイルを入力する' do
          core = Core.new('not_found_file'*3 + '.xls', output_path, logger)
          logger.should_receive(:info).with(/Reading ERROR!!!/)
          logger.should_receive(:info).with(/No such file or directory/)
          core.read_xls
        end

        it 'xlsでないファイルを入力する' do
          core = Core.new('spec/fixture/test/Sheet1.csv', output_path, logger)
          logger.should_receive(:info).with(/Reading ERROR!!!/)
          logger.should_receive(:info).with(/is not xls-file/)
          core.read_xls
        end

        describe '#write_csv' do
          it '出力先ディレクトリが存在しない' do
            core = Core.new(input_path, 'not_found_dir'*3, logger)
            logger.should_receive(:info).with(/Writing ERRER!!!/)
            logger.should_receive(:info).with(/No such file or directory/)

            read = core.read_xls
            core.write_csv(read.keys.first, read.values.first)
          end

          it '書き込み権限がない' do
            core = Core.new(input_path, 'spec/fixture/output/not_writeable/', logger)
            logger.should_receive(:info).with(/Writing ERRER!!!/)
            logger.should_receive(:info).with(/Permission denied/)

            read = core.read_xls
            core.write_csv(read.keys.first, read.values.first)
          end
        end
      end
    end
  end
end
