# frozen_string_literal: true

# :nodoc:
class Parser
  def initialize(webserver_log)
    @log = webserver_log
    @website_names = []
    @counts = Hash.new 0
  end

  def parse
    path
    read_file
    analyze_names
    count_website_names
    sort_hash
    output_website_visits
  end

  private

  def path
    @path = File.join(File.dirname(__FILE__), @log)
  end

  def read_file
    @readfile = File.open(@path, 'r+')
  end

  def analyze_names
    @readfile.each_line do |line|
      line_array = line.split(' ')
      name = line_array[0]
      @website_names.push(name)
    end
  end

  def count_website_names
    @website_names.each do |name|
      @counts[name] += 1
    end
  end

  def sort_hash
    @sorted_counts = @counts.sort_by { |_key, value| value }.reverse.to_h
  end

  def output_website_visits
    @sorted_counts.each do |key, value|
      if value <= 1
        p "#{key} #{value} visit"
      else
        p "#{key} #{value} visits"
      end
    end
  end
end
