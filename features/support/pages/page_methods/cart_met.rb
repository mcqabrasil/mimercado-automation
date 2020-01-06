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
    #has_xpath?('//*[@id="viewport"]/div[2]/div/div[3]/h4')
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
end
