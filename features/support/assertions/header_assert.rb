class Header_Assertions
  include Capybara::DSL
  include RSpec::Matchers

  def initialize
    @header = HeaderMethods.new
  end

  def assert_basket_quantity(value)
    if @header.get_basket_quantity == value
      puts 'Total quantity correctly displayed in basket'
    else
      expect { raise "oops" }.to raise_error('Quantity displayed is not matching')
    end
    puts "Quantity in basket: #{@header.get_basket_quantity}"
    puts "Quantity informed: #{value}"
  end
end