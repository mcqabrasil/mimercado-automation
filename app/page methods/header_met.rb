require_relative '../pages/header_page'

class HeaderMethods < HeaderPage
  include Capybara::DSL

  def get_basket_total_price
    find(:xpath, CART_PRICE).text
  end
  
  def header_visible?
    has_xpath?(HEADER_PATH)
  end

  def logo_visible?
    has_css?(HEADER_LOGO)
  end

  def cart_price_visible?
    has_xpath?(CART_PRICE)
  end

  def cart_icon_visible?
    has_selector?(:dt, CART_BTN)
  end

  def search_visible?
    has_selector?(:dt, SEARCH_HEADER)
  end

  def fill_search(text)
    fill_in SEARCH_FLD, with: text
    find(SEARCH_FLD).send_keys :enter
  end

  def open_search_modal
    find(:dt, SEARCH_HEADER).click
  end
 
  def menu_btn_visible?
    has_selector?(:dt, MENU_BTN)
  end

  def click_menu
    find(:dt, MENU_BTN).click
  end

  def close_modal
    find(:dt, CLOSE_MODAL_BTN).click
  end

  def click_basket_button
    find(:dt, CART_BTN).click
  end

  def is_cart_opened?
    has_selector?(:dt, CART_MODAL)
  end

  def click_cart_price
    find(:xpath, CART_PRICE).click
  end

  def get_search_results
    within('.productListingItem') do
      find('.text-label')
    end
  end
end
