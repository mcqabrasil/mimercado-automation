# frozen_string_literal: true

# Class to get the elements content

class PlpPage
  include Capybara::DSL

  # Links
  PRODUCT_LIST_LK = 'productLink'

  # Labels
  PRODUCT_TITLE_LBL = 'productTileName'
  PRODUCT_PRICE_LBL = '#category .text-price' # css

  # List
  PRODUCT_LT = 'productListingItem'

  # Image
  PRODUCT_IMG = 'productImage'
end
