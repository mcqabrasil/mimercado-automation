require_relative '../page methods/cart_met'

class CartAssertions
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

  def assert_subtotal_sum
    index = 0
    subtotal = 0.00
    until @cart.get_all_prod_total_price(index).nil?
      total = @cart.get_all_prod_total_price(index).delete('$') 
      puts "index: #{index}, total: #{total}"
      subtotal += total.to_f
      index += 1
    end
    puts "subtotal is: #{subtotal}"
    subtotal_cart = @cart.get_subtotal_price.delete('$').to_f 
    if subtotal == subtotal_cart
      expect(subtotal).to eq(subtotal_cart)
      puts 'The sum of products items on cart are correct on Subtotal'
    else
      expect { raise 'oops' }.to raise_error("products total sum (#{subtotal}) are not matching with the Subtotal quantity (#{subtotal_cart}) ")
    end
    puts "Total sum: #{subtotal}"
    puts "Values displayed on Subtotal in cart: #{subtotal_cart}"
  end

  def assert_total_sum
    total = 0.00
    subtotal = @cart.get_subtotal_price
    shipping = @cart.get_total_shipping
    cart_total_lbl = @cart.get_total_price.delete('$').to_f
    total = subtotal.delete('$').to_f + shipping.delete('$').to_f
    if total == cart_total_lbl
      puts 'Total sum is correctly'
    else
      expect { raise 'oops' }.to raise_error("Total sum (#{total}) is not matching the total price (#{cart_total_lbl})")
    end
    puts "Total sum: #{total}"
    puts "Price displayed on total: #{cart_total_lbl}"
  end

  def assert_cart_modal_closed
    if @cart.cart_modal_visible?
      expect { raise 'oops' }.to raise_error('Cart modal remains opened')
    else
      puts 'Cart modal was closed successfully'
    end
  end

  def assert_url_ison_checkout_page
    expect(page).to have_current_path("http://front.mimercado.ztech.net/checkout")
  end

  def assert_url_ison_plp_page # TO BE MODIFIED LATER WHEN DEVELOPED
    expect(page).to have_current_path("http://front.mimercado.ztech.net")
  end
  
end
