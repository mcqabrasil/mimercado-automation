# Class to do the elements actions
require_relative 'header_met'
require_relative 'home_met'
require_relative 'pdp_met'
require_relative 'mega-menu_met'
require_relative 'deliverability_met'
require_relative 'login_met'
require_relative 'cart_met'

class Utils
  include Capybara::DSL

  def initialize
    @header_met = HeaderMethods.new
    @home_met = HomeMethods.new
    @pdp_met = PDPMethods.new
    @mm_met = MegaMenuMethods.new
    @dev_met = DeliverabilityMethods.new
    @login_met = LoginMethods.new
    @cart_met = CartMethods.new
  end

  
  def logged_add_to_cart(index, quantity)
    @home_met.goto_home
    @home_met.click_product_link(index)
    @pdp_met.set_quantity(quantity)
    @pdp_met.click_add_to_cart_btn
  end

  def anonimous_add_to_cart(index, quantity, address)
    @home_met.goto_home
    @home_met.click_product_link(index)
    @pdp_met.set_quantity(quantity)
    @pdp_met.click_add_to_cart_btn
    @dev_met.fill_address_zone(address)
    @dev_met.click_confirm_direction_btn
  end

  def clear_cart
    @home_met.goto_home
    @header_met.click_basket_button
    @cart_met.click_clear_cart_btn
    @cart_met.click_close_cart_modal
  end

  def do_checkout_logged
    @header_met.click_basket_button
    @cart_met.click_checkout_btn
    page.execute_script "window.scrollBy(0,10000)"
    sleep 2
    @cart_met.click_place_order
    page.execute_script "window.scrollBy(10000, 0)"
    @cart_met.close_order_placed_modal
  end

  def do_search(text)
    @header_met.open_search_modal
    @header_met.fill_search(text)
  end

  def login(phone)
    @header_met.click_menu
    @mm_met.click_my_account
    @login_met.choose_brazil_country
    @login_met.fill_phone_number(phone)
    @login_met.click_submit
    @login_met.fill_sms_code
    @login_met.click_submit
  end

end