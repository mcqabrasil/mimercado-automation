# frozen_string_literal: true

# Class to get the elements content
class PDPPage
  include Capybara::DSL

  # Buttons
  ADD_TO_CART_BTN = 'addToCart'

  # Notifications
  NOTIFICATION_MSG = 'notificationMessage'
  NOTIFICATION_MSG_CSS = '#product .message'

  # Fields
  QUANTITY_FLD = 'quantity'

  # Notifications
  OK_MSG = '#notificationAction1'
  PROCEED_TO_CHECKOUT_MSG = '#notificationAction2'
  QTY_ABOVE_ZERO_MSG = 'errorMessage'
  
  # DIV
  PDP_DIV = 'product'
  
  # Label
  PRICE_TOTAL_LABEL = 'pdpProductPrice' 
end
