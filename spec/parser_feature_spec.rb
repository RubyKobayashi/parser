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
        parser = Parser.new('webserver.log')
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
  end
end
