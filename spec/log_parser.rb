require_relative './../log_parser'
RSpec.describe LogParser, '.call' do
  context 'with file' do
    it 'parses .log file into array' do
      result = LogParser.call(File.dirname(__FILE__) + '/log_fixtures.log')
      expect(result.class.to_s).to eq 'Array'
      expect(result.length).to_not eq 0
    end
  end
  context 'without file' do
    it 'throws ArgumentError' do
      expect { LogParser.call }.to raise_error(ArgumentError)
    end
  end
  context 'invalid path' do
    it 'throws Errno::ENOENT' do
      expect { LogParser.call('x') }.to raise_error(Errno::ENOENT)
    end
  end
end
