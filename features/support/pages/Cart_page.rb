# frozen_string_literal: true

# Class to get the elements content
class CartPage
  include Capybara::DSL

  # Buttons
  BASKET_BTN = 'openMicrocart'
  CLEAR_CART_BTN = '.clearcart-col .brdr-none'
  CLOSE_CART_BTN = 'closeMicrocart'

  # Modals
  CART_VIEW = 'microcart'

  # Notifications
  REMOVE_ALL_OK_MSG = 'notificationAction2'
  REMOVE_ALL_CANCEL_MSG = 'notificationAction1'

  # Products
  PRODUCT_SKU = 'productSku'
end
