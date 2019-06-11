class LogPresenter
  def self.call(results)
    printf("%4s\t%-20s\t%s\n", 'Order', 'Path', 'Occurrences')
    results.each_with_index do |result, i|
      next unless result.size == 2

      order = (i+1).to_s.ljust(4)
      path = result[0]
      occurrences = result[1]
      printf("%-4d\t%-20s\t%d\n", order, path, occurrences)
    end
  end
end
