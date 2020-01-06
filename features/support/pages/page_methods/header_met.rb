class HeaderMethods < HeaderPage
  include Capybara::DSL

  def get_basket_total_price
    find(:xpath, CART_TOTAL_PRICE).text
  end
  
end
