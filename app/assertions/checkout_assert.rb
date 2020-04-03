require_relative '../page methods/checkout_met'

class CheckoutAssertions
  include Capybara::DSL
  include RSpec::Matchers

  def initialize
    @checkout = CheckoutMethods.new
  end

  def assert_order_placed
    if @checkout.get_order_number != ' '
      puts "Order number: #{@checkout.get_order_number}"
    else
      expect { raise "oops" }.to raise_error('Order number is blank')
    end
  end
end