# frozen_string_literal: true

# # frozen_string_literal: true
#
require 'parser.rb'

# As a user,
# So I can have my log files analysed
# I want the parser to be able to open and read log files

RSpec.describe 'parser' do
  describe '#parse' do
    context 'when files exist' do
      it 'parses logs' do
        parser = Parser.new('webserver_short.log')
        expect { parser.parse }.to_not raise_error
      end
    end

    # As a user,
    # So I know I have a valid file
    # I want to be notified with an error when the file cannot be read
    context 'when files are invalid' do
      it 'raises error' do
        parser = Parser.new('non_existent.log')
        expect { parser.parse }.to raise_error(Errno::ENOENT)
      end
    end
    # As a user,
    # So I can see the number of times web pages have been visited
    # I want to see a list of webpages ordered from most pages views to less page views
    it 'outputs webpages ordered from most page views to least' do
      parser = Parser.new('webserver_short.log')
      expect { parser.parse }.to output("\"/help_page/1 3 visits\"\n\"/about/2 2 visits\"\n\"/about 1 visit\"\n\"/index 1 visit\"\n\"/home 1 visit\"\n\"/contact 1 visit\"\n").to_stdout
    end
  end
end
