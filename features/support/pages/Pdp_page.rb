# frozen_string_literal: true

# Class to get the elements content
class PDPPage
  include Capybara::DSL

  # Buttons
  ADD_TO_CART_BTN = 'button[data-testid="addToCart"]'

  # Notifications
  NOTIFICATION_MSG = 'notificationMessage'
  NOTIFICATION_MSG_CSS = '#product .message'

  # Fields
  QUANTITY_FLD = '#product .base-input-number__input'

  # Notifications
  OK_MSG = '#notificationAction1'
  PROCEED_TO_CHECKOUT_MSG = '#notificationAction2'

  # DIV
  PDP_DIV = 'product'
  
end
