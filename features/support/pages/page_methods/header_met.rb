class HeaderMethods < HeaderPage
  include Capybara::DSL

  def get_basket_quantity
    find(:dt, BASKET_QTY_ICON).text
  end
end
