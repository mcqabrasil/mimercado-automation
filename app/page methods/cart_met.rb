# Class to do the elements actions
require_relative '../pages/cart_page'
# require_relative '../pdp_met'

class CartMethods < CartPage
  include Capybara::DSL

  def initialize
    @pdp = PDPMethods.new
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
    find(:dt, OK_MSG).click
  end

  def click_ok_msg
    find(:dt, OK_MSG).click
  end

  def click_remove_all_cancel_msg
    find(:dt, REMOVE_ALL_CANCEL_MSG).click
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
    if get_discount_code_content == coupon
      puts 'cupom filled sucessfully'
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

  def get_all_prod_total_price(index)
    if index < all(:dt, PRODUCT_PRICE_LBL).size
      return all(:dt, PRODUCT_PRICE_LBL)[index].text
    end
    return nil
  end

  def get_subtotal_price
    find(:dt, SUBTOTAL_PRICE_LBL).text
  end

  def get_total_price 
    find(:dt, TOTAL_PRICE_LBL).text
  end

  def remove_product(sku)
    find(:dt, "#{REMOVE_PRODUCT}#{sku}").click
  end

  def get_product_quantity(sku)
    find(:nm, "#{PROD_QUANTITY_FLD}#{sku}").value
  end

  def set_product_quantity(sku, quantity)
    fill_in "#{PROD_QUANTITY_FLD}#{sku}", with: quantity
    find(:nm, "#{PROD_QUANTITY_FLD}#{sku}").send_keys :tab
    if get_product_quantity(sku) == quantity
      puts 'quantity filled sucessfully'
    else
      expect { raise "oops" }.to raise_error('Was not possible to set quantity')
    end
  end

  def get_total_shipping
    find(:dt, TOTAL_SHIPPING_LBL).text
  end

  def remove_coupon
    find(:dt, CLEAR_COUPON).click
  end

  def click_return_shopping_link
    find(:dt, RETURN_TO_SHOPPING_LINK).click
  end

  def click_checkout_btn
    find(:dt, CHECKOUT_BTN).click
  end

  def has_product_on_cart?
    has_selector?(:dt, PRODUCT_LINK)
  end

  def click_place_order
    find(:dt, PLACE_ORDER_BTN).click
  end

  def close_order_placed_modal
    find(:xpath, CLOSE_ORDER_REVIEW).click
  end
end
