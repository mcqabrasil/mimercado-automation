# Class to get the elements content
class HomePage
  include Capybara::DSL
  
  # LINKS
  PRODUCT_LINK = '.product-item'.freeze # CLASS
  PRODUCT_HREF_LINK = '.product-item-photo'.freeze # CLASS
  SEE_ALL_PROD_LINK = 'home-see-all'
  CATEGORY_URL_LINK = '.category-url' # CLASS
  TERMS_CONDITIONS_LINK = 'tcLink'

  # BUTTON
  ORDER_TODAY_BTN = 'home-placeorder'
  ORDER_NOW_BTN = 'home-category-menu'
  CLOSE_COOKIES_BTN = 'closeCookieButton'
  CLOSE_POPUP_BTN = 'closeModalButton'

end


