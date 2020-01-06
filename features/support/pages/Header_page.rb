# frozen_string_literal: true

# Class to get the elements content
class HeaderPage
  include Capybara::DSL

  # Others
  CART_TOTAL_PRICE = '//*[@id="viewport"]/div[1]/header/div/div/div[4]/div/div/span'
end
