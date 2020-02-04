require_relative '../page methods/home_met'

class HomeAssertions 
  include Capybara::DSL
  include RSpec::Matchers

  def initialize
    @home = HomeMethods.new
  end

  def assert_pdf_file
    expect(page).to have_current_path("https://storefront-qa.mimercado.com/assets/files/MiMercado_privacy.pdf")
  end

  def assert_scroll_down
    if @home.footer_visible?
      puts 'Scroll down successfully'
    else
      expect { raise 'oops' }.to raise_error('Not able to scroll down')
    end
  end
end
