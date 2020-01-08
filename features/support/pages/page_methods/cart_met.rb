# Class to do the elements actions
class CartMethods < CartPage
  include Capybara::DSL

  def initialize
    @pdp = PDPMethods.new
  end

  def clean_cart
    click_basket_button
    if cart_empty?
      puts 'Cart is already empty'
    else
      click_clear_cart_btn
      click_remove_all_ok_msg
    end
    click_close_cart_modal
  end

  def add_tocart_if_itis_empty(index, quantity)
    click_basket_button
    if cart_empty?
      click_close_cart_modal
      @pdp.add_product_to_cart(index, quantity)
    else
      puts 'There is item on cart already. No new item added'
      click_close_cart_modal
    end
  end

  def cart_empty?
    has_selector?(:dt, EMPTY_CART_MSG)
  end

  def click_close_cart_modal
    find(:dt, CLOSE_CART_BTN).click 
  end

  def click_clear_cart_btn
    find(:dt, CLEAR_CART_BTN).click
  end

  def click_remove_all_ok_msg
    find(:dt, REMOVE_ALL_OK_MSG).click
  end

  def click_remove_all_cancel_msg
    find(:dt, REMOVE_ALL_CANCEL_MSG).click
  end

  def click_basket_button
    find(:dt, BASKET_BTN).click
  end

  def cart_modal_visible?
    has_css?(CART_VIEW)
  end

  def get_cart_product_sku(sku_code)
    find(:dt, PRODUCT_SKU).text
  end

  def get_discount_code_total
    find(:dt, TOTAL_DISCOUNT_LBL).text
  end

  def get_discount_code_name
    find(:dt, DISCOUNT_APPLIED_DIV).text
  end

  def has_discount_code?
    has_selector?(:dt, DISCOUNT_APPLIED_DIV)
  end

  def click_apply_discount_code_btn
    find(:dt, APPLY_DISCOUNT_CODE_BTN).click
  end

  def click_add_discount_code_btn
    find(:dt, ADD_DISCOUNT_CODE_BTN).click
  end

  def discount_code_fld_visible?
    has_selector?(:nm, DISCOUNT_CODE_FLD, :visible => true)
  end

  def discount_code_btn_visible?
    has_selector?(:dt, ADD_DISCOUNT_BTN)
  end

  def apply_cupom_div_visible?
    has_css?(APPLY_COUPOM_DIV)
  end

  def fill_discount_code_fld(coupon)
    fill_in DISCOUNT_CODE_FLD, with: coupon
    puts "#{coupon}"
    if get_discount_code_content == coupon
      puts 'cupom added sucessfully'
    else
      expect { raise "oops" }.to raise_error('Was not possible to insert cupoun')
    end
  end

  def get_discount_code_content
    find(:nm, DISCOUNT_CODE_FLD).value
  end

  def invalid_coupom_msg_display?(message)
    has_selector?(:dt, INVALID_COUPOM_MSG, :text => message)
  end
  
  def click_add_discount_code
    find(:dt, ADD_DISCOUNT_BTN).click
  end
end
