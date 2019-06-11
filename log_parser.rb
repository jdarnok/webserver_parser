class LogParser
  def self.call(file)
    links = []
    File.open(file, 'r') do |log|
      while (line = log.gets)
        links << line.split unless line.empty?
      end
    end
    links
  end
end
