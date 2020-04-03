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
    @plp_met = PlpMethods.new
  end

  
  def logged_add_to_cart(index, quantity)
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
    if @cart_met.cart_empty?
      puts @cart_met.cart_empty?
      puts 'Cart is empty'
      sleep 5
    else
      @cart_met.click_clear_cart_btn
      @cart_met.click_ok_msg
      @cart_met.click_close_cart_modal
    end
  end

  def do_checkout_logged
    @header_met.click_basket_button
    @cart_met.click_checkout_btn
    page.execute_script "window.scrollBy(0,10000)"
    using_wait_time 5 do
      @cart_met.click_place_order
    end
    page.execute_script "window.scrollBy(10000, 0)"
    sleep 5
  #  @cart_met.close_order_placed_modal
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
    sleep 5
    #@login_met.click_submit
  end

  def logoff
    page.execute_script "window.scrollBy(0,10000)"
    @header_met.click_menu
    @mm_met.click_my_account
    @login.click_logoff
  end

  def get_current_path
    page.current_path
  end

  def max (a,b)
    a>b ? a : b
  end

  def scroll_until_element_exist(selector,index)
    lenght_script = %{
      return document.querySelectorAll('div[data-testid="#{selector}"]').length;
    }
    scroll_index_script = %{
      document.querySelectorAll('div[data-testid="#{selector}"]')[#{index}].scrollIntoView(true)
    }
    scroll_footer_script = %{
      document.querySelectorAll('footer')[0].scrollIntoView(true)
    }

    cur_length = page.execute_script(lenght_script).to_i

    if index >= 50
      while cur_length <= index
        puts "LOADING MORE ITEMS"
        page.execute_script(scroll_footer_script)
        cur_length = page.execute_script(lenght_script).to_i
        sleep 1
      end
    end

    puts index
    puts cur_length
    #puts "b"
    page.execute_script(scroll_index_script)
  end

  def add_hundred_prod_to_cart
    index = 0
    100.times do
      # @plp_met.goto_plp
      visit("https://storefront-qa.mimercado.com/hogar-y-limpieza/hogar-y-limpieza-66")

      scroll_until_element_exist('productListingItem', index)
     # page.execute_script "window.scrollBy(0,10000)"
      #@plp_met.get_products_list_total_by_index(index)
      @plp_met.click_prod_from_list(index)
      @pdp_met.click_add_to_cart_btn
      index += 1
    end
    @header_met.click_basket_button
    puts "Total products in cart: #{@cart_met.get_total_products}"
  end
end