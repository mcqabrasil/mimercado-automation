# Class to do the elements actions
class PlpMethods < PlpPage
  include Capybara::DSL

  def click_prod_from_list(index)
    all(:dt, PRODUCT_FROM_LIST)[index].click
  end
end
