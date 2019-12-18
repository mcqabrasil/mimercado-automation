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
end
