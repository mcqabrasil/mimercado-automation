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

  
end
