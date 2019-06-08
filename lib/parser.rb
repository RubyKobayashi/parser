# frozen_string_literal: true

# :nodoc:
class Parser
  def parse(webserver_log)
    path = File.join(File.dirname(__FILE__), webserver_log)
    readfile = File.open(path, 'r+')
  end
end
