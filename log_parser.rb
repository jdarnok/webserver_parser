class LogParser
  LOG_PATTERN = %r{(\/[\w]+[\/]*\w*) ([\d.]+)$}
  def self.call(file)
    log_content = File.open(file, 'r').read
    log_content.scan(LOG_PATTERN)
  end
end
