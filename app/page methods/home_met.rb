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
    return all(:css, PRODUCT_HREF_LINK)[index][:href]
  end

  def click_see_all_products
    find(:css, SEE_ALL_PROD_LINK).click
  end

  def click_category_link(index)
    all(:css, CATEGORY_URL_LINK)[index].click
  end

  def get_category_url(index)
    page.execute_script "window.scrollBy(0,10000)"
    return all(:css, CATEGORY_URL_LINK)[index][:href]
  end

  def click_order_btn
    page.execute_script "window.scrollBy(0,10000)"
    find(:xpath, ORDER_BTN).click
  end 

  def click_order_now_btn
    find(:xpath, ORDER_NOW_BTN).click
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

  def footer_visible?
    has_css?('footer-container', visible: true)
  end

end