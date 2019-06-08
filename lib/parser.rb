# frozen_string_literal: true

# :nodoc:
class Parser
  def initialize(webserver_log)
    @log = webserver_log
  end

  def parse
    path
    read_file
  end

  private

  def path
    @path = File.join(File.dirname(__FILE__), @log)
  end

  def read_file
    readfile = File.open(@path, 'r+')
  end
end
