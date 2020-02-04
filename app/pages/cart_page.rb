# Class to get the elements content
class CartPage
  include Capybara::DSL

  # Buttons
  BASKET_BTN = 'openMicrocart'
  CLEAR_CART_BTN = 'clearCartButton'
  CLOSE_CART_BTN = 'closeMicrocart'
  APPLY_DISCOUNT_CODE_BTN = 'addDiscountSection'
  ADD_DISCOUNT_BTN = 'addDiscountButton'
  ADD_DISCOUNT_CODE_BTN = 'addDiscountSection'
  REMOVE_PRODUCT = 'removeProduct-'
  CLEAR_COUPON = 'clearCouponButton'
  GO_TO_CHECKOUT_BTN = 'goToCheckoutButton'

  # Modals
  CART_VIEW = 'microcart'

  # Notifications
  OK_MSG = 'notificationAction2'
  REMOVE_ALL_CANCEL_MSG = 'notificationAction1'
  EMPTY_CART_MSG = 'emptyShoppingCartMessage'
  INVALID_COUPOM_MSG = 'notificationMessage'

  # Products
  PRODUCT_SKU = 'productSku'

  # Divs
  DISCOUNT_APPLIED_DIV = 'appliedCouponMessage'
  APPLY_COUPOM_DIV = '.coupon-wrapper' # CSS

  # Labels
  TOTAL_DISCOUNT_LBL = 'couponDiscount'
  TOTAL_PRICE_LBL = 'cartPrice'
  PRODUCT_PRICE_LBL = 'regularPrice'
  SUBTOTAL_PRICE_LBL = 'subtotal'
  TOTAL_SHIPPING_LBL = 'shipping'

  # Field
  DISCOUNT_CODE_FLD = 'couponinput' # NAME
  PROD_QUANTITY_FLD = 'quantity-' # NAME

  # Links
  RETURN_TO_SHOPPING_LINK = 'backShopping'
end
