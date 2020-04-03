# Class to do the elements actions
require_relative '../pages/checkout_page'

class CheckoutMethods < CheckoutPage
  include Capybara::DSL

  def get_order_number
    find(:xpath, ORDER_NUMBER_LBL).text
  end

end