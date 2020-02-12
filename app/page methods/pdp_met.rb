# Class to do the elements actions
require_relative '../pages/pdp_page'
require_relative 'plp_met'

class PDPMethods < PDPPage
  include Capybara::DSL

  def initialize
    @plp = PlpMethods.new
  end

  def add_product_to_cart(quantity, url) # PROVISORIO
    visit('/') # ------ TO BE CHECKED LATER ----------------
    @plp.goto_pdp(url)
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

  def get_quantity_value
    find(:nm, QUANTITY_FLD).value
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
    find(:dt, PRICE_TOTAL_LB).text
  end

  def error_message_visible?(content)
    has_selector?(:dt, QTY_ABOVE_ZERO_MSG, :text => content)
  end

  def add_to_cart_btn_enabled?
    has_selector?(:dt, ADD_TO_CART_BTN, disabled: false)
  end

  def pdp_div_exist?
    has_css?(PDP_DIV)
  end

  def get_product_name
    find(:dt, PRODUCT_NAME_LB).text
  end

  def get_product_price 
    find(:dt, PRODUCT_PRICE_LB).text
  end

  def goto_specifc_pdp(url)
    visit("#{url}")
  end

  def is_similar_prod_present?
    within(SIMILAR_PROD_DIV) do
      has_selector?(:dt, PRODUCT_LINK)
    end
  end

  
end
