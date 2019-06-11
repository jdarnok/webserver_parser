class LogSorter
  def initialize(logs, order = 'desc')
    @logs = logs
    @order = order
  end

  def sort
    unique_url_paths = @logs.uniq(&:first).collect(&:first)
    logs_summed = unique_url_paths.collect do |unique_url_item|
      [
        unique_url_item,
        @logs.count { |log_item| log_item.first == unique_url_item }
      ]
    end
    return logs_summed.sort_by(&:last).reverse if @order.casecmp('desc').zero?

    logs_summed.sort_by(&:last)
  end
end
