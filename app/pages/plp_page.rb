# Class to get the elements content
class PlpPage
  include Capybara::DSL

  # Buttons
  PRODUCT_FROM_LIST = 'productLink'

  # Labels
  PRODUCT_TITLE_LBL = 'productTileName'

  # LIST
  PRODUCT_LIST = 'productListingItem'
end
