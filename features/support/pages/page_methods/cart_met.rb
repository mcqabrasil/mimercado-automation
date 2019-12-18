# Class to do the elements actions
class CartMethods < CartPage
  include Capybara::DSL

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

  def cart_empty?
    has_css?('.cl-accent .ml30', :text => 'Your shopping cart is empty.', :visible => true)
  end

  def click_close_cart_modal
    # find(:dt, CLOSE_CART_BTN).click 
    find(:accessibility_id, CLOSE_CART_BTN).click 
  end

  def click_clear_cart_btn
    find(:css, CLEAR_CART_BTN).click
  end

  def click_remove_all_ok_msg
    find(REMOVE_ALL_OK_MSG).click
  end

  def click_remove_all_cancel_msg
    find(REMOVE_ALL_CANCEL_MSG).click
  end

  def click_basket_button
    find(:dt, BASKET_BTN).click
  end

  def cart_modal_visible?
    has_dt?(CART_VIEW)
  end

  def get_cart_product_sku(sku_code)
    find(:dt, PRODUCT_SKU).text
  end
end
