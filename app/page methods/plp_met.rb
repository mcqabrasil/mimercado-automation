# Class to do the elements actions
require_relative '../pages/plp_page'

class PlpMethods < PlpPage
  include Capybara::DSL

  def click_prod_from_list(index)
    all(:dt, PRODUCT_LIST_LK)[index].click
  end

  def goto_pdp(url)
    visit(url)
  end

  def goto_plp
    visit("https://storefront-qa.mimercado.com/inicio")
  end

  def get_products_name(index)
    all(:dt, PRODUCT_TITLE_LBL)[index].text
  end

  def get_products_list_total_by_index(index)
    page.execute_script "window.scrollBy(0,10000)"
    if index < all(:dt, PRODUCT_LT).size
      puts all(:dt, PRODUCT_LT).size
      return all(:dt, PRODUCT_LT)[index]
    end
    return nil
  end

  def was_product_listed? 
    has_selector?(:dt, PRODUCT_LT)
  end

  def get_product_price(index)B
    all(:css, PRODUCT_PRICE_LBL)[index].text
  end

  def get_product_image(index)
    all(:dt, PRODUCT_IMG)[index][:src]
  end

end
