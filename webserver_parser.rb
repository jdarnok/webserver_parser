require './log_parser'
require './log_sorter'
require './log_presenter'
parsed_logs = LogParser.call(ARGV[0])
sorted_logs = LogSorter.new(parsed_logs).sort
LogPresenter.call(sorted_logs)
