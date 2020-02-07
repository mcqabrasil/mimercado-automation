require_relative '../page methods/pdp_met'

class MegaMenuAssertions 
  include Capybara::DSL
  include RSpec::Matchers

  def initialize
    @mm = MegaMenuMethods.new
  end

  def assert_menu_opened
    if @mm.is_menu_opened?
      puts 'Mega Menu modal is opened'
    else
      expect { raise "oops" }.to raise_error('Mega-Menu modal was not opened')
    end
  end
end
