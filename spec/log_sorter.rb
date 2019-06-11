require_relative './../log_sorter'
LOGS_FIXTURE = [
  ['/help_page/1', '126.318.035.038'],
  ['/help_page/1', '543.910.244.929'],
  ['/home', '316.433.849.805'],
].freeze
RSpec.describe LogSorter do
  let(:sorter) { LogSorter.new(LOGS_FIXTURE) }
  let(:sorter_ascending) { LogSorter.new(LOGS_FIXTURE, 'asc') }
  describe '#sort' do
    context 'without arguments' do
      it 'sorts array from most viewed to least popular' do
        results = LogSorter.new(LOGS_FIXTURE).sort
        expect(results.class.to_s).to eq 'Array'
        expect(results.first).to eq ['/help_page/1', 2]
        expect(results.last).to eq ['/home', 1]
      end
    end
    context 'with arguments' do
      describe 'order: asc' do
        it 'sorts array from least viewed to most popular' do
          results = LogSorter.new(LOGS_FIXTURE, 'asc').sort
          expect(results.class.to_s).to eq 'Array'
          expect(results.first).to eq ['/home', 1]
          expect(results.last).to eq ['/help_page/1', 2]
        end
      end
      describe 'order: desc' do
        it 'sorts array from most viewed to least popular' do
          results = LogSorter.new(LOGS_FIXTURE, 'desc').sort
          expect(results.class.to_s).to eq 'Array'
          expect(results.first).to eq ['/help_page/1', 2]
          expect(results.last).to eq ['/home', 1]
        end
      end
    end
  end
end
