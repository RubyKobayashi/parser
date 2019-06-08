# frozen_string_literal: true

# # frozen_string_literal: true
#
require 'parser.rb'

# As a user,
# So I can have my log files analysed
# I want the parser to be able to open and read log files

RSpec.describe 'parser' do
  describe '#parse' do
    it 'parses logs' do
      parser = Parser.new('webserver.log')
      expect { parser.parse }.to_not raise_error
    end
  end
end
