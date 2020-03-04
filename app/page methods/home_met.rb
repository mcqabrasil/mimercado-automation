require_relative '../pages/home_page'

class HomeMethods < HomePage
  include Capybara::DSL

  def goto_home
    visit "https://storefront-qa.mimercado.com/"
  end

  def click_product_link(index)
    page.execute_script "window.scrollBy(0,10000)"
    all(:css, PRODUCT_LINK)[index].click
  end

  def get_product_url(index)
    if index < all(:css, PRODUCT_HREF_LINK).size
      return all(:css, PRODUCT_HREF_LINK)[index][:href]
    end
      return nil
  end
  
  def click_see_all_products
    page.execute_script "window.scrollBy(0,10000)"
    find(:dt, SEE_ALL_PROD_LINK).click
  end

  def click_category_link(index)
    all(:css, CATEGORY_URL_LINK)[index].click
  end
 
  def get_category_url(index)
    page.execute_script "window.scrollBy(0,10000)"
    if index < all(:css, CATEGORY_URL_LINK).size
      return all(:css, CATEGORY_URL_LINK)[index][:href]
    end
      return nil
  end

  def click_order_today_btn
    page.execute_script "window.scrollBy(0,10000)"
    find(:dt, ORDER_TODAY_BTN).click
  end 

  def click_order_now_btn
    page.execute_script "window.scrollBy(0,10000)"
    find(:dt, ORDER_NOW_BTN).click
  end

  def click_terms_cond_link
    page.execute_script "window.scrollBy(0,10000)"
    find(:xpath, TERMS_CONDITIONS_LINK).click
  end

  def scroll_down
    page.execute_script "window.scrollBy(0,10000)"
  end

  def scroll_up
    page.execute_script "window.scrollBy(10000,0)"
  end

  def click_close_cookies
    find(:dt, CLOSE_COOKIES_BTN).click
  end
end