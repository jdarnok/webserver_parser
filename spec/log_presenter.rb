
require_relative './../log_presenter'
ARRAY_FIXTURE = [
  ['/help_page/1', 2],
  ['/home', 1],
]
HELP_PAGE_PATH_REGEX = %r{help_page\/1}
HELP_PAGE_OCCURENCES_REGEX = %r{help_page\/1\D+2}
RSpec.describe LogPresenter, '.call' do
  context 'with correct array' do
    it 'shows "/help/page/1" path' do
      expect { LogPresenter.call(ARRAY_FIXTURE) }.to output(HELP_PAGE_PATH_REGEX).to_stdout
    end
    it 'shows 2 occurences for /help/page/1' do
      expect { LogPresenter.call(ARRAY_FIXTURE) }.to output(HELP_PAGE_OCCURENCES_REGEX).to_stdout
    end
  end
  context 'without incorrect array' do
    it 'does not show invalid elements of an array' do
      expect { LogPresenter.call(['imInvalid']) }.to_not output(/imInvalid/).to_stdout
    end
    it 'shows valid elements of an array' do
      with_invalid_element = ARRAY_FIXTURE.push('imInvalid')
      expect { LogPresenter.call(with_invalid_element) }.to_not output(/imInvalid/).to_stdout
      expect { LogPresenter.call(with_invalid_element) }.to output(HELP_PAGE_PATH_REGEX).to_stdout
      expect { LogPresenter.call(with_invalid_element) }.to output(HELP_PAGE_OCCURENCES_REGEX).to_stdout
    end
  end
end
