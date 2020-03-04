# Class to do the elements actions
require_relative '../pages/plp_page'

class PlpMethods < PlpPage
  include Capybara::DSL

  def click_prod_from_list(index)
    all(:dt, PRODUCT_FROM_LIST)[index].click
  end

  def goto_pdp(url)
    visit(url)
  end

  def get_products_name(index)
    name = all(:dt, PRODUCT_TITLE_LBL)
    if index < name.size
      return name[index].text
    end
    return nil
  end

  def was_product_listed?
    has_selector?(:dt, PRODUCT_LIST)
  end

end
