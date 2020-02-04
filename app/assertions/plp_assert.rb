
require_relative '../page methods/plp_met'

class PLPAssertions 
  include Capybara::DSL
  include RSpec::Matchers

  def initialize
    @plp = PlpMethods.new
  end

  def assert_plp_url
    expect(page).to have_current_path("https://storefront-qa.mimercado.com/inicio")
  end

  def assert_url_category(url)
    expect(page).to have_current_path("#{url}")
  end
end