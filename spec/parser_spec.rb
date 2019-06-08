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

  context 'when file exists' do
    it 'can open and read log files' do
      allow(File).to receive(:open).and_return(content)
      parser = Parser.new(testlog)
      expect { parser.parse }.to_not raise_error
      expect(File).to have_received(:open)
    end

    it 'outputs webpages ordered from most page views to least' do
      allow(File).to receive(:open).and_return(content)
      parser = Parser.new(testlog)
      expect { parser.parse }.to output("\"/help_page/1 3 visits\"\n\"/about/2 2 visits\"\n\"/about 1 visit\"\n\"/index 1 visit\"\n\"/home 1 visit\"\n\"/contact 1 visit\"\n").to_stdout
    end
  end
  context 'when file doesnt exists' do
    it 'raises error' do
      parser = Parser.new(not_a_file)
      expect { parser.parse }.to raise_error(Errno::ENOENT)
    end
  end
end
