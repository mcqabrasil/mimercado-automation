# frozen_string_literal: true

class Cart_Assertions
  include Capybara::DSL
  include RSpec::Matchers

  def initialize
    @cart = CartMethods.new
  end

  def assert_product_on_cart(sku_code)
    if @cart.get_cart_product_sku(sku_code).include? "#{sku_code}"
      puts 'Product is on cart'
    else
      expect { raise "oops" }.to raise_error('Product is not on cart')
    end
    puts "Product sky code given: #{sku_code}"
    puts "Product code returned from element: #{@cart.get_cart_product_sku(sku_code)}"
  end

  def assert_discount_code_applied
    if @cart.has_discount_code?
      if @cart.get_discount_code_total != ' ' &&
         @cart.get_discount_code_name != ' '
        puts 'Discount code applied successfully'
      else
        expect { raise "oops" }.to raise_error('Discount code applied Total or Name is incorrect')
      end
    else
      expect { raise "oops" }.to raise_error('Discount code was not applied')
    end
    puts "Discount code description: #{@cart.get_discount_code_name}"
    puts "Discount code total: #{@cart.get_discount_code_total}"
  end

  def assert_discount_fld_visible
    if @cart.discount_code_fld_visible?
      puts 'Discount field is visible'
    else
      expect { raise "oops" }.to raise_error('Discount field is not visible')
    end
  end

  def assert_discount_fld_hidden
    if @cart.discount_code_fld_visible?
      expect { raise "oops" }.to raise_error('Discount field is visible')
    else
      puts 'Discount field is hidden'
    end
  end

  def assert_invalid_coupon_msg_display(message)
    if @cart.invalid_coupom_msg_display?(message)
      puts 'Error message was displayed'
    else
      expect { raise "oops" }.to raise_error('Error message was not displayed or is incorrect')
    end
  end
end
