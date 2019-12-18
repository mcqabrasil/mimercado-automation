# Class to do the elements actions
class PDPMethods < PDPPage
  include Capybara::DSL

  def initialize
    @plp_met = PlpMethods.new
  end

  def add_any_product_to_cart
    @plp_met.click_prod_from_list(2)
    click_add_to_cart_btn
  end

  def click_add_to_cart_btn
    page.execute_script "window.scrollBy(0,10000)"
    find(:css, ADD_TO_CART_BTN).click
  end

  def get_cart_notification_msg
    find(:dt, NOTIFICATION_MSG).text
  end

  def set_quantity(value)
    find(QUANTITY_FLD).set(value)
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

end
