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
      puts "Total price dispayed in basket: #{@header.get_basket_total_price.delete('$')}"
    else
      expect { raise "oops" }.to raise_error('Basket price is empty')
    end
    puts "Total price dispayed in basket: #{@header.get_basket_total_price}"
  end

  def assert_header_visible
    if @header.header_visible?
      puts 'Header is visible'
    else
      expect { raise "oops" }.to raise_error('Header not visible as expected')
    end
  end

  def assert_logo_visible
    if @header.logo_visible?
      puts 'Header logo is visible'
    else
      expect { raise "oops" }.to raise_error('Logo is not visible')
    end
  end

  def assert_cart_price_visible
    if @header.cart_price_visible?
      puts "Cart price value is: #{@header.get_basket_total_price}"
    else
      expect { raise "oops" }.to raise_error('Cart price is not visible')
    end
  end

  def assert_cart_icon_visible
    if @header.cart_icon_visible?
      puts 'Cart icon is visible'
    else
      expect { raise "oops" }.to raise_error('Cart icon is not visible')
    end
  end

  def assert_search_visible
    if @header.search_visible?
      puts 'Search field is visible'
    else
      expect { raise "oops" }.to raise_error('Search field is not visible')
    end
  end

  def assert_menu_btn_visible
    if @header.menu_btn_visible?
      puts 'Menu button field is visible'
    else
      expect { raise "oops" }.to raise_error('Menu button is not visible')
    end
  end

  def assert_cart_modal_opened
    if @header.is_cart_opened?
      puts "Cart modal was opened"
    else
      expect { raise "oops"}.to raise_error('Cart modal is not visible')
    end
  end

end
