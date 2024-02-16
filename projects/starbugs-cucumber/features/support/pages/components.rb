require 'rspec'

class Popup
    include Capybara::DSL
    include RSpec::Matchers

    def have_text(text)
        responseText = find('.swal2-html-container')
        expect(responseText.text).to eql text
    end
end