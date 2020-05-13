require_relative '../page methods/header_met'
require_relative '../page methods/pdp_met'

class HeaderAssertions
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
      puts "Total price displayed in basket: #{@header.get_basket_total_price.delete('$')}"
    else
      expect { raise "oops" }.to raise_error('Basket price is empty')
    end
    puts "Total price dispayed in basket: #{@header.get_basket_total_price}"
  end

  def assert_cart_modal_opened
    if @header.is_cart_opened?
      puts "Cart modal was opened"
    else
      expect { raise "oops"}.to raise_error('Cart modal is not visible')
    end
  end

  def assert_cart_modal_closed
    if @header.is_cart_opened?
      expect { raise "oops"}.to raise_error('Cart modal is still opened')
    else
      puts "Cart modal was closed"
    end
  end

  def assert_header_compoments_visible
    puts "Header visibility: #{@header.header_visible?}"
    puts "Logo visibility: #{@header.logo_visible?}" 
    puts "Price label visibility: #{@header.cart_price_visible?}" 
    puts "Cart visibility: #{@header.cart_icon_visible?}" 
    puts "Search visibility: #{@header.search_visible?}" 
    puts "Mega-menu button visibility: #{@header.menu_btn_visible?}"
    if @header.header_visible? &&
       @header.logo_visible? &&
       @header.cart_price_visible? &&
       @header.cart_icon_visible? &&
       @header.search_visible? &&
       @header.menu_btn_visible?
      puts "All header components are visible"
    else
      expect { raise "oops"}.to raise_error('There are components in Header, not visible')
    end
  end
end
