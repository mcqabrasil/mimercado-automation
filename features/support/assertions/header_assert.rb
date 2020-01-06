class Header_Assertions
  include Capybara::DSL
  include RSpec::Matchers

  def initialize
    @header = HeaderMethods.new
    @pdp = PDPMethods.new
  end

  def assert_basket_total_price(pdp_price, basket_price)
    if pdp_price.delete('$') == basket_price.delete('$')
      puts "Total basket is according with the quantity added"
    else
      puts "Total price added: #{pdp_price.delete('$')}"
      puts "Total price dispayed in basket: #{basket_price.delete('$')}"
      expect { raise "oops" }.to raise_error('Basket price is empty or has incorrect value')
    end
    puts "Total price added: #{pdp_price.delete('$')}"
    puts "Total price dispayed in basket: #{basket_price.delete('$')}"
  end

  def assert_price_present_basket
    if @header.get_basket_total_price != '0.00'
      puts "Total price dispayed in basket: #{@header.get_basket_total_price.delete('$')}"
    else
      expect { raise "oops" }.to raise_error('Basket price is empty')
    end
    puts "Total price dispayed in basket: #{@header.get_basket_total_price}"
  end

end