# frozen_string_literal: true

# Class to get the elements content
class PDPPage
  include Capybara::DSL

  # Buttons
  ADD_TO_CART_BTN = 'addToCart'

  # Notifications
  NOTIFICATION_MSG = 'notificationMessage'
  NOTIFICATION_MSG_CSS = '#product .message'
  OK_MSG = '#notificationAction1'
  PROCEED_TO_CHECKOUT_MSG = '#notificationAction2'
  QTY_ABOVE_ZERO_MSG = 'errorMessage'

  # Fields
  QUANTITY_FLD = 'quantity'

  # Divs
  PDP_DIV = 'product'
  SIMILAR_PROD_DIV = 'productListing'

  # Label
  PRICE_TOTAL_LB = 'pdpProductPrice'
  PRODUCT_NAME_LB = 'productName'
  PRODUCT_PRICE_LB = 'pdpProductPrice'
  ST_VL_PRICE_LB = '//*[@id="product"]/section[3]/div/div[2]/div[2]/ul/li[1]/p/span[2]' # temporary
  SN_VL_PRICE_LB = '//*[@id="product"]/section[3]/div/div[2]/div[2]/ul/li[2]/p/span[2]' # temporary
  THR_VL_PRICE_LB = '<span class="weight-700" data-v-346ce5b3="">$23.82 c/u</span>' # temporary
  FRT_VL_PRICE_LB = '//*[@id="product"]/section[3]/div/div[2]/div[2]/ul/li[4]/p/span[2]' # temporary

  # List
  ST_VL_PRICE_LT = 'tierPrice-0'
  SN_VL_PRICE_LT = 'tierPrice-1'
  THR_VL_PRICE_LT = 'tierPrice-2'
  FRT_VL_PRICE_LT = 'tierPrice-3'

  # Link
  PRODUCT_LK = 'productLink'
end
