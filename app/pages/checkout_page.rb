# Class to get the elements content
class CheckoutPage
  include Capybara::DSL

  # LABELS
  ORDER_NUMBER_LBL = '//*[@id="checkout"]/div[2]/div/div/div/div/p[2]/span'

end