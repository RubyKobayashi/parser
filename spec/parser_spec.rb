# frozen_string_literal: true

require './lib/parser'
# As a user,
# So I can have my log files analysed
# I want the parser to be able to open and read log files

RSpec.describe Parser do
  let(:testlog) do
    File.new('./spec/fixtures/files/test.log')
  end
  let(:content) do
    "/help_page/1 126.318.035.038
    /contact 184.123.665.067
    /home 184.123.665.067
    /about/2 444.701.448.104
    /help_page/1 929.398.951.889
    /index 444.701.448.104
    /help_page/1 722.247.931.582
    /about 061.945.150.735
    /about/2 444.701.448.104"
  end
  let(:not_a_file) { 'non_file' }

  before do
    allow(File).to receive(:open).and_return(content)
  end

  context 'when file exists' do
    it 'can open and read log files' do
      parser = Parser.new
      parser.parse(testlog)
      expect(File).to have_received(:open)
    end
  end
end
