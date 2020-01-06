# Class to do the elements actions
class PDPMethods < PDPPage
  include Capybara::DSL

  def initialize
    @plp_met = PlpMethods.new
  end

  def add_product_to_cart(index, quantity)
    @plp_met.click_prod_from_list(index)
    set_quantity(quantity)
    click_add_to_cart_btn
  end

  def click_add_to_cart_btn
    page.execute_script "window.scrollBy(0,10000)"
    find(:dt, ADD_TO_CART_BTN).click
  end

  def get_cart_notification_msg
    find(:dt, NOTIFICATION_MSG).text
  end

  def set_quantity(value)
    fill_in QUANTITY_FLD, with: value
    find(:nm, QUANTITY_FLD).send_keys :tab
  end

  def click_ok_notification
    find(:css, OK_MSG).click
  end

  def click_proceed_to_cart_notification
    find(:css, PROCEED_TO_CHECKOUT_MSG).click
  end

  def notification_visible?
    has_css?(NOTIFICATION_MSG_CSS, :visible => true)
  end

  def get_product_total_price
    find(:dt, PRICE_TOTAL_LABEL).text
  end

  def error_message_visible?(content)
    has_selector?(:dt, QTY_ABOVE_ZERO_MSG, :text => content)
  end

  def add_to_cart_btn_enabled?
    has_button?(ADD_TO_CART_BTN, :disabled => false)
   # has_selector?(:dt, ADD_TO_CART_BTN, :disabled => false)
  end

end
