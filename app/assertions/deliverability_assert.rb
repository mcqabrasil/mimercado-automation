require_relative '../page methods/deliverability_met'

class DeliverabilityAssertions
  include Capybara::DSL
  include RSpec::Matchers

  def initialize
    @dev = DeliverabilityMethods.new
  end

  def assert_modal_open
    if @dev.is_deliverability_open?
      puts "Deliverability modal is opened"
    else
      expect { raise "oops" }.to raise_error('Deliverability modal was not opened')
    end
  end

end